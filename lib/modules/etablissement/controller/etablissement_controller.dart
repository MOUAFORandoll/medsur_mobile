import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';

import 'package:medsur_app/general_controllers/dataBase_controller.dart';
import 'package:medsur_app/modules/DashBoard/repo/dashboard_repo.dart';
import 'package:medsur_app/modules/alerte/models/speciality_model.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';

import 'package:medsur_app/modules/etablissement/constant/etablissement_page_title.dart';
import 'package:medsur_app/modules/etablissement/models/alert_model.dart';
import 'package:medsur_app/modules/etablissement/models/etablissement_model.dart';
import 'package:medsur_app/modules/etablissement/repo/etablissement_repo.dart';
import 'package:medsur_app/modules/etablissement/views/first_step.dart';
import 'package:medsur_app/modules/etablissement/views/second_step.dart';
import 'package:medsur_app/modules/etablissement/views/success_etablissement_view.dart';
import 'package:medsur_app/modules/etablissement/views/tird_step.dart';
import 'package:medsur_app/utils/routing.dart';
import 'package:medsur_app/utils/showToast.dart';
import '../../../general_component/index_widgets.dart';
import '../../alerte/models/user_alert_model.dart';

class EtablissementController extends GetxController {
  final EtablissementRepo etablissementRepo;
  EtablissementController({required this.etablissementRepo});

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  String buildTitle() {
    switch (_currentIndex) {
      case 0:
        return EtablissementPagetitle.first_step;
      case 1:
        return EtablissementPagetitle.second_step;
      case 2:
        return EtablissementPagetitle.tird_step;
      default:
        return '';
    }
  }

  TextEditingController _searchSpeController = TextEditingController();
  TextEditingController get searchSpeController => _searchSpeController;

  List<SpecialityModel> _listSearchSpe = [];
  List<SpecialityModel> get listSearchSpe => _listSearchSpe;
  isIntoSpe(id) {
    print(listSelectSpeciality
        .contains(listSearchSpe.where((element) => element.id == id)));
    return listSelectSpeciality
        .contains(listSearchSpe.where((element) => element.id == id));
  }

  searchSpe() {
    print(searchSpeController.text);

    _listSearchSpe = _listSpeciality
        .where((element) => (((element.libelle
                    .toLowerCase()
                    .contains(searchSpeController.text.toLowerCase())) ||
                (element.libelle_en
                    .toLowerCase()
                    .contains(searchSpeController.text.toLowerCase()))) &&
            containsSpecialite(element)))
        .toList();

    update();
    print(listSearchSpe.length);
    //print(_listSearchAlert.length);
  }

  containsSpecialite(element) {
    var filteredSpecialites = _listSelectSpeciality
        .where((specialite) => specialite.id == element.id)
        .toList();

    print(filteredSpecialites);
    return filteredSpecialites.length == 0;
  }

