import 'package:get/get.dart';
import 'package:flutter/material.dart'; 
import 'package:medsur_app/general_component/app_text_title_noe.dart'; 
import '../../../constants/index_common.dart'; 
import 'package:medsur_app/general_component/index_widgets.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
 

class NewPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
     AuthController authCont = Get.find<AuthController>();
    return Container(
        decoration: PageStyle.decoration,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left_outlined,
                    color: AppColors.primaryGreen,
                  ),
                  onPressed: () {
                    authCont.cleanA();
                    Get.back();
                  },
                ),
                backgroundColor: Colors.transparent,
                elevation: 0),
            body: SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: kMarginX),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.symmetric(
                              vertical: kMarginY,
                            ),
                            child: AppTextTitleNoE(
                              text: 'newpasst'.tr,
                              bolder: true,
                              big: true,
                            )),
                        Container(
                            margin: EdgeInsets.symmetric(
                              vertical: kMarginY * 2,
                            ),
                            child: Text('newpassd'.tr,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: kMediumText,
                                    color: AppColors.secondarytext))),
                        Padding(
                          padding: EdgeInsets.only(
                            top: kMarginY * 2,
                          ),
                          child: AppInputPassword(
                              obscureText: true,
                              controller: authCont.fpasswordController,
                              validator: (val) {
                                return authCont
                                            .fpasswordController.text.length <
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
                              controller: authCont.rfpasswordController,
                              validator: (val) {
                                return authCont.fpasswordController.text !=
                                        authCont.rfpasswordController.text
                                    ? 'difpassword'.tr
                                    : null;
                              },
                              label: 'confirmpassword'.tr),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: kMarginY * 5,
                          ),
                          child: AppButton(
                            size: MainAxisSize.max,
                            text: 'reinitialise'.tr,
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                await authCont.newPasswordUser();
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
} 