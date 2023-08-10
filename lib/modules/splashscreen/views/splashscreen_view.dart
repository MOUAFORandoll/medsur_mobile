import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:medsur_app/core.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/general_controllers/dataBase_controller.dart';

import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:medsur_app/utils/routing.dart';
import '../../../constants/assets.dart';

class SplashscreenView extends StatefulWidget {
  @override
  _SplashscreenViewState createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  var ac = Get.find<AuthController>();

  DataBaseController db = Get.find();

  start() async {
    // //print('******************${ac.isLog}');
    Future.delayed(Duration(seconds: 4), () async {
      var isLog = await ac.getUserToken();
      print('*****************dddfdfdfdfd${isLog}');

      if (isLog) {
        bool inExpiredToken = await db.inExpiredTokenNR();
        if (inExpiredToken) {
          // await Get.find<AuthController>()
          //     .refreshToken('request.url.path.toString()');
          //      print('*****************refresh ok');
          Get.offNamedUntil(AppLinks.WRAPPER, (route) => false);
        } else {
          await ac.dbGetTypeCompte();

          print('******************${ac.isLog}');
          startApp();
          Get.offNamedUntil(AppLinks.HOME, (route) => false);
        }
      } else {
        Get.offNamedUntil(AppLinks.WRAPPER, (route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: new Container(
                    child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(Assets.appLogo, fit: BoxFit.cover),
                  // height: Get.height / 4,
                ),
                Container(
                  margin: EdgeInsets.only(top: Get.height / 2),
                  child: SpinKitCircle(
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
              ],
            )))));
  }
}
