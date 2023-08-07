import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:medsur_app/constants/Pagetitle.dart';

import 'package:get/get.dart';
import 'package:medsur_app/core.dart';
import 'package:medsur_app/general_controllers/dataBase_controller.dart';
import 'package:medsur_app/modules/Home/repo/home_repo.dart';
import 'package:medsur_app/modules/alerte/views/alerte_view.dart';
import 'package:medsur_app/modules/auth/models/oauth.dart';
import 'package:medsur_app/modules/dashboard/views/account_view.dart';
import 'package:medsur_app/modules/dashboard/views/activity_view.dart';
import 'package:medsur_app/modules/dashboard/views/search_view.dart';
import 'package:medsur_app/modules/etablissement/views/etablissement_home_view.dart';

import '../../auth/controller/auth_controller.dart';
import '../../dashboard/views/dashboard_view.dart';
import 'package:connectivity/connectivity.dart';

class HomeController extends GetxController {
  final HomeRepo homeRepo;
  HomeController({required this.homeRepo});
  final _connectivity = Connectivity();

  void onInit() {
    super.onInit();
    stateUserOnline();
    // Récupère les informations relatives à la taille de l'écran
  }

  bool _isInternet = true;
  bool get isInternet => _isInternet;
  void stateUserOnline() async {
    super.onInit();
    //print(_connectivity.checkConnectivity());
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      _isInternet = true;
      update();
      await initApp();
    } else {
      _isInternet = false;
      update();
    }
    _connectivity.onConnectivityChanged.listen((event) async {
      //event == 0 -=>none
      //event == 1 -=> mobile
      //event == 0 -=> wifi
      //print(event.index);

      if (event == ConnectivityResult.none) {
        _isInternet = false;
        update();
      } else if (event != ConnectivityResult.none) {
        _isInternet = true;
        update();
      }
    });
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var db = Get.find<DataBaseController>();
  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  changePageIndex(index) {
    _currentIndex = index;
    update();

    buildContent();
    closeDrawer();
  }

  String buildTitle() {
    switch (_currentIndex) {
      case 0:
        return Pagetitle.dashboard;
      // case 1:
      //   return SearchView();
      case 1:
        //   return ListBoutiqueView();
        // case 2:
        return Pagetitle.second;

      default:
        return Pagetitle.dashboard;
    }
  }

  Widget buildContent() {
    return roleUser != null
        ? roleUser.name == 'Patient-Alerte'
            ? buildPatient()
            : buildEtablissement() /* 
        buildEtablissement() */
        : buildContentGeneral();
  }

  Widget buildContentGeneral() {
    switch (_currentIndex) {
      case 0:
        return DashBoard(name: _user != null ? user.nom.toString() : '');
      case 1:
        return ActivityView();
      case 2:
        return SearchView();
      case 3:
        return AccountView();

      default:
        return DashBoard();
    }
  }

  buildPatient() {
    switch (_currentIndex) {
      case 0:
        return AlertView();
      case 1:
        return AccountView();
      default:
        return AlertView();
    }
  }

  buildEtablissement() {
    switch (_currentIndex) {
      case 0:
        return EtablissementHomeView();
      case 1:
        return AccountView();
      default:
        return EtablissementHomeView();
    }
  }

  bool _isInfos = false;
  bool get isInfos => _isInfos;

  User _user = User(name: '');
  User get user => _user;
  var _roleUser;
  Role get roleUser => _roleUser;
  getUserinfo_BD() async {
    try {
      var userDB = await db.getUserInfo();

      if (userDB != null && userDB['id'] != 0) {
        _user = User.fromJson(userDB);
        _isInfos = true;
        update();
      }
      var roleUserDB = await db.getUserRole();
      print(
          '---------roleee--------User  data base info********* ${roleUserDB}');

      if (roleUserDB != null && roleUserDB['id'] != 0) {
        _roleUser = Role.fromJson(roleUserDB);
        _isInfos = true;
        update();
        //print('-----------------User  data base info********* ${roleUserDB}');
        //print('----${_user.id}------${_isInfos}---${_roleUser.id}---- ');
      }
    } catch (e) {
      _isInfos = false;
      update();
      //print(e);
    }
  }

  getUserinfo_OL() async {
    try {
      var userDB = await Get.find<AuthController>().user;

      if (userDB != null) {
        _user = userDB;
        _isInfos = true;
        update();
      }
    } catch (e) {
      _isInfos = false;
      update();
      //print(e);
    }
  }
}
