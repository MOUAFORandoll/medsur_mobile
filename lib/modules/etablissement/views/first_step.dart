import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_loader_element.dart';
import 'package:medsur_app/modules/alerte/components/app_input_min_add.dart';
import 'package:medsur_app/modules/alerte/constant/alert_level_color.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/models/emergency_model.dart';
import 'package:medsur_app/modules/etablissement/controller/etablissement_controller.dart';
import 'package:medsur_app/utils/routing.dart';
import 'package:medsur_app/utils/validators.dart';
import '../../../constants/index_common.dart';
import '../../../general_component/index_widgets.dart';
import 'package:date_input_field/date_input_field.dart';
import 'package:intl/intl.dart';

class FirstStepView extends StatelessWidget {
  FirstStepView({required this.dController});
  EtablissementController dController;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: dController.firststepformKey,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: kMarginY,
                  ),
                  child: AppInput(
                    controller: dController.nameController,
                    onChanged: (value) {},
                    label: 'name'.tr,
                    validator: (value) {
                      //print(Validators.isValidUsername(
                      // dController.nameController.text));
                      //  int.parse(dController.emailController.text)
                      return Validators.isValidUsername(
                          dController.nameController.text);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: kMarginY * 2,
                  ),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: kMarginY / 2),
                          child: Text(
                            'mail'.tr,
                            style: TextStyle(
                                fontSize: kMediumText,
                                fontFamily: 'Montserrat',
                                color: AppColors.grey8,
                                fontWeight: FontWeight.w500),
                          )),
                      AppInput(
                        controller: dController.emailController,
                        onChanged: (value) {},
                        label: '',
                        validator: (value) {
                          //  int.parse(dController.emailController.text)
                          return Validators.isValidEmailOrNum(
                              dController.emailController.text);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: kMarginY * 2,
                  ),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: kMarginY / 2),
                          child: Text(
                            'phone'.tr,
                            style: TextStyle(
                                fontSize: kMediumText,
                                fontFamily: 'Montserrat',
                                color: AppColors.grey8,
                                fontWeight: FontWeight.w500),
                          )),
                      AppInput(
                        controller: dController.phoneController,
                        onChanged: (value) {},
                        label: '',
                        validator: (value) {
                          //  int.parse(dController.emailController.text)
                          return Validators.isValidEmailOrNum(
                              dController.phoneController.text);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: kMarginY * 2,
                  ),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: kMarginY / 2),
                          child: Text(
                            'boitepostal'.tr,
                            style: TextStyle(
                                fontSize: kMediumText,
                                fontFamily: 'Montserrat',
                                color: AppColors.grey8,
                                fontWeight: FontWeight.w500),
                          )),
                      AppInput(
                        controller: dController.boitePostaleController,
                        onChanged: (value) {},
                        label: '',
                        validator: (value) {
                          return Validators.isValidUsername(
                              dController.boitePostaleController.text);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: kMarginY * 2,
                  ),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: kMarginY / 2),
                          child: Text(
                            'positionetablissement'.tr,
                            style: TextStyle(
                                fontSize: kMediumText,
                                fontFamily: 'Montserrat',
                                color: AppColors.grey8,
                                fontWeight: FontWeight.w500),
                          )),
                      !dController.selectedPosition
                          ? Container(
                              margin: EdgeInsets.symmetric(
                                vertical: kMarginY,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppButton(
                                    text: 'yes'.tr,
                                    width: kWidth / 2.5,
                                    size: MainAxisSize.max,
                                    bgColor: AppColors.primaryGreen,
                                    onTap: () async {
                                      Get.dialog(ModalDialog());
                                    },
                                  ),
                                  AppButton(
                                    text: 'no'.tr,
                                    width: kWidth / 2.5,
                                    size: MainAxisSize.max,
                                    bgColor: AppColors.red,
                                    onTap: () async {
                                      Get.toNamed(AppLinks.MAP);
                                    },
                                  ),
                                ],
                              ))
                          : Container(
                              margin: EdgeInsets.symmetric(
                                vertical: kMarginY,
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text('savePositionSuccess'.tr,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: kMediumText,
                                                color: AppColors.blue))),
                                    IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          dController.changePosition();
                                        })
                                  ])),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: kMarginY * 2,
                    ),
                    child: Column(children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: kMarginY / 2),
                          child: Text(
                            'parlesnous'.tr,
                            style: TextStyle(
                                fontSize: kMediumText,
                                fontFamily: 'Montserrat',
                                color: AppColors.grey8,
                                fontWeight: FontWeight.w500),
                          )),
                      Container(
                          height: 150,
                          // width: kMdWidth * 1.8,
                          child: AppTextForm(
                            controller: dController.descriptionController,
                            validator: (value) {
                              return Validators.isValidUsername(
                                  dController.descriptionController.text);
                            },
                          )),
                    ]))
              ],
            ),
          ),
        ));
  }
}

class ModalDialog extends StatelessWidget {
  var eController = Get.find<EtablissementController>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'positionText'.tr,
        style: TextStyle(
          fontSize: kSmText,
          fontFamily: 'Montserrat',
          color: AppColors.primaryText,
        ),
      ),
      actions: [
        TextButton(
          child: Text('cancel'.tr),
          onPressed: () {
            Get.back();
          },
        ),
        ElevatedButton(
            child:
                Text("yes".tr, style: TextStyle(color: AppColors.whitecolor)),
            style: ElevatedButton.styleFrom(
              primary: AppColors.primaryGreen,
            ),
            onPressed: () async {
              await eController.getPosition();
              Get.back();
            }),
      ],
    );
  }
}
