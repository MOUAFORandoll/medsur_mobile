import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'package:get/get.dart';
import 'package:location/location.dart' hide LocationAccuracy, PermissionStatus;
import 'package:medsur_app/constants/Pagetitle.dart';
import 'package:medsur_app/constants/assets.dart';
import 'package:medsur_app/general_controllers/dataBase_controller.dart';
import 'package:medsur_app/modules/DashBoard/views/dashboard_view.dart';

import 'dart:ui' as ui;

import 'package:permission_handler/permission_handler.dart';

class ActionController extends GetxController {
  // final StartRepo startRepo;
  // ActionController({required this.startRepo});
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var db = Get.find<DataBaseController>();

  bool _isState = false;
  bool get isState => _isState;
  setState() {
    _isState = !_isState;
    update();
  }

// permet d'ouvrir le drawer
  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }
// permet de fermer le drawer

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  int _indexDrawer = 0;
  int get indexDrawer => _indexDrawer;

  changePageIndex(index) {
    _indexDrawer = index;
    update();

    buildContent();
    closeDrawer();
  }

  Widget buildContent() {
    switch (_indexDrawer) {
      case 0:
        return DashBoard();
      // case 1:
      //   return SearchView();

      default:
        return DashBoard();
    }
  }

  final CarouselController _controller = CarouselController();
  CarouselController get controller => _controller;
  int _index = 0;
  int get index => _index;

  setIndex(index) {
    _index = index;
    update();
  }

  Locale _lan = ui.window.locale.languageCode == 'en'
      ? Locale('en', 'US')
      : Locale('fr', 'FR');
  Locale get lan => _lan;

  List locale = [
    {'name': 'EN', 'locale': const Locale('en', 'US')},
    {'name': 'FR', 'locale': const Locale('fr', 'FR')},
  ];

  final lang = (ui.window.locale.languageCode == 'en' ? 'EN' : 'FR').obs;

  updateLanguage(String localLang) async {
    int index = locale.indexWhere((element) => element['name'] == localLang);
    if (index != -1) {
      lang.value = locale[index]['name'];
      // Get.back();
      Get.updateLocale(locale[index]['locale']);
      //print(lang.value);
      update();
      await db.saveLan(lang.value);
    }
  }

  bool _first_get_lang = true;

  get first_get_lang => _first_get_lang;
  onInit() {
    print('---- ------------initt-----');
    _initializeLocation();
    getLanguageInit();
    super.onInit();
  }

  getLanguageInit() async {
    var lanBd = await db.getLan();
    if (_first_get_lang) {
      int index = locale.indexWhere((element) => element['name'] == lanBd);

      if (index != -1) {
        lang.value = locale[index]['name'];
        Get.updateLocale(locale[index]['locale']);
        _first_get_lang = false;
        update();
        // return locale[index]['locale'];
      } else {
        var local =
            lang.value == 'EN' ? locale[0]['locale'] : locale[1]['locale'];
        Get.updateLocale(local);
      }

      update();
    }
  }

  LocationData? _currentLocation;
  Location _locationService = Location();
  get locationService => _locationService;
  Future<void> _initializeLocation() async {
    bool serviceEnabled;
    // PermissionStatus permissionGranted;

    serviceEnabled = await _locationService.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationService.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    update();
  }

  var position;
  getMyPosition() async {
    String? countryCode = ui.window.locale.languageCode;
    // var permission = await Permission.location.status;
    // if (permission.isGranted) {
    //   print('Pays de l\'utilisateur: $countryCode');
    //   position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high,
    //   );
    //   update();
    //   print(
    //       '!!!!!!!!!!!!!!!!!!!!______________________________________---------');

    //   print(position);
    // } else {
    //   await Permission.location.request();
    // }
    //  var permission = await Permission.location.status;
    // var permission = await Permission.location.status;
    // print(
    //     'position____________________${permission}__________________---------');
    // if (permission.isGranted) {
    //   print('Pays de l\'utilisateur: $countryCode');
    //   position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high,
    //   );
    //   update();
    //   print(
    //       '!!!!!!!!!!!!!!!!!!!!______________________________________---------');

    //   print(position);
    // } else {
    //   print('denied---!!!!!!!!!!!!!!!!!!________________------');
    //   await  Permission.location.request();
    //   // await getMyPosition();
    // }
    // await Permission.location.request().then((status) async {
    //   if (status == PermissionStatus.granted) {
    //     print('Pays de l\'utilisateur: $countryCode');
    //     position = await Geolocator.getCurrentPosition(
    //       desiredAccuracy: LocationAccuracy.high,
    //     );
    //     update();
    //     print(
    //         '!!!!!!!!!!!!!!!!!!!!______________________________________---------');

    //     print(position);
    //   } else {
    //     print('denied---!!!!!!!!!!!!!!!!!!________________------');
    //     await Permission.location.request();
    //     // await getMyPosition();
    //     // The user denied permission to access location.
    //   }
    // });

    Location location = Location();
    var lo = await location.hasPermission();
    if (lo == PermissionStatus.granted) {
      final LocationData pos = await location.getLocation();
      position = pos;
      print(
          '!!!!!!!!!!!!!!!!!!!!______________________________________---------');

      update();
    } else {
      print('denied---!!!!!!!!!!!!!!!!!!________________------');

      await location.requestPermission();
      getMyPosition();
      print('reask---!!!!!!!!!!!!!!!!!!________________------');
    }
  }
}
