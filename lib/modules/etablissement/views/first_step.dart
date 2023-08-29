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

import 'package:intl_phone_field/intl_phone_field.dart';

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
                      IntlPhoneField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.primaryGreen, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.grey7, width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: AppColors.grey7, width: 1.5),
                          ),
                        ),
                        controller: dController.phoneController,
                        languageCode: "en",

                        // onChanged: (phone) {
                        //   print(phone.number);
                        //   dController.setPhoneCode(
                        //     phone.number,
                        //   );
                        // },
                        onCountryChanged: (country) {
                          print('Country changed to: ' + country.dialCode);
                          dController.setCode(country.dialCode, country.code);
                        },
                      ),
                      // AppInput(
                      //   controller: dController.phoneController,
                      //   onChanged: (value) {},
                      //   label: '',
                      //   validator: (value) {
                      //     //  int.parse(dController.emailController.text)
                      //     return Validators.isValidEmailOrNum(
                      //         dController.phoneController.text);
                      //   },
                      // ),
                    ],
                  ),
                ),
                Container(
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
                                      Get.dialog(ModalGetPlace());
                                      // 
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
                      Container(
                          margin: EdgeInsets.symmetric(
                            vertical: kMarginY,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppButton(
                                text: 'descriptionempl'.tr,
                                width: kWidth * .87,
                                size: MainAxisSize.max,
                                bgColor: AppColors.primaryGreen,
                                onTap: () async {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                            child: Container(
                                                padding: EdgeInsets.all(10.0),
                                                child: SingleChildScrollView(
                                                    child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'descriptionempl'.tr,
                                                      style: TextStyle(
                                                        fontSize: kSmText,
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: AppColors
                                                            .primaryText,
                                                      ),
                                                    ),
                                                    SizedBox(height: 16.0),
                                                    AppTextForm(
                                                      controller: dController
                                                          .descriptionLocalisationController,
                                                      validator: (value) {
                                                        return Validators
                                                            .isValidUsername(
                                                                dController
                                                                    .descriptionLocalisationController
                                                                    .text);
                                                      },
                                                    ),
                                                    // SizedBox(height: 16.0),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        TextButton(
                                                          child:
                                                              Text('cancel'.tr),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        ElevatedButton(
                                                          child: Text(
                                                            "ok".tr,
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .whitecolor),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary: AppColors
                                                                .primaryGreen,
                                                          ),
                                                          onPressed: () async {
                                                          
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ))));
                                      });

                                  // Get.dialog(ModalDesciption());
                                },
                              ),
                            ],
                          ))
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
                            'nr_commerce'.tr,
                            style: TextStyle(
                                fontSize: kMediumText,
                                fontFamily: 'Montserrat',
                                color: AppColors.grey8,
                                fontWeight: FontWeight.w500),
                          )),
                      AppInput(
                        controller: dController.nrCommerceController,
                        onChanged: (value) {},
                        maxLength: 13,
                        label: '',
                        validator: (value) {
                          return Validators.isValidUsername(
                              dController.nrCommerceController.text);
                        },
                      ),
                    ])),
                Padding(
                    padding: EdgeInsets.only(
                      top: kMarginY * 2,
                    ),
                    child: Column(children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: kMarginY / 2),
                          child: Text(
                            'nr_contribuable'.tr,
                            style: TextStyle(
                                fontSize: kMediumText,
                                fontFamily: 'Montserrat',
                                color: AppColors.grey8,
                                fontWeight: FontWeight.w500),
                          )),
                      AppInput(
                        controller: dController.nrContribuableController,
                        onChanged: (value) {},
                        maxLength: 14,
                        label: '',
                        validator: (value) {
                          return Validators.isValidUsername(
                              dController.nrContribuableController.text);
                        },
                      ),
                    ])),
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
                    ])),
                Padding(
                    padding: EdgeInsets.only(
                      top: kMarginY * 2,
                    ),
                    child: Column(children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: kMarginY / 2),
                          child: Text(
                            'logo'.tr,
                            style: TextStyle(
                                fontSize: kMediumText,
                                fontFamily: 'Montserrat',
                                color: AppColors.grey8,
                                fontWeight: FontWeight.w500),
                          )),
                      InkWell(
                          onTap: () => Get.dialog(ModalDialogImage()),
                          child: !dController.isImage
                              ? Container(
                                  height: kMdHeight * .3,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: AppColors.grey8,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Icon(
                                    Icons.add,
                                    size: 50,
                                    color: Colors.white,
                                  ))
                              : Container(
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  height: kMdHeight * .3,
                                  width: Get.width,
                                  child: Image.file(
                                    dController.logoImage,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                      if (dController.errorimage)
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(bottom: kMarginY / 2),
                            child: Text(
                              'errorimage'.tr,
                              style: TextStyle(
                                  fontSize: kMediumText,
                                  fontFamily: 'Montserrat',
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w500),
                            )),
                    ]))
              ],
            ),
          ),
        ));
  }
}

