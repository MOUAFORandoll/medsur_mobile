import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/general_component/app_text_title_noe.dart';
import 'package:medsur_app/utils/showToast.dart';
import 'package:pinput/pinput.dart';
import '../../../utils/validators.dart';
import '../controller/auth_controller.dart';
import '../../../general_component/index_widgets.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final focusedBorderColor = AppColors.grey7;
    final fillColor = AppColors.grey7;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey7),
      ),
    );
    return GetBuilder<AuthController>(
        builder: (authCont) => Container(
            decoration: PageStyle.decoration,
            child: WillPopScope(
                child: Scaffold(
                  appBar: AppBar(
                      leading: IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_left_outlined,
                          color: AppColors.primaryGreen,
                        ),
                        tooltip:
                            MaterialLocalizations.of(context).backButtonTooltip,
                        onPressed: () {
                          authCont.cleanA();
                          Get.back();
                        },
                      ),
                      title: Container(
                        child: Image.asset(
                          Assets.logoLong,
                          fit: BoxFit.fill,
                          height: kMdHeight / 20,
                        ),
                      ),
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                      elevation: 0),
                  backgroundColor: Colors.transparent,
                  body: SafeArea(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: kMarginX),
                          child: SingleChildScrollView(
                              child: Form(
                                  key: formKey,
                                  child: Column(children: [
                                    authCont.regState == 0
                                        ? Column(children: [
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                margin: EdgeInsets.symmetric(
                                                  vertical: kMarginY,
                                                ),
                                                child: AppTextTitleNoE(
                                                  text: 't1Create'.tr,
                                                  bolder: true,
                                                  big: true,
                                                )),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: kMarginY,
                                              ),
                                              child: Column(children: [
                                                Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    margin: EdgeInsets.only(
                                                        bottom: kMarginY),
                                                    child: Text(
                                                      'name'.tr,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              AppColors.grey8,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                                AppInput(
                                                  controller: authCont
                                                      .regNameController,
                                                  onChanged: (value) {},
                                                  label: '',
                                                  validator: (value) {
                                                    return Validators
                                                        .isValidUsername(authCont
                                                            .regNameController
                                                            .text);
                                                  },
                                                )
                                              ]),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: kMarginY,
                                              ),
                                              child: Column(children: [
                                                Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    margin: EdgeInsets.only(
                                                        bottom: kMarginY),
                                                    child: Text(
                                                      'surname'.tr,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              AppColors.grey8,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                                AppInput(
                                                  controller: authCont
                                                      .regSurnameController,
                                                  onChanged: (value) {},
                                                  label: '',
                                                  validator: (value) {
                                                    return Validators
                                                        .isValidUsername(authCont
                                                            .regSurnameController
                                                            .text);
                                                  },
                                                )
                                              ]),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                top: kMarginY,
                                              ),
                                              child: Column(children: [
                                                Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    margin: EdgeInsets.only(
                                                        bottom: kMarginY),
                                                    child: Text(
                                                      'mail'.tr,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              AppColors.grey8,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                                AppInput(
                                                  controller: authCont
                                                      .regEmailController,
                                                  onChanged: (value) {},
                                                  label: '',
                                                  validator: (value) {
                                                    return Validators
                                                        .isValidEmail(authCont
                                                            .regEmailController
                                                            .text);
                                                  },
                                                )
                                              ]),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  top: kMarginY,
                                                ),
                                                child: Column(children: [
                                                  Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      margin: EdgeInsets.only(
                                                          bottom: kMarginY),
                                                      child: Text(
                                                        'gender'.tr,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color:
                                                                AppColors.grey8,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )),
                                                  Container(
                                                      width: kWidth,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        border: Border.all(
                                                            color:
                                                                AppColors.grey7,
                                                            width: 1.5),
                                                      ),
                                                      margin: EdgeInsets.only(
                                                        top: kMarginY,
                                                      ),
                                                      child: DropdownButton<
                                                              String>(
                                                          value: authCont.sexe,
                                                          icon: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        kMarginX /
                                                                            2),
                                                            child: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_outlined,
                                                              color: AppColors
                                                                  .grey8,
                                                            ),
                                                          ),
                                                          iconSize: 25,
                                                          isExpanded: true,
                                                          underline: SizedBox(),
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .grey8,
                                                              fontSize: 20),
                                                          onChanged: (value) {
                                                            authCont
                                                                .setSexe(value);
                                                          },
                                                          items: <String>[
                                                            ...authCont.sexes
                                                                .map((e) => e)
                                                          ].map<
                                                              DropdownMenuItem<
                                                                  String>>((String
                                                              value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child: Container(
                                                                padding: EdgeInsets.only(
                                                                    left:
                                                                        kMarginX /
                                                                            2),
                                                                child: Text(
                                                                  value,
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .grey8,
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                              ),
                                                            );
                                                          }).toList()))
                                                ])),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: kMarginY,
                                              ),
                                              child: Column(children: [
                                                Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    margin: EdgeInsets.only(
                                                        bottom: kMarginY),
                                                    child: Text(
                                                      'city'.tr,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              AppColors.grey8,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                                AppInput(
                                                  controller: authCont
                                                      .regVilleController,
                                                  onChanged: (value) {},
                                                  label: '',
                                                  validator: (value) {
                                                    return Validators.required(
                                                        'city'.tr,
                                                        authCont
                                                            .regVilleController
                                                            .text);
                                                  },
                                                )
                                              ]),
                                            ),
                                            if (authCont.code.length != 0)
                                              Container(
                                                  margin: EdgeInsets.only(
                                                    top: kMarginY * 3,
                                                  ),
                                                  child: Column(children: [
                                                    Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        margin: EdgeInsets.only(
                                                            bottom: kMarginY),
                                                        child: Text(
                                                          'code'.tr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              color: AppColors
                                                                  .grey8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        )),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                          top: kMarginY,
                                                        ),
                                                        child: Pinput(
                                                          focusedPinTheme:
                                                              defaultPinTheme
                                                                  .copyWith(
                                                            decoration:
                                                                defaultPinTheme
                                                                    .decoration!
                                                                    .copyWith(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              border: Border.all(
                                                                  color:
                                                                      focusedBorderColor),
                                                            ),
                                                          ),
                                                          submittedPinTheme:
                                                              defaultPinTheme
                                                                  .copyWith(
                                                            decoration:
                                                                defaultPinTheme
                                                                    .decoration!
                                                                    .copyWith(
                                                              color: fillColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              border: Border.all(
                                                                  color:
                                                                      focusedBorderColor),
                                                            ),
                                                          ),
                                                          errorPinTheme:
                                                              defaultPinTheme
                                                                  .copyBorderWith(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .redAccent),
                                                          ),
                                                          onCompleted:
                                                              (pin) async {
                                                            authCont
                                                                .setCode(pin);
                                                          },
                                                        )),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                        top: kMarginY * 2,
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: InkWell(
                                                        onTap: () async {
                                                          await authCont
                                                              .sendCode();
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                  Text(
                                                                      'ncodeR'
                                                                          .tr,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              kMdText,
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              AppColors.secondarytext)),
                                                                  Text(
                                                                      'resend'
                                                                          .tr,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              kMdText,
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              AppColors.primaryGreen))
                                                                ])),
                                                            /*     TextButton(
                                                          onPressed: () async {
                                                            await authCont
                                                                .sendCode();
                                                          },
                                                          child: Row(children: [
                                                            Text('ncodeR'.tr,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        kMdText,
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: AppColors
                                                                        .secondarytext)),
                                                            Container(
                                                                width:
                                                                    kWidth * .1,
                                                                child: Text(
                                                                    'resend'.tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            kMdText,
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: AppColors
                                                                            .primaryGreen)))
                                                          ]),
                                                        )
                                                     */
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ])),
                                          ])
                                        : Column(children: [
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                margin: EdgeInsets.symmetric(
                                                  vertical: kMarginY,
                                                ),
                                                child: AppTextTitleNoE(
                                                  text: 't2Create'.tr,
                                                  bolder: true,
                                                  big: true,
                                                )),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: kMarginY * 2,
                                              ),
                                              child: AppInputPassword(
                                                  obscureText: true,
                                                  controller: authCont
                                                      .regepasswordController,
                                                  validator: (val) {
                                                    return authCont
                                                                .regepasswordController
                                                                .text
                                                                .length <
                                                            8
                                                        ? 'validatornewpass'.tr
                                                        : null;
                                                  },
                                                  label: "Mot de passe"),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: kMarginY * 2,
                                              ),
                                              child: AppInputPassword(
                                                  obscureText: true,
                                                  controller: authCont
                                                      .rregepasswordController,
                                                  validator: (val) {
                                                    return authCont
                                                                .regepasswordController
                                                                .text !=
                                                            authCont
                                                                .rregepasswordController
                                                                .text
                                                        ? 'difpassword'.tr
                                                        : null;
                                                  },
                                                  label: 'confirmpassword'.tr),
                                            ),
                                          ]),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     AppButton(
                                    //       text: 'back'.tr,
                                    //       size: MainAxisSize.max,
                                    //       textColor: AppColors.blackcolor,
                                    //       shadow: false,
                                    //       width: kWidth / 2.5,
                                    //       border: Border.all(
                                    //         color: AppColors.blackcolor,
                                    //       ),
                                    //       bgColor: AppColors.whitecolor,
                                    //       onTap: () async {
                                    //         authCont.changePageIndex(false);
                                    //       },
                                    //     ),
                                    //     AppButton(
                                    //       text: 'sub'.tr,
                                    //       width: kWidth / 2.5,
                                    //       size: MainAxisSize.max,
                                    //       bgColor: AppColors.primaryGreen,
                                    //       onTap: () async {
                                    //         if (authCont.regState == 1) {
                                    //           if (formKey.currentState!
                                    //               .validate()) {
                                    //             // if(authCont.isConnected == 1){
                                    //             //   authCont.loader.open(context);
                                    //             // }
                                    //             //  else if (authCont.isConnected == 2){
                                    //             //   authCont.loader.close();
                                    //             //      Get.offNamedUntil(AppLinks.HOME, (route) => false);
                                    //             // }
                                    //             await authCont.loginUser(context);
                                    //           }
                                    //         } else {
                                    //           authCont.changePageIndex(true);
                                    //         }
                                    //       },
                                    //     ),
                                    //   ],
                                    // )
                                    //  Padding(
                                    //             padding: EdgeInsets.only(top: kMarginY * 3),
                                    //             child: AppButton(
                                    //               text: 'regbtn'.tr,
                                    //               size: MainAxisSize.max,
                                    //               onTap: () async {
                                    //                 //print('dsds');

                                    //                 if (formKey.currentState!.validate()) {
                                    //                   // if(authCont.isConnected == 1){
                                    //                   //   authCont.loader.open(context);
                                    //                   // }
                                    //                   //  else if (authCont.isConnected == 2){
                                    //                   //   authCont.loader.close();
                                    //                   //      Get.offNamedUntil(AppLinks.HOME, (route) => false);
                                    //                   // }
                                    //                   await authCont.loginUser(context);
                                    //                 }
                                    //               },
                                    //             ),
                                    //           )
                                  ]))))),
                  bottomNavigationBar: Container(
                    alignment: Alignment.center,
                    height: kHeight * .12,
                    margin: EdgeInsets.symmetric(horizontal: kMarginX),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppButton(
                            text: 'back'.tr,
                            size: MainAxisSize.max,
                            textColor: AppColors.primaryText,
                            shadow: false,
                            width: kWidth / 2.5,
                            border: Border.all(color: AppColors.primaryText),
                            bgColor: AppColors.whitecolor,
                            onTap: () async {
                              if (authCont.regState == 0) {
                                authCont.cleanA();
                                Get.back();
                              } else {
                                authCont.changePageIndex(false);
                              }
                            },
                          ),
                          AppButton(
                            text: authCont.regState == 0
                                ? 'next'.tr
                                : 'regbtn'.tr,
                            width: kWidth / 2.5,
                            size: MainAxisSize.max,
                            bgColor: AppColors.primaryGreen,
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                if (authCont.regNameController.text.isEmpty ||
                                    authCont
                                        .regSurnameController.text.isEmpty ||
                                    authCont.regEmailController.text.isEmpty ||
                                    authCont.regVilleController.text.isEmpty) {
                                  toastShowError(
                                      'Veuillez remplir tous les champs',
                                      Get.context);
                                } else {
                                  if (authCont.regState == 1) {
                                    await authCont.regUser();
                                  } else {
                                    if (authCont.regNameController.text
                                            .isNotEmpty ||
                                        authCont.regSurnameController.text
                                            .isNotEmpty ||
                                        authCont.regEmailController.text
                                            .isNotEmpty ||
                                        authCont.regVilleController.text
                                            .isNotEmpty ||
                                        authCont.regepasswordController.text
                                            .isNotEmpty ||
                                        authCont.rregepasswordController.text
                                            .isNotEmpty) {
                                      if (authCont.code.length == 0) {
                                        authCont.sendCode();
                                      } else {
                                        if (authCont.code ==
                                            authCont.codeController.text) {
                                          authCont.changePageIndex(true);
                                        } else {
                                          toastShowError(
                                              'Veuillez renseigner le code recu par mail',
                                              Get.context);
                                        }
                                      }
                                    } else {
                                      toastShowError(
                                          'Veuillez remplir tous les champs',
                                          Get.context);
                                    }
                                  }
                                }
                              }
                            },
                          ),
                        ]),
                  ),
                ),
                onWillPop: () {
                  Get.back();
                  return authCont.cleanA();
                })));
  }
}
