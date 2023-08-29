import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:medsur_app/general_component/app_text_title_noe.dart';
import 'package:medsur_app/utils/validators.dart';
import '../../../constants/index_common.dart';
import 'package:medsur_app/general_component/index_widgets.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';

import 'package:pinput/pinput.dart';

class ForgotPasswordView extends StatelessWidget {
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
      border: Border.all(color: AppColors.grey2),
    ),
  );
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return GetBuilder<AuthController>(
        builder: (authCont) => Container(
            decoration: PageStyle.decoration,
            child: WillPopScope(
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                        leading: IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_left_outlined,
                            // color: AppColors.primaryGreen,
                          ),
                          tooltip: MaterialLocalizations.of(context)
                              .backButtonTooltip,
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
                    body: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: kMarginX),
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: !authCont.hasSendMail
                                ? Column(
                                    children: [
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.symmetric(
                                            vertical: kMarginY,
                                          ),
                                          child: AppTextTitleNoE(
                                            text: 't1Reini'.tr,
                                            bolder: true,
                                            big: true,
                                          )),
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: kMarginY,
                                          ),
                                          child: Text('t2Reini'.tr,
                                              style: TextStyle(
                                                  fontSize: kMediumText,
                                                  color: AppColors
                                                      .secondarytext))),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: kMarginY * 2,
                                        ),
                                        child: AppInput(
                                          controller: authCont.emailFController,
                                          label: 'mail'.tr,
                                          icon: Icon(
                                            Icons.check_circle_sharp,
                                            color: authCont.validMailForgot
                                                ? AppColors.primaryGreen
                                                : AppColors.grayColor,
                                          ),
                                          onChanged: (value) {
                                            authCont.validMailForgotU(
                                                !(Validators.isValidEmail(
                                                        value) ==
                                                    'invalidMail'.tr));
                                          },
                                          validator: (value) {
                                            //  int.parse(authCont.emailController.text)
                                            return Validators.isValidEmail(
                                                value);
                                          },
                                        ),
                                      ),
                                      Container(
                                          padding: EdgeInsets.only(
                                            top: kMarginY * 10,
                                          ),
                                          child: AppButton(
                                            size: MainAxisSize.max,
                                            text: 'send'.tr,
                                            onTap: () async {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                await authCont.forgotPassword();
                                              }
                                            },
                                          ))
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.symmetric(
                                            vertical: kMarginY,
                                          ),
                                          child: AppTextTitleNoE(
                                            text: 'verifyaddre'.tr,
                                            bolder: true,
                                            big: true,
                                          )),
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: kMarginY,
                                          ),
                                          child: Text('verifydescrip'.tr,
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: kMediumText,
                                                  color: AppColors
                                                      .secondarytext))),
                                      Padding(
                                          padding: EdgeInsets.only(
                                            top: kMarginY * 2,
                                          ),
                                          child: Pinput(
                                            focusedPinTheme:
                                                defaultPinTheme.copyWith(
                                              decoration: defaultPinTheme
                                                  .decoration!
                                                  .copyWith(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: focusedBorderColor),
                                              ),
                                            ),
                                            submittedPinTheme:
                                                defaultPinTheme.copyWith(
                                              decoration: defaultPinTheme
                                                  .decoration!
                                                  .copyWith(
                                                color: fillColor,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: focusedBorderColor),
                                              ),
                                            ),
                                            errorPinTheme:
                                                defaultPinTheme.copyBorderWith(
                                              border: Border.all(
                                                  color: Colors.redAccent),
                                            ),
                                            onCompleted: (pin) async {
                                              authCont.setCode(pin);
                                            },
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(
                                            top: kMarginY * 2,
                                          ),
                                          alignment: Alignment.center,
                                          child: InkWell(
                                              onTap: () async {
                                                await authCont.forgotPassword();
                                              },
                                              child: Row(children: [
                                                Expanded(
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                      Text('ncodeR'.tr,
                                                          style: TextStyle(
                                                              fontSize: kMdText,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              color: AppColors
                                                                  .secondarytext)),
                                                      Text('resend'.tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: kMdText,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: AppColors
                                                                  .primaryGreen))
                                                    ]))
                                              ]))),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: kMarginY * 10),
                                        child: AppButton(
                                          text: 'send'.tr,
                                          size: MainAxisSize.max,
                                          onTap: () async {
                                            await authCont.verifyCode();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    )),
                onWillPop: () {
                  Get.back();
                  return authCont.cleanA();
                })));
  }
}