class ModalDesciption extends StatelessWidget {
  var eController = Get.find<EtablissementController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EtablissementController>(
      builder: (dController) => AlertDialog(
        contentPadding: EdgeInsets.all(10.0),
        title: Text(
          'descriptionempl'.tr,
          style: TextStyle(
            fontSize: kSmText,
            fontFamily: 'Montserrat',
            color: AppColors.primaryText,
          ),
        ),
        content: Container(
            height: 150,
            width: kMdWidth,
            child: AppTextForm(
              controller: dController.descriptionController,
              validator: (value) {
                return Validators.isValidUsername(
                    dController.descriptionController.text);
              },
            )),
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
      ),
    );
  }
}

class ModalGetPlace extends StatelessWidget {
  var eController = Get.find<EtablissementController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EtablissementController>(
      builder: (dController) => AlertDialog(
        contentPadding: EdgeInsets.all(10.0),
        title: Text(
          'descriptionempl'.tr,
          style: TextStyle(
            fontSize: kSmText,
            fontFamily: 'Montserrat',
            color: AppColors.primaryText,
          ),
        ),
        content: Container(
          height: 150,
          width: kMdWidth,
          child: AppInput(
            controller: dController.placeTexteController,
            onChanged: (value) {},
            label: '',
            validator: (value) {},
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
              child: Text("search".tr,
                  style: TextStyle(color: AppColors.whitecolor)),
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryGreen,
              ),
              onPressed: () async {
                await dController.getPlaceInformation();
              }),
        ],
      ),
    );
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

class ModalDialogImage extends StatelessWidget {
  var eController = Get.find<EtablissementController>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'select'.tr,
        style: TextStyle(
          fontSize: kSmText,
          fontFamily: 'Montserrat',
          color: AppColors.primaryText,
        ),
      ),
      content: Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: AppButton(
              text: 'Camera'.tr,
              width: kWidth / 2.5,
              size: MainAxisSize.max,
              bgColor: AppColors.primaryGreen,
              onTap: () => eController.getImagelogoCamera(),
            ),
          ),
          AppButton(
              text: 'Galerie'.tr,
              width: kWidth / 2.5,
              size: MainAxisSize.max,
              bgColor: AppColors.grey1,
              onTap: () => eController.getImagelogoGallery()),
        ],
      )),
      actions: [
        TextButton(
          child: Text('back'.tr),
          onPressed: () {
            Get.back();
          },
        ),
        // ElevatedButton(
        //     child:
        //         Text("yes".tr, style: TextStyle(color: AppColors.whitecolor)),
        //     style: ElevatedButton.styleFrom(
        //       primary: AppColors.primaryGreen,
        //     ),
        //     onPressed: () async {
        //       await eController.getPosition();
        //       Get.back();
        //     }),
      ],
    );
  }
}
