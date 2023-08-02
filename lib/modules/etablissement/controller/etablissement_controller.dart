import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'package:get/get.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';

import 'package:medsur_app/general_controllers/dataBase_controller.dart';
import 'package:medsur_app/modules/DashBoard/repo/dashboard_repo.dart';
import 'package:medsur_app/modules/alerte/constant/AlertPagetitle.dart';
import 'package:medsur_app/modules/alerte/constant/alert_level_color.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/models/emergency_model.dart';
import 'package:medsur_app/modules/alerte/models/etablissement_model.dart';
import 'package:medsur_app/modules/alerte/models/speciality_model.dart';
import 'package:medsur_app/modules/alerte/models/user_alert_model.dart';
import 'package:medsur_app/modules/alerte/repo/alerte_repo.dart';
import 'package:medsur_app/modules/alerte/views/emergency_view.dart';
import 'package:medsur_app/modules/alerte/views/personnal_information_view.dart';
import 'package:medsur_app/modules/alerte/views/speciality_view.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medsur_app/modules/auth/models/oauth.dart';
import 'package:medsur_app/modules/etablissement/constant/etablissement_page_title.dart';
import 'package:medsur_app/modules/etablissement/repo/etablissement_repo.dart';
import 'package:medsur_app/modules/etablissement/views/first_step.dart';
import 'package:medsur_app/modules/etablissement/views/second_step.dart';
import 'package:medsur_app/utils/routing.dart';
import 'package:medsur_app/utils/showToast.dart';
import 'package:medsur_app/utils/validators.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;
import 'package:flutter_sound/flutter_sound.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../../general_component/index_widgets.dart';

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
        //   return EtablissementPagetitle.emergency;

        // case 2:
        return EtablissementPagetitle.second_step;
      default:
        return '';
    }
  }

  verfi() {
    // if (_levelEmergency.valeur == null) {
    //   toastShowError('errornvd'.tr, Get.context);

    //   return false;
    // }
    // if (nameController.text.length == 0) {
    //   toastShowError('errorname1'.tr, Get.context);

    //   return false;
    // }
    // if (emailController.text.length == 0) {
    //   toastShowError('invalidMail'.tr, Get.context);

    //   return false;
    // }
    // if (birthDayController.text.length == 0) {
    //   toastShowError('invalidDate'.tr, Get.context);

    //   return false;
    // }
    // if (poidsController.text.length == 0 || poidsController.text == '0') {
    //   toastShowError('errorweight'.tr, Get.context);

    //   return false;
    // }
    // if (tailleController.text.length == 0 || tailleController.text == '0') {
    //   toastShowError('errorheight1'.tr, Get.context);

    //   return false;
    // }
    // vPoids();
    // vTaille();
    // if (personnalformKey.currentState!.validate()) {
    //   if (_errorW.length == 0 && _errorH.length == 0) {
    return true;
    // }
    // }
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
  final _secondstepformKey = GlobalKey<FormState>();
  get secondstepformKey => _secondstepformKey;
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
      "longitude": action.position.longitude,
      "latitude": action.position.latitude,
      "speciality": listSelectSpecialityF,
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
}
