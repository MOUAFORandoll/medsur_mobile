import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'package:get/get.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';

import 'package:medsur_app/general_controllers/dataBase_controller.dart';
import 'package:medsur_app/modules/DashBoard/repo/dashboard_repo.dart';
import 'package:medsur_app/modules/alerte/constant/AlertPagetitle.dart';
import 'package:medsur_app/modules/alerte/constant/alert_level_color.dart';
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
import 'package:medsur_app/utils/routing.dart';
import 'package:medsur_app/utils/showToast.dart';
import 'package:medsur_app/utils/validators.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;
import 'package:flutter_sound/flutter_sound.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../../general_component/index_widgets.dart';

class AlerteController extends GetxController {
  final AlerteRepo alerteRepo;
  AlerteController({required this.alerteRepo});

  var loader = Load();
  var db = Get.find<DataBaseController>();
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

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

  reset() {
    // _nameController.clear();
    // _phoneController.clear();
    // _birthDayController.clear();
    // _poidsController.clear();
    // _emailController.clear();
    // _tailleController.clear();
    // _sexe = 'M';
    // _levelEmergency = _listLevelEmergency[0];
    // _listSelectSpeciality.clear();
    // _listSelectSpecialityF.clear();
    _currentIndex = 0;
    update();
  }

  setUserInfo() async {
    User user = await Get.find<AuthController>().user;

    if (user.name != '') {
      _nameController.text = user.name.toString();
      update();

      _emailController.text = user.email.toString();
      _phoneController.text =
          user.telephone.toString().split(' ').sublist(1).join('');

      update();
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
    vPoids();
    vTaille();
    if (personnalformKey.currentState!.validate()) {
      if (_errorW.length == 0 && _errorH.length == 0) {
        return true;
      }
    }
  }

  String _errorW = '';
  get errorW => _errorW;
  vPoids() {
    if (!Validators.validateWeight0(poidsController.text)) {
      // toastShowError('errorweight'.tr, Get.context);
      _errorW = 'errorweight'.tr;
      update();
      print(_errorW);
      return false;
    } else {
      _errorW = '';
      update();
    }
  }

  String _errorH = '';
  get errorH => _errorH;
  vTaille() {
    if (!Validators.validateHeight0(tailleController.text)) {
      // toastShowError('errorheight1'.tr, Get.context);
      _errorH = 'errorheight1'.tr;
      update();

      return false;
    } else {
      _errorH = '';
      update();
    }
  }
  
  check(i) {
    return i < 0 ? 0 : (i > 2 ? 1 : i);
  }

  String buildTitle() {
    switch (_currentIndex) {
      case 0:
        return AlertPagetitle.patientinformation;
      case 1:
        //   return AlertPagetitle.emergency;

        // case 2:
        return AlertPagetitle.speciality;
      default:
        return '';
    }
  }
  
  final _personnalformKey = GlobalKey<FormState>();
  get personnalformKey => _personnalformKey;
  final _emergencyformKey = GlobalKey<FormState>();
  get emergencyformKey => _emergencyformKey;
  final _specialityformKey = GlobalKey<FormState>();
  get specialityformKey => _specialityformKey;
  Widget buildContent() {
    switch (_currentIndex) {
      case 0:
        return PersonnalInformationView(
          dController: this,
        );
      case 1:
        //   return EmergencyView();
        // case 2:
        return SpecialityView(
          dController: this,
        );
      default:
        return PersonnalInformationView(
          dController: this,
        );
    }
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;
  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  TextEditingController _tailleController = TextEditingController();
  TextEditingController get tailleController => _tailleController;

  bool _hasTaille = false;
  get hasTaille => _hasTaille;
  setTaille(val) {
    try {
      _tailleController.text = _tailleController.text.isEmpty
          ? "0"
          : val
              ? checkVal(double.parse(_tailleController.text) + 0.1).toString()
              : checkVal(double.parse(_tailleController.text) - 0.1).toString();
      update();
      verifTaille();
    } catch (e) {
      _tailleController.text = "0";
      update();
    }
    vTaille();
  }

  verifTaille() {
    if (_tailleController.text.length > 5 &&
        double.tryParse(_tailleController.text) != null) {
      String firstThreeCharacters = _tailleController.text.substring(0, 5);
      _tailleController.text = firstThreeCharacters;
      _tailleController.selection = TextSelection.fromPosition(
        TextPosition(offset: firstThreeCharacters.length),
      );
      update();
    }
    _hasTaille = (!_tailleController.text.isEmpty &&
        _tailleController.text != "0" &&
        _tailleController.text != "0.0");

    update();
  }

  TextEditingController _poidsController = TextEditingController();
  TextEditingController get poidsController => _poidsController;
  bool _hasPoids = false;
  get hasPoids => _hasPoids;
  setPoids(val) {
    _poidsController.text.isEmpty
        ? _poidsController.text = "0"
        : _poidsController.text = val
            ? checkVal(double.parse(_poidsController.text) + 0.5).toString()
            : checkVal(double.parse(_poidsController.text) - 0.5).toString();
    verifPoids();
    update();
    vPoids();
    print(_poidsController.text);
  }

  verifPoids() {
    if (_poidsController.text.length > 5) {
      String firstThreeCharacters = _poidsController.text.substring(0, 5);
      _poidsController.text = firstThreeCharacters;
      _poidsController.selection = TextSelection.fromPosition(
        TextPosition(offset: firstThreeCharacters.length),
      );
      update();
    }
    update();

    _hasPoids = (!_poidsController.text.isEmpty &&
        _poidsController.text != "0" &&
        _poidsController.text != "0.0");

    update();
  }

  checkVal(val) {
    return val < 0 ? 0 : val;
  }

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController _birthDayController = TextEditingController();
  TextEditingController get birthDayController => _birthDayController;
  bool _hastext = false;
  get hastext => _hastext;
  setHasText(text) {
    _hastext = text.isNotEmpty;
    update();
  }

  bool _suiteSpeciality = false;
  bool get suiteSpeciality => _suiteSpeciality;
  setSuite() {
    _suiteSpeciality = !_suiteSpeciality;
    update();
  }

  List _listSelectSpeciality = [];
  List get listSelectSpeciality => _listSelectSpeciality;
  List _listSelectSpecialityF = [];
  List get listSelectSpecialityF => _listSelectSpecialityF;
  addSpeciality(value, isActualise) {
    // print(value);
    if (!_listSelectSpeciality.contains(value)) {
      _listSelectSpeciality.add(value);
      listSelectSpecialityF.add(value.id);
    } else {
      removeSpeciality(value);
    }
    // _searchSpeController.text = '';
    update();
    // print(searchSpeController.text);
    //
    //
    if (isActualise) {
      Get.back();
      newAlerte();
    }
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
        Response response = await alerteRepo.getSpeciality();

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

  bool _loadLevelEmergency = true;
  bool get loadLevelEmergency => _loadLevelEmergency;

  List<EmergencyModel> _listLevelEmergency = [];
  List<EmergencyModel> get listLevelEmergency => _listLevelEmergency;

  EmergencyModel _levelEmergency = new EmergencyModel(id: 1, valeur: 1);

  EmergencyModel get levelEmergency => _levelEmergency;
  setLevelEmergence(val) {
    _levelEmergency = val;
    update();
  }

  get_decription_niveau_urgence() {
    toastShowNiveauUrgence(
        Get.find<ActionController>().lang.toLowerCase() == 'en'
            ? levelEmergency.description_en
            : levelEmergency.description,
        AlerteLevelColor.colorForLevel(levelEmergency.id.toString()),
        Get.context);
  }

  getLevelEmergency() async {
    var userDB = await db.getUserInfo();

    if (userDB['id'] != 0) {
      try {
        Response response = await alerteRepo.getLevelEmergency();

        if (response.body != null && _listLevelEmergency.isEmpty) {
          if (response.body['data'] != null) {
            // _listLevelEmergency.clear();
            // update();

            print(response.body['data']);
            _listLevelEmergency.addAll((response.body['data'] as List)
                .map((e) => EmergencyModel.fromJson(e))
                .toList());
            _levelEmergency = _listLevelEmergency[0];

            update();
            //print(_levelEmergency);
            _loadLevelEmergency = false;
            update();
          }
        }
      } catch (e) {
        _loadLevelEmergency = false;
        update();
        //print(e);
      }
    }
  }
  
  onInit() {
    super.onInit();
    printT();
    setUserInfo();
    getHistoryParamUserAlert();
    // _initSpeech();
  }
  
  var position;
  printT() async {
    String? countryCode = ui.window.locale.languageCode;
    //print('Pays de l\'utilisateur: $countryCode');
    if (await Permission.location.request().isGranted) {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      update();
      print(
          '!!!!!!!!!!!!!!!!!!!!______________________________________---------');
      
      print(position);
    } else {
      await Permission.location.request();
      //print('position______________________________________---------');
    }
  }

  bool _loadAlerte = true;
  bool get loadAlerte => _loadAlerte;
  List<EtablissementModel> _listEtablissement = [];
  List<EtablissementModel> get listEtablissement => _listEtablissement;

  String _sexe = 'M';
  String get sexe => _sexe;
  int _sexeInt = 0;
  int get sexeInt => _sexeInt;
  setSexe(s) {
    _sexeInt = s;
    print(_sexeInt);

    _sexe = _sexeInt == 0 ? 'M' : 'F';
    update();
    print(_sexe);
  }

  int alert_id = 0;
  closeList() {
    Get.back();
  }

  SpeechToText _speechToText = SpeechToText();
  get speechToText => _speechToText;
  bool _speechEnabled = false;

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    update();
  }

  void startListening() async {
    await _speechToText.listen(
      onResult: _onSpeechResult,
      localeId: 'fr-FR',
    );
    update();
  }

  void stopListening() async {
    await _speechToText.stop();
    update();
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    print(result.recognizedWords);

    descriptionController.text += " " + result.recognizedWords;
    update();
  }

  newAlerte() async {
    _selectEtablissement = null;
    update();
    var userDB = await db.getUserInfo();

    var data = {
      "user_id": userDB['id'],
      "level_urgence": _levelEmergency.valeur,
      "nom_user": nameController.text,
      "speciality": listSelectSpecialityF,
      "phone_user": phoneController.text,
      "birthday_user": birthDayController.text,
      "poids_user": poidsController.text,
      "taille_user": tailleController.text,
      "email_user": emailController.text,
      "description": descriptionController.text.isEmpty
          ? 'Aucune'
          : descriptionController.text,
      "ville_user": userDB['ville'],
      "longitude_user": position.longitude,
      "latitude_user": position.latitude,
      "sexe_user": sexe
    };
    print(data);
    try {
      loader.open();
      _listEtablissement = [];
      _listCategories = [];
      update();
      Response response = await alerteRepo.newAlerte(data);
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body['data']);
        if (response.body != null) {
          if (response.body['data'] != null) {
            print(response.body['data']);
            _listEtablissement.addAll((response.body['data']['data'] as List)
                .map((e) => EtablissementModel.fromJson(e))
                .toList());
            _listCategories.addAll((response.body['data']['categories'] as List)
                .map((e) => Categories.fromJson(e))
                .toList());
            resetFilterCategories();
            alert_id = response.body['data']['alert_id'];
            update();
            loader.close();

            update();

            Get.toNamed(AppLinks.LIST_ETABLISSEMENT);
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

  resetFilterCategories() {
    _iscategories = false;
    _categorie = new Categories(libelle: "Tous", libelle_en: "All");
    _listSearchEtablissement.clear();
    _listCategoriesSelect.clear();
    update();
  }

  bool _iscategories = false;
  bool get iscategories => _iscategories;
  Categories _categorie = new Categories(libelle: "Tous", libelle_en: "All");
  Categories get categorie => _categorie;
  List<Categories> _listCategories = [];
  List<Categories> get listCategories => _listCategories;

  List<Categories> _listCategoriesSelect = [];
  List<Categories> get listCategoriesSelect => _listCategoriesSelect;
  isContainCategorie(Categories categorieselect) =>
      _listCategoriesSelect.contains(categorieselect);

  filterCategorie0(Categories categorieselect) {
    _iscategories = true;

    _listSearchEtablissement = [];
    _categorie = categorieselect;
    _listCategoriesSelect.contains(categorieselect)
        ? _listCategoriesSelect.remove(categorieselect)
        : _listCategoriesSelect.add(categorieselect);

    print("-----------------------${_listCategoriesSelect.length}");
    filterCategorieForList();
  }

  filterCategorieForList() {
    if (_listCategoriesSelect.isEmpty) {
      resetFilterCategories();
    } else {
      update();
      _listSearchEtablissement.clear();
      listEtablissement.forEach((element) {
        bool hasAllCategories = true;
        _listCategoriesSelect.forEach((catego) {
          bool containsCategory = false;
          element.categories!.forEach((categ) {
            if (categ.id == catego.id) {
              containsCategory = true;
              return;
            }
          });
          if (!containsCategory) {
            hasAllCategories = false;
            return;
          }
        });
        if (hasAllCategories) {
          _listSearchEtablissement.add(element);
        }
      });
      update();
    }
    print('-->>>>---${_listSearchEtablissement.length}');
  }

  // filterCategorieForList() {
  //   if (_listCategoriesSelect.length == 0) {
  //     resetFilterCategories();
  //   } else {
  //     update();
  //     _listCategoriesSelect.forEach((catego) {
  //       listEtablissement.forEach((element) {
  //         element.categories!.forEach((categ) {
  //           if (categ.id == catego.id &&
  //               !_listSearchEtablissement.contains(element))
  //             _listSearchEtablissement.add(element);
  //           update();
  //         });
  //       });
  //     });
  //   }
  //   print('-->>>>---${_listSearchEtablissement.length}');
  // }

  filterCategorie(Categories catego) {
    _iscategories = true;
    // _listSearchEtablissement = listEtablissement
    //     .where((element) => element.categories!.contains(catego.id))
    //     .toList();
    _listSearchEtablissement = [];
    _categorie = catego;

    update();
    listEtablissement.forEach((element) {
      element.categories!.forEach((categ) {
        if (categ.id == catego.id &&
            !_listSearchEtablissement.contains(element))
          _listSearchEtablissement.add(element);
        update();
      });
    });

    print('-->>>>---${_listSearchEtablissement.length}');
  }

  List<EtablissementModel> _listSearchEtablissement = [];
  List<EtablissementModel> get listSearchEtablissement =>
      _listSearchEtablissement;

  TextEditingController _searchEtownController = TextEditingController();
  TextEditingController get searchEtownController => _searchEtownController;
  searchEtablissementForTown() {
    _listSearchEtablissement = listEtablissement
        .where((element) => element.localisation!.ville!
            .trim()
            .toLowerCase()
            .contains(searchEtownController.text.trim().toLowerCase()))
        .toList();
    update();
  }

  subScribeAlerte() async {
    var data = {
      "etablissement_id": selectEtablissement.id,
    };
    loader.open();
    try {
      Response response = await alerteRepo.subScirbeAlerte(alert_id, data);
      if (response.statusCode == 200) {
        getUserAlert();
        getHistoryParamUserAlert();
        loader.close();

        return true;
      } else {
        loader.close();
        print(response.body);
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
      print(e);
      toastShowError("errors".tr, Get.context);

      update();
    }
  }

  var _selectEtablissement = null;
  get selectEtablissement => _selectEtablissement;
  bool isEtablissment(etablissement) {
    if (selectEtablissement == null) {
      return false;
    } else {
      return selectEtablissement.name == etablissement.name;
    }
  }

  selectE(EtablissementModel etablissement) {
    _selectEtablissement = etablissement;
    update();
  }

  bool _loadUserAlert = true;
  bool get loadUserAlert => _loadUserAlert;

  List<UserAlertModel> _listUserAlert = [];
  List<UserAlertModel> get listUserAlert => _listUserAlert;

  getHistoryParamUserAlert() async {
    var userDB = await db.getUserInfo();

    if (userDB['id'] != 0) {
      try {
        Response response =
            await alerteRepo.getHistoryParamUserAlert(userDB['id']);

        if (response.body != null) {
          if (response.body['data'] != null) {
            print(response.body['data']);
            _poidsController.text = response.body['data']['poids'];
            _tailleController.text = response.body['data']['taille'];
            _birthDayController.text = response.body['data']['birthDay'];

            _sexeInt = response.body['data']['sexe'] == 'M' ? 0 : 1;
            verifPoids();
            verifTaille();
            update();
          } else {
            _poidsController.text = "0";
            _tailleController.text = "0";
          }
        } else {
          _poidsController.text = "0";
          _tailleController.text = "0";
          _loadUserAlert = false;
          update();
        }
      } catch (e) {
        _loadUserAlert = false;
        update();
      }
    }
  }

  emptyData() {
    _listUserAlert = [];
    _listUserAlert.clear();
    _poidsController.text = "0";
    _tailleController.text = "0";
    _birthDayController.clear();
    update();
  }

  getUserAlert() async {
    var userDB = await db.getUserInfo();
    if (userDB['id'] != 0) {
      try {
        Response response = await alerteRepo.getUserAlertList(userDB['id']);

        if (response.body['data'] != null) {
          if (response.body != null) {
            _listUserAlert.clear();
            update();
            _listUserAlert.addAll((response.body['data']['data'] as List)
                .map((e) => UserAlertModel.fromJson(e))
                .toList());

            _loadUserAlert = false;
            update();
          } else {
            _loadUserAlert = false;
            update();
          }
        } else {
          _loadUserAlert = false;
          update();
        }
      } catch (e) {
        _loadUserAlert = false;
        update();
        //print(e);
      }
    }
  }

  TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;
  List<UserAlertModel> _listSearchAlert = [];
  List<UserAlertModel> get listSearchAlert => _listSearchAlert;
  searchAlertt() {
    _listSearchAlert = listUserAlert
        .where((element) => element.nameUser!
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
    update();
    //print(_listSearchAlert.length);
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
  // void startRecording() async {
  //   await _soundRecorder.openRecorder();
  //   await _soundRecorder.startRecorder(toFile: 'path/to/save/recording.aac');
  // }

  // void stopRecordingAndConvertToText() async {
  //   await _soundRecorder.stopRecorder();
  //   await _soundRecorder.closeRecorder();

  //   String path = 'path/to/save/recording.aac';
  //   bool recognized = await _speechToText.initialize();
  //   //  if (recognized) {
  //   //   _speechToText.listen(onResult: resultListener);
  //   // } else {
  //   //   //print("The user has denied the use of speech recognition.");
  //   // }
  //   //print('Recognized Text: $recognized');
  // }

  // FlutterSoundRecorder _soundRecorder = FlutterSoundRecorder();
  // stt.SpeechToText _speechToText = stt.SpeechToText();
}