  verfi() {
    if (currentIndex == 0) {
      _firststepformKey.currentState!.validate();
      if (nameController.text.isEmpty ||
          phoneController.text.isEmpty ||
          emailController.text.isEmpty ||
          boitePostaleController.text.isEmpty ||
          descriptionController.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    }
    if (currentIndex == 1) {
      if (listSelectSpeciality.isEmpty) {
        toastShowError("spte".tr, Get.context);

        return false;
      } else {
        return true;
      }
    }
    if (currentIndex == 2) {
      return true;
    }
  }

  changePageIndex(bool i) {
    if (i) {
      var verif = verfi();
      if (verif) {
        _currentIndex = i ? check(_currentIndex + 1) : check(_currentIndex - 1);
        update();
        buildTitle();
        buildContent();
      }
    } else {
      _currentIndex = i ? check(_currentIndex + 1) : check(_currentIndex - 1);

      update();
    }
  }

  check(i) {
    return i < 0 ? 0 : (i > 2 ? 1 : i);
  }

  final _firststepformKey = GlobalKey<FormState>();
  get firststepformKey => _firststepformKey;
  final secondstepformKey = GlobalKey<FormState>();
  final tirdstepformKey = GlobalKey<FormState>();
  Widget buildContent() {
    switch (_currentIndex) {
      case 0:
        return FirstStepView(
          dController: this,
        );
      case 1:
        //   return EmergencyView();
        // case 2:
        return SecondStepView(
          dController: this,
        );
      case 2:
        //   return EmergencyView();
        // case 2:
        return TirdStepView(
          dController: this,
        );
      default:
        return FirstStepView(
          dController: this,
        );
    }
  }

  var loader = Load();
  var db = Get.find<DataBaseController>();
  var action = Get.find<ActionController>();

  List _listSelectSpeciality = [];
  List get listSelectSpeciality => _listSelectSpeciality;
  List _listSelectSpecialityF = [];
  List get listSelectSpecialityF => _listSelectSpecialityF;
  addSpeciality(value) {
    if (!_listSelectSpeciality.contains(value)) {
      _listSelectSpeciality.add(value);
      listSelectSpecialityF.add(value.id);
    } else {
      removeSpeciality(value);
    }
    print(listSelectSpeciality.length);
    update();
  }

  removeSpeciality(value) {
    _listSelectSpeciality.remove(value);
    listSelectSpecialityF.remove(value.id);
    update();
  }

  isContainSpeciality(SpecialityModel specialite) =>
      _listSelectSpeciality.contains(specialite);

  bool _loadSpeciality = true;
  bool get loadSpeciality => _loadSpeciality;

  List<SpecialityModel> _listSpeciality = [];
  List<SpecialityModel> get listSpeciality => _listSpeciality;
  getSpeciality() async {
    var userDB = await db.getUserInfo();

    if (userDB['id'] != 0) {
      try {
        Response response = await etablissementRepo.getSpeciality();

        if (response.body != null && _listSpeciality.isEmpty) {
          _listSpeciality.addAll((response.body['data'] as List)
              .map((e) => SpecialityModel.fromJson(e))
              .toList());
          _loadSpeciality = false;
          update();
        } else {
          // _loadSpeciality = false;
          // update();
        }
      } catch (e) {
        _loadSpeciality = false;
        update();
        //print(e);
      }
    }
    return _listSpeciality;
  }

  List _agenda = Get.find<ActionController>().lang.toLowerCase() == 'en'
      ? [
          ['Monday', "08:00", '18:00', 1],
          ['Tuesday', "08:00", '18:00', 2],
          ['Wednesday', "08:00", '18:00', 3],
          ['Thursday', "08:00", '18:00', 4],
          ['Friday', "08:00", '18:00', 5],
          ['Saturday', "08:00", '18:00', 6],
          ['Sunday', "08:00", '18:00', 7]
        ]
      : [
          ['Lundi', "08:00", '18:00', 1],
          ['Mardi', "08:00", '18:00', 2],
          ['Mercredi', "08:00", '18:00', 3],
          ['Jeudi', "08:00", '18:00', 4],
          ['Vendredi', "08:00", '18:00', 5],
          ['Samedi', "08:00", '18:00', 6],
          ['Dimanche', "08:00", '18:00', 7]
        ];

  get agenda => _agenda;
  setDateDebut(day, value) {
    var index = _agenda.indexWhere((element) => element[0] == day);
    print(index);
    _agenda[index][1] = value;
    update();
  }

  setDateFin(day, value) {
    var index = _agenda.indexWhere((element) => element[0] == day);
    _agenda[index][2] = value;
    update();
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;
  TextEditingController _phoneUrgenceController = TextEditingController();
  TextEditingController get phoneUrgenceController => _phoneUrgenceController;
  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  TextEditingController _boitePostaleController = TextEditingController();
  TextEditingController get boitePostaleController => _boitePostaleController;

  bool _selectedPosition = false;
  bool get selectedPosition => _selectedPosition;

  setPosition(LatLng value) {
    longitude = value.longitude;
    latitude = value.latitude;
    _selectedPosition = true;
    update();
    print(longitude);
  }

  var longitude = 0.0;
  var latitude = 0.0;
  getPosition() {
    longitude = action.position.longitude;
    latitude = action.position.latitude;
    _selectedPosition = true;

    update();
    print(_selectedPosition);
  }

  changePosition() {
    _selectedPosition = false;

    update();
  }

  newEtablissement() async {
    var userDB = await db.getUserInfo();

    var data = {
      "name": nameController.text,
      "phone": phoneController.text,
      "email": emailController.text,
      "description": descriptionController.text,
      "boite_postale": boitePostaleController.text,
      "pays": userDB['pays'],
      "ville": userDB['ville'],
      "longitude": longitude,
      "latitude": latitude,
      "speciality": listSelectSpecialityF,
      'agenda': agenda,
      "user_id": userDB['id'],
    };
    print(data);
    try {
      loader.open();

      update();
      Response response = await etablissementRepo.newEtablissement(data);
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body['data']);
        if (response.body != null) {
          if (response.body['data'] != null) {
            print(response.body['data']);

            update();
            loader.close();
            Get.offNamedUntil(AppLinks.SUCCESSETABLISSEMENT, (route) => false);
            await getEtablissementForUser();
          }
        }
      } else {
        loader.close();
        if (response.body == null) {
          toastShowError("errors".tr, Get.context);
          return false;
        }
        checkError(false, response.body);
        update();
        return false;
      }
    } catch (e) {
      // loader.close();
      toastShowError("errors".tr, Get.context);

      update();
      //print(e);
      return false;
    }
  }

