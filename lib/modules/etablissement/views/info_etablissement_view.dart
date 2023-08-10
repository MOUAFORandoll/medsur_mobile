import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_button.dart';
import 'package:medsur_app/general_component/index_widgets.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/alerte/components/app_alert_component.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:medsur_app/modules/auth/models/oauth.dart';
import 'package:medsur_app/modules/etablissement/components/app_alert_etablissement_component.dart';
import 'package:medsur_app/modules/etablissement/controller/etablissement_controller.dart';
import 'package:medsur_app/modules/home/components/App_btn_text.dart';
import 'package:medsur_app/modules/home/components/app_btn_home_add.dart';
import 'package:medsur_app/modules/home/controller/home_controller.dart';
import 'package:medsur_app/utils/routing.dart';
import 'package:medsur_app/utils/validators.dart';
import '../../../constants/assets.dart';
import 'package:medsur_app/styles/dimension.dart';
import 'package:medsur_app/general_component/app_input_search.dart';
import 'package:medsur_app/general_component/app_text_title.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/home/components/App_btn_text.dart';
import 'package:medsur_app/modules/home/components/app_btn_home.dart';
import '../../../constants/index_common.dart';

class InfoEtablissementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EtablissementController>(
        builder: (dController) => Scaffold(
              backgroundColor: AppColors.grey3,
              appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left_outlined,
                    ),
                    tooltip:
                        MaterialLocalizations.of(context).backButtonTooltip,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  title: Text('etablissementtitlee1'.tr),
                  centerTitle: true,
                  backgroundColor: AppColors.grey3,
                  elevation: 0.2),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: kMarginX),
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
                                height: 200,
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
                        child: AppButton(
                          text: 'update'.tr,
                          // width: kWidth / 2.5,
                          size: MainAxisSize.max,
                          bgColor: AppColors.primaryGreen,
                          onTap: () async {
                            await dController.updateEtablissement();
                            // Get.dialog(
                            //     ModalDialog()); // await _controller.newEtablissement();
                            // if (result) {
                            //   Get.toNamed(
                            //     AppLinks.LIST_ETABLISSEMENT,
                            //   );
                            // }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // bottomNavigationBar: Container(
              //   height: kHeight * .12,
              //   child: Text('fddfdf'),
              // ),
            ));
  }
}
