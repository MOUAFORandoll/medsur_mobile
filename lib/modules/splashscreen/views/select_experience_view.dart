import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/general_component/app_experience.dart';
import 'package:medsur_app/general_component/app_lang_button.dart';
import 'package:medsur_app/general_component/index_widgets.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:medsur_app/modules/etablissement/models/alert_model.dart';

import 'package:medsur_app/modules/splashscreen/components/app_carroussel_item.dart';
import 'package:medsur_app/utils/routing.dart';

class SelectExperienceView extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    var _format = new FormatData();

    return GetBuilder<AuthController>(
        builder: (authCont) => Scaffold(
              // appBar: AppBar(
              //   title: const Text('Agora Video Call'),
              // ),
              backgroundColor: AppColors.whitecolor,

              body: Container(
                alignment: Alignment.center,

                // margin: EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    AppExperienceComponent(
                      text: "choix0".tr,
                      onTap: () async {
                        authCont.selectTypeCompte(0);
                        Get.toNamed(AppLinks.LOGIN);
                      },
                    ),
                    AppExperienceComponent(
                      text: "choix1".tr,
                      onTap: () async {
                        authCont.selectTypeCompte(1);
                        Get.toNamed(AppLinks.LOGIN);
                      },
                    ),
                    /*    
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.whitecolor,
                        border: Border(top: BorderSide.none),
                      ),
                      // width: kWidth,
                      height: kHeight / 2,

                      padding: EdgeInsets.only(
                        top: kMarginY * 19,
                      ),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(kMarginX),
                              // margin: EdgeInsets.symmetric(
                              //     vertical: kMarginY, horizontal: kMarginX * 3),
                              child: Text("choix0".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: kLgText))),
                          Container(
                            padding: EdgeInsets.all(kMarginX),
                            // margin: EdgeInsets.symmetric(
                            //     vertical: kMarginY, horizontal: kMarginX * 3),
                            child: AppButton(
                              text: 'successcreationbtn'.tr,
                              size: MainAxisSize.max,
                              textColor: AppColors.whitecolor,
                              shadow: false,
                              width: kWidth / 2.5,
                              border: Border.all(color: AppColors.whitecolor),
                              bgColor: AppColors.green,
                              onTap: () async {
                                authCont.selectTypeCompte(0);
                                Get.toNamed(AppLinks.LOGIN);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        border: Border(top: BorderSide.none),
                      ),
                      // width: kWidth,
                      height: kHeight / 2,
                      // margin: EdgeInsets.symmetric(
                      //     vertical: kMarginY, horizontal: kMarginX * 3),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(kMarginX),
                            // margin: EdgeInsets.symmetric(
                            //     vertical: kMarginY, horizontal: kMarginX * 3),
                            child: AppButton(
                              text: 'successcreationbtn'.tr,
                              size: MainAxisSize.max,
                              textColor: AppColors.primaryText,
                              shadow: false,
                              width: kWidth / 2.5,
                              border: Border.all(color: AppColors.primaryText),
                              bgColor: AppColors.whitecolor,
                              onTap: () async {
                                authCont.selectTypeCompte(1);
                                Get.toNamed(AppLinks.LOGIN);
                              },
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.all(kMarginX),
                              // margin: EdgeInsets.symmetric(
                              //     vertical: kMarginY, horizontal: kMarginX * 3),
                              child: Text("choix1".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: kLgText))),
                        ],
                      ),
                    ),
                */
                  ],
                )),
              ),
            ));
  }
}
