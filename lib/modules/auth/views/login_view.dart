import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:medsur_app/constants/index_common.dart';
import '../../../utils/validators.dart';
import '../controller/auth_controller.dart';
import 'package:medsur_app/utils/routing.dart';
import '../../../general_component/index_widgets.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return GetBuilder<AuthController>(
        builder: (authCont) => Container(
            decoration: PageStyle.decoration,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: kMarginX),
                        child: SingleChildScrollView(
                            child: Form(
                                key: formKey,
                                child: Column(children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: kMarginY * 2,
                                      bottom: kMarginY,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Image.asset(
                                      Assets.logoLong,
                                      fit: BoxFit.fill,
                                      height: kMdHeight / 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: kMarginY * 5,
                                    ),
                                    child: Image.asset(
                                      Assets.onboard,
                                      fit: BoxFit.fill,
                                      height: kMdHeight / 4,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: kMarginY,
                                    ),
                                    child: AppInput(
                                      controller: authCont.emailController,
                                      icon: Icon(
                                        Icons.check_circle_sharp,
                                        color: authCont.validMailLogin
                                            ? AppColors.primaryGreen
                                            : AppColors.grayColor,
                                      ),
                                      onChanged: (value) {
                                        authCont.validMailLoginU(
                                            !(Validators.isValidEmailOrNum(
                                                    authCont.emailController
                                                        .text) ==
                                                'invalidMail'.tr));
                                      },
                                      label: 'labellog'.tr,
                                      validator: (value) {
                                        //  int.parse(authCont.emailController.text)
                                        return Validators.isValidEmailOrNum(
                                            authCont.emailController.text);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: kMarginY * 2,
                                    ),
                                    child: AppInputPassword(
                                      controller: authCont.passwordController,
                                      label: 'labelpassword'.tr,
                                      obscureText: true,
                                      validator: (value) {
                                        return Validators.required(
                                            'labelpassword'.tr,
                                            authCont.passwordController.text);
                                      },
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Get.toNamed(AppLinks.FORGOT);
                                          },
                                          child: Text('forgotpass'.tr,
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color:
                                                      AppColors.primaryGreen)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: kMarginY * 3),
                                    child: AppButton(
                                      text: 'logbtn'.tr,
                                      size: MainAxisSize.max,
                                      onTap: () async {
                                        if (formKey.currentState!.validate()) {
                                          await authCont.loginUser();
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Get.toNamed(AppLinks.REGISTER);
                                          },
                                          child: Text('regbtn'.tr,
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color:
                                                      AppColors.primaryGreen)),
                                        )
                                      ],
                                    ),
                                  ),
                                ]))))))));
  }
}
