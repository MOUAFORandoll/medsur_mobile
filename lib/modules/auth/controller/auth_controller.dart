import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:medsur_app/constants/apiRoute.dart';
import 'package:medsur_app/core.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:medsur_app/modules/home/controller/home_controller.dart';
import 'package:medsur_app/utils/ApiClient.dart';
import 'package:medsur_app/utils/routing.dart';
import 'package:connectivity/connectivity.dart';
import 'package:medsur_app/utils/showToast.dart';
import '../../../general_component/index_widgets.dart';
import 'package:medsur_app/modules/auth/models/oauth.dart';
import 'package:medsur_app/modules/auth/repo/auth_repo.dart';
import 'package:medsur_app/general_controllers/dataBase_controller.dart';

import 'package:jwt_decoder/jwt_decoder.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});
  final _connectivity = Connectivity();

  var db = Get.find<DataBaseController>();
  var loader = Load();
  int _isLoaded = 0;
  int get isLoaded => _isLoaded;
  String clientId = '2';
  String clientSecret = 'EgDwYss1HthxUbAjbRViO0QaNF82gsJIyCiKXiZr';
  // 0=> init
  // 1=> start load
  // 2=> correct login
  // 3=> error login
  int _isConnected = 0;
  int get isConnected => _isConnected;
  User _user = User(name: '');
  User get user => _user;
  @override
  void onInit() {
    super.onInit();
    stateData();
  }

  bool _validMailLogin = false;

  get validMailLogin => _validMailLogin;

  validMailLoginU(newValidMail) {
    _validMailLogin = newValidMail;
    update();
  }

  bool _validMailForgot = false;

  get validMailForgot => _validMailForgot;

  validMailForgotU(newValidMail) {
    _validMailForgot = newValidMail;
    update();
  }

  bool _isInternet = true;
  bool get isInternet => _isInternet;
  void stateData() {
    super.onInit();

    _connectivity.onConnectivityChanged.listen((event) async {
      //event == 0 -=>none
      //event == 1 -=> mobile
      //event == 0 -=> wifi

      if (event == ConnectivityResult.none) {
        _isInternet = false;
        update();
      } else if (event != ConnectivityResult.none) {
        _isInternet = true;
        update();
        await initApp();
        await startApp();
      }
    });
  }

  syncUsersDB() async {
    await getUserinfo_OL();
  }

  syncUsersOnline() async {
    await getUserinfo_BD();
  }

  TextEditingController _regNameController = TextEditingController();
  TextEditingController get regNameController => _regNameController;
  TextEditingController _regSurnameController = TextEditingController();
  TextEditingController get regSurnameController => _regSurnameController;
  TextEditingController _regEmailController = TextEditingController();
  TextEditingController get regEmailController => _regEmailController;

  TextEditingController _regBirthdayController = TextEditingController();
  TextEditingController get regBirthdayController => _regBirthdayController;

  List<String> _sexes = ['M', 'F'];
  List get sexes => _sexes;
  String _sexe = 'M';
  String get sexe => _sexe;

  setSexe(s) {
    _sexe = s;
    update();
  }

  TextEditingController _regVilleController = TextEditingController();
  TextEditingController get regVilleController => _regVilleController;

  TextEditingController _regepasswordController = TextEditingController();
  TextEditingController get regepasswordController => _regepasswordController;
  TextEditingController _rregepasswordController = TextEditingController();
  TextEditingController get rregepasswordController => _rfpasswordController;
  int _regState = 0;
  get regState => _regState;

  changePageIndex(bool i) {
    _regState = i ? check(_regState + 1) : check(_regState - 1);
    update();
  }

  check(i) {
    return i < 0 ? 0 : (i > 1 ? 1 : i);
  }

  var _code = '';
  get code => _code;
  sendCode() async {
    var data = {
      'email': regEmailController.text.replaceAll(" ", ""),
    };
    print(data);
    loader.open();
    try {
      Response response = await authRepo.sendMailCode(data);
      print(response.body);
      if (response.statusCode == 200) {
        _code = response.body['code'];
        toastShowSuccess(
            Get.find<ActionController>().lang.toLowerCase() == 'en'
                ? response.body['message_en']
                : response.body['message_fr'],
            Get.context);
        loader.close();
        update();
      } else if (response.statusCode == 203) {
        toastShowError(
            Get.find<ActionController>().lang.toLowerCase() == 'en'
                ? response.body['message_en']
                : response.body['message_fr'],
            Get.context);
        loader.close();
        update();
      } else {
        loader.close();

        checkError(false, response.body);
      }
    } catch (e) {
      toastShowError('evmail'.tr, Get.context);
      loader.close();
    }
  }

  regUser() async {
    var data = {
      'nom': regNameController.text,
      'prenom': regSurnameController.text,
      'email': regEmailController.text,
      'sexe': sexe,
      'ville': regVilleController.text,
      'password': regepasswordController.text,
      'password_confirmation': rregepasswordController.text,
    };

    try {
      loader.open();

      Response response = await authRepo.registerUser(data);
      if (response.statusCode == 200) {
        emailController.text = regEmailController.text;
        passwordController.text = regepasswordController.text;
        this.loginUser();
        _code = '';
        _codeController.text = '';
        regEmailController.text = '';
        regNameController.text = '';
        regSurnameController.text = '';
        regVilleController.text = '';
        regepasswordController.text = '';
        rregepasswordController.text = '';

        update();
      } else {
        loader.close();
        print(response.body['error']);
        if (response.body['error']['email'][0].trim() ==
            'La valeur du champ adresse email est déjà utilisée.'.trim()) {
          toastShowError('existac'.tr, Get.context);
        }
      }
    } catch (e) {
      loader.close();
      checkError(false, e);

      _isConnected = 3;
      update();
    }
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;
  loginUser() async {
    var data = {
      'username': emailController.text,
      'password': passwordController.text,
      'client_id': clientId,
      "grant_type": "password",
      'client_secret': clientSecret
    };
    try {
      _isConnected = 1;
      loader.open();
      update();

      Response response = await authRepo.authUser(data);

      if (response.statusCode == 200) {
        _user = User.fromJson(response.body['user']);

        _isConnected = 2;
        update();
        var data = {
          "token_expires_at": response.body['token_expires_at'].toString(),
          "id": response.body['user']['id'],
          "refresh_token": response.body['refresh_token'],
          "access_token": response.body['access_token'],
        };

        print(data);
        await db.saveToken(data);
        await db.saveUserInfo(
          UserDB.fromJson(_user),
        );
        _user.roles!.forEach((element) {
          (element.name == 'Patient-Alerte')
              ? db.saveUserRole(element)
              : print(element.name);
        });

        await Get.find<ApiClient>().setAuthHeaders();
        await db.saveListPermission(_user.permissions!);
        await getUserinfo_OL();

        await getUserToken();

        if (isInfos) {
          loader.close();
          await Get.find<HomeController>().getUserinfo_BD();

          await Get.find<DashBoardController>().getUserRole_BD();
          Get.offNamedUntil(AppLinks.HOME, (route) => false);
          initApp();
          startApp();
        }
        _passwordController.text = '';
        _emailController.text = '';
        update();
      } else {
        loader.close();

        checkError(
          true,
          response.body,
        );
        _passwordController.text = '';

        _isConnected = 3;
        update();
      }
    } catch (e) {
      loader.close();
      _passwordController.text = '';
      update();
      toastShowError('eulog'.tr, Get.context);

      _isConnected = 3;
      update();
    }
  }

  bool _hasSendMail = false;
  bool get hasSendMail => _hasSendMail;
  TextEditingController _emailFController = TextEditingController();
  TextEditingController get emailFController => _emailFController;
  forgotPassword() async {
    var data = {'email': emailFController.text, 'state': 1};
    try {
      loader.open();

      Response response = await authRepo.forgotPassword(data);

      if (response.statusCode == 200) {
        _hasSendMail = true;
        _code = '';
        _codeController.text = '';
        update();
        // toastShowSuccess('Le code a ete envoye a votre email', Get.context);
        toastShowSuccess(
            Get.find<ActionController>().lang.toLowerCase() == 'en'
                ? response.body['message_en']
                : response.body['message_fr'],
            Get.context);
        update();
        loader.close();
      } else {
        loader.close();
        checkError(false, response.body);
      }
    } catch (e) {
      checkError(false, e);
      loader.close();
    }
  }

  List _listRole = [];
  get listRole => _listRole;
  TextEditingController _codeController = TextEditingController();
  TextEditingController get codeController => _codeController;
  setCode(code) {
    _codeController.text = code;
    update();
  }

  verifyCode() async {
    if (codeController.text.length != 4) {
      toastShowError('ecode'.tr, Get.context);
      return false;
    }
    var data = {
      'email': emailFController.text.replaceAll(" ", ""),
      'code': int.parse(codeController.text),
      'state': 2
    };
    try {
      loader.open();
      Response response = await authRepo.forgotPassword(data);

      if (response.statusCode == 200) {
        _listRole = response.body['data'];

        update();

        Get.toNamed(
          AppLinks.SELECTACCOUNT,
        );
      } else if (response.statusCode == 203) {
        toastShowError(
            Get.find<ActionController>().lang.toLowerCase() == 'en'
                ? response.body['message_en']
                : response.body['message_fr'],
            Get.context);
        loader.close();
        update();
      } else {
        loader.close();

        checkError(false, response.body);
      }
    } catch (e) {
      loader.close();
      toastShowError('vrcode'.tr, Get.context);
    }
  }

  String _valCheck = '';
  String get valCheck => _valCheck;

  String _selectTitle = '';
  String get selectTitle => _selectTitle;
  selectCheck(val) {
    _valCheck = val;
    update();

    _selectTitle = val.toString();
    update();
  }

  cleanA() {
    _hasSendMail = false;
    _code = '';
    _codeController.text = '';
    update();
  }

  TextEditingController _fpasswordController = TextEditingController();
  TextEditingController get fpasswordController => _fpasswordController;
  TextEditingController _rfpasswordController = TextEditingController();
  TextEditingController get rfpasswordController => _rfpasswordController;

  newPasswordUser() async {
    if (fpasswordController.text.length < 8) {
      toastShowError('newpassd'.tr, Get.context);
      return false;
    }
    if (fpasswordController.text != rfpasswordController.text) {
      toastShowError('difpassword'.tr, Get.context);
      return false;
    }

    var data = {
      'email': emailFController.text.replaceAll(" ", ""),
      'compte': _selectTitle,
      'state': 3,
      'password': fpasswordController.text,
    };

    try {
      _isConnected = 1;
      loader.open();
      update();
      Response response = await authRepo.forgotPassword(data);

      if (response.statusCode == 200) {
        _isConnected = 2;
        update();
        loader.close();
        if (response.body['message_fr'] == 'OK') {
          _hasSendMail = false;
          fpasswordController.text = '';
          rfpasswordController.text = '';
          emailFController.text = '';
          update();
          Get.offNamedUntil(AppLinks.SUCCESSPASSWORD, (route) => false);
        } else {
          fpasswordController.text = '';
          rfpasswordController.text = '';
          checkError(false, response.body);
        }
      } else if (response.statusCode == 203) {
        loader.close();
        // toastShowError(
        //     'Ce mot de passe et cette adresse mail sont associes a un autre compte',
        //     Get.context);
        toastShowError(
            Get.find<ActionController>().lang.toLowerCase() == 'en'
                ? response.body['message_en']
                : response.body['message_fr'],
            Get.context);
      } else {
        loader.close();
        checkError(false, response.body);
        _isConnected = 3;
        update();
      }
    } catch (e) {
      _passwordController.text = '';
      update();
      loader.close();
      toastShowError('vecode'.tr, Get.context);

      _isConnected = 3;
      update();
    }
  }

  refreshToken(url) async {
    bool finalV = false;
    var userDB = await db.getUserInfo();
    var getU = await db.getToken();
    if (userDB["id"] != 0 && getU["id"] != 0) {
      if (url != ApiRoutes.login &&
          url != ApiRoutes.forgot &&
          url != ApiRoutes.refresh) {
        try {
          var data = {
            'client_id': '2',
            "grant_type": "password",
            'refresh_token': getU['refresh_token']
          };
          print(data);
          Response rep = await authRepo.refreshToken(data);
          if (rep.statusCode == 200) {
            var dataT = {
              "id": getU['id'],
              "token_expires_at": rep.body['token_expires_at'].toString(),
              "refresh_token": getU['refresh_token'],
              "access_token": rep.body['access_token'],
            };
            print(
                '----------------------refresh---------expiration------------${rep.body['token_expires_at'].toString()}');
            var decodedToken = JwtDecoder.decode(rep.body['access_token']);

            print(decodedToken);
            db.saveToken(dataT);
            finalV = true;
          }
        } catch (e) {
          finalV = false;
        }
      }
      return finalV;
    }
  }

  bool _isLog = false;
  bool get isLog => _isLog;
  getUserToken() async {
    var getU = await db.getToken();
    if (getU['id'] != 0) {
      await getUserinfo_BD();
      await getUserRole_BD();
      await getUserPermission_BD();
      _isLog = true;
      update();
    } else {
      _isLog = false;
      update();
    }
    return getU['id'] != 0;
  }

  bool _isInfos = false;
  bool get isInfos => _isInfos;
  getUserinfo_OL() async {
    var user = await db.getUserInfo();
    if (user['id'] != 0) {
      try {
        Response response = await authRepo.getUser();

        if (response.statusCode == 200) {
          if (response.body != null && _user.name == '') {
            _user = User.fromJson(response.body);
            _isInfos = true;
            update();
            await db.saveUserInfo(
              UserDB.fromJson(_user),
            );
            _user.roles!.forEach((element) {
              (element.name == 'Patient-Alerte')
                  ? db.saveUserRole(element)
                  : print(element.name);
            });
            await db.saveListPermission(_user.permissions!);
          }
        }

        return _user;
      } catch (e) {
        _isInfos = false;
        update();
      }
    }
  }

  getUserinfo_BD() async {
    try {
      var user = await db.getUserInfo();
      if (user != null && user['id'] != 0) {
        _user = User.fromJson(user);

        _isInfos = true;
        update();
      }
    } catch (e) {
      _isInfos = false;
      update();
    }
  }

  bool _isPermission = false;
  bool get isPermission => _isPermission;

  List _listPermission = [];
  List get listPermission => _listPermission;
  getUserPermission_BD() async {
    try {
      var permissions = await db.getListPermission();

      _listPermission = permissions;
      _isPermission = true;

      update();

      return permissions;
    } catch (e) {
      _isPermission = false;
      update();
    }
  }

  var _roleUser;
  Role get roleUser => _roleUser;

  bool _isRole = false;
  bool get isRole => _isRole;

  getUserRole_BD() async {
    try {
      var role = await db.getUserRole();
      _roleUser = Role.fromJson(role);
      _isRole = true;

      update();
    } catch (e) {
      _isRole = true;

      update();
    }
  }

  getFonctionnalite(ftx) {
    return _listPermission.contains(ftx);
  }

  deconnectUser() async {
    try {
      loader.open();
      var data = {"time_slug": user.timeSlug};
      Get.offNamedUntil(AppLinks.WRAPPER, (route) => false);
      await authRepo.logOutUser(data);
      db.deleteAll();
      Get.find<AlerteController>().emptyData();
      /*   Response response = */
      // loader.close();
      toastShowError('deconnecter'.tr, Get.context);
    } catch (e) {
      toastShowError('Ressayer'.tr, Get.context);
      loader.close();
    }
  }
}