  updateEtablissement() async {
    var data = {
      "name": nameController.text,
      "phone": phoneController.text,
      "email": emailController.text,
      "description": descriptionController.text,
      "boite_postale": boitePostaleController.text,
    };
    print(data);
    try {
      loader.open();

      update();
      Response response =
          await etablissementRepo.updateEtablissement(etablissement.id, data);
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body['data']);
        if (response.body != null) {
          if (response.body['data'] != null) {
            print(response.body['data']);

            update();
            loader.close();

            await getEtablissementForUser();
            await updateConcernEtablissement();
          }
        }
      } else {
        loader.close();
        if (response.body == null) {
          toastShowError("errors".tr, Get.context);
          return false;
        }
        checkError(false, response.body);
        update();
        return false;
      }
    } catch (e) {
      // loader.close();
      toastShowError("errors".tr, Get.context);

      update();
      //print(e);
      return false;
    }
  }

  updateConcernEtablissement() {
    _etablissement =
        _listEtablissement.where((obj) => obj.id == _etablissement.id).first;
    print('update${_etablissement.id}');
    // update();
  }

  selectEtablissement(EtablissementModel etablissement) {
    _etablissement = etablissement;
    filterSpeciality();

    nameController.text = _etablissement.name;
    phoneController.text = _etablissement.phone;

    emailController.text = _etablissement.email;

    descriptionController.text = _etablissement.description;

    boitePostaleController.text = _etablissement.localisation.boitePostale;

    update();
    Get.toNamed(AppLinks.ETABLISSEMENT_GESTIOM);
  }

  unselectEtablissement() {
    nameController.clear();
    phoneController.clear();

    emailController.clear();

    descriptionController.clear();

    boitePostaleController.clear();

    update();
  }

  var _etablissement;
  get etablissement => _etablissement;
  int _loadeta = 0;
  get loadetat => _loadeta;

  List _listSpecialitySecond = [];
  List get listSpecialitySecond => _listSpecialitySecond;

  List<EtablissementModel> _listEtablissement = [];
  List<EtablissementModel> get listEtablissement => _listEtablissement;
  getEtablissementForUser() async {
    var userDB = await db.getUserInfo();

    if (userDB['id'] != 0) {
      // loader.open();
      try {
        _loadeta = 0;

        Response response =
            await etablissementRepo.getEtablissementForuser(userDB['id']);
        if (response.statusCode == 200) {
          print(response.body);

          List<EtablissementModel> data = [];
          data.addAll((response.body['data'] as List)
              .map((e) => EtablissementModel.fromJson(e))
              .toList());
          _listEtablissement = data;
          print(_listEtablissement.length);
          // filterSpeciality();

          // nameController.text = _etablissement.name;
          // phoneController.text = _etablissement.phone;

          // emailController.text = _etablissement.email;

          // descriptionController.text = _etablissement.description;

          // boitePostaleController.text =
          //     _etablissement.localisation.boitePostale;
          _loadeta = 1;

          update();
        } else {
          _loadeta = 2;
          update();
        }
      } catch (e) {
        // loader.close();
        print(e);
        _loadeta = 2;
        update();

        update();
      }
    }
  }

  setDateDebut0(id, value) {
    var index =
        _etablissement.agendas.indexWhere((element) => element.pivot.id == id);
    print(index);
    _etablissement.agendas[index].pivot.debut = value;
    update();
  }

  setDateFin0(id, value) {
    var index =
        _etablissement.agendas.indexWhere((element) => element.pivot.id == id);
    print(index);
    _etablissement.agendas[index].pivot.fin = value;
    update();
  }

  void cleanData() {
    _etablissement = null;
    _listSpecialitySecond = [];
    _listSelectSpeciality = [];
    _listSelectSpecialityF = [];
    _listEtablissement = [];
    _currentIndex = 0;
    _nameController.clear();
    _phoneController.clear();
    _phoneUrgenceController.clear();
    _emailController.clear();
    _descriptionController.clear();
    _boitePostaleController.clear();
    _searchSpeController.clear();
    update();
  }

  void filterSpeciality() {
    _listSpecialitySecond = _listSpeciality.where((obj) {
      // Retourner true si l'objet n'appartient pas à etablissement.specialites
      return !etablissement.specialites.any((obj1) => obj.id == obj1.id);
    }).toList();
    update();
    print(_listSpeciality.length);
    print(_listSelectSpeciality.length);
    print(_listSpecialitySecond.length);
  }

  removeSpecialite(specialite_id) async {
    try {
      loader.open();
      Response response = await etablissementRepo.removeSpecialiteEtablissement(
          _etablissement.id, specialite_id);

      if (response.body['data'] != null) {
        if (response.body != null) {
          // _etablissement = EtablissementModel.fromJson(response.body['data']);
          await getEtablissementForUser();
          await updateConcernEtablissement();
          filterSpeciality();

          loader.close();

          update();
        } else {
          loader.close();
          update();
        }
      } else {
        loader.close();
        update();
      }
    } catch (e) {
      loader.close();
      update();
      //print(e);
    }
  }

  addSpecialite(specialite_id) async {
    try {
      loader.open();
      Response response = await etablissementRepo.addSpecialiteEtablissement(
          _etablissement.id, specialite_id);

      if (response.body['data'] != null) {
        if (response.body != null) {
          // _etablissement = EtablissementModel.fromJson(response.body['data']);
          await getEtablissementForUser();
          await updateConcernEtablissement();
          filterSpeciality();

          loader.close();
          ;
          update();
        } else {
          loader.close();
          update();
        }
      } else {
        loader.close();
        update();
      }
    } catch (e) {
      loader.close();
      update();
      //print(e);
    }
  }

  agendaUpdate(agenda, data) async {
    try {
      loader.open();
      Response response =
          await etablissementRepo.updateAgendaEtablissement(agenda, data);

      if (response.body['data'] != null) {
        if (response.body != null) {
          await getEtablissementForUser();
          await updateConcernEtablissement();
          loader.close();
        } else {
          loader.close();
          // update();
        }
      } else {
        loader.close();
        // update();
      }
    } catch (e) {
      loader.close();
      // update();
      //print(e);
    }
  }

  sendMailAsActivation() async {
    try {
      loader.open();
      Response response =
          await etablissementRepo.sendMailAsActivation(_etablissement.id);

      if (response.body['data'] != null) {
        if (response.body != null) {
          loader.close();
          ;
          update();
        } else {
          loader.close();
          update();
        }
      } else {
        loader.close();
        update();
      }
    } catch (e) {
      loader.close();
      update();
      //print(e);
    }
  }

  bool _loadAlert = true;
  bool get loadAlert => _loadAlert;

  List<AlertModel> _listAlert = [];
  List<AlertModel> get listAlert => _listAlert;

  getEtablissementAlert() async {
    var userDB = await db.getUserInfo();
    if (userDB['id'] != 0) {
      try {
        Response response =
            await etablissementRepo.getAlertList(_etablissement.id);

        if (response.body['data'] != null) {
          if (response.body != null) {
            _listAlert.clear();
            update();
            _listAlert.addAll((response.body['data']['data'] as List)
                .map((e) => AlertModel.fromJson(e))
                .toList());

            _loadAlert = false;
            update();
          } else {
            _loadAlert = false;
            update();
          }
        } else {
          _loadAlert = false;
          update();
        }
      } catch (e) {
        _loadAlert = false;
        update();
        //print(e);
      }
    }
  }

  TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;
  List<AlertModel> _listSearchAlert = [];
  List<AlertModel> get listSearchAlert => _listSearchAlert;
  searchAlertt() {
    _listSearchAlert = listAlert
        .where((element) => element.nameUser!
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
    update();
    //print(_listSearchAlert.length);
  }
}
