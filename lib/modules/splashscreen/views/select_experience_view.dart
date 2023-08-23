import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
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
              backgroundColor: AppColors.green,

              body: Container(
                // margin: EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    // Text(description),
                    // Container(
                    //     padding: EdgeInsets.symmetric(vertical: kMarginY * 10),
                    //     alignment: Alignment.center,
                    //     decoration: BoxDecoration(
                    //       color: AppColors.whitecolor,
                    //       border: Border(top: BorderSide.none),
                    //     ),
                    //     height: kHeight / 1.8,
                    //     child: ListView.builder(
                    //         shrinkWrap: true,
                    //         physics: NeverScrollableScrollPhysics(),
                    //         // scrollDirection:
                    //         //     Axis.horizontal,
                    //         itemCount: authCont.listTypeCompte.length,
                    //         itemBuilder: (BuildContext context, int index) {
                    //           return RadioListTile<int>(
                    //             value: authCont.listTypeCompte[index],
                    //             groupValue: authCont.typeCompte,
                    //             title: Text(
                    //               _format.capitalizeFirstLetter(
                    //                   authCont.listTypeCompte[index] == 0
                    //                       ? 'choix0'.tr
                    //                       : 'choix1'.tr),
                    //               style: TextStyle(
                    //                   fontSize: kMediumText,
                    //                   fontFamily: 'Montserrat'),
                    //             ),
                    //             activeColor: AppColors.primaryGreen,
                    //             onChanged: (val) {
                    //               print(val);
                    //               authCont.selectTypeCompte(val);
                    //             },
                    //           );
                    //         })),
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
                  ],
                )),
              ),
            ));
  }
}
