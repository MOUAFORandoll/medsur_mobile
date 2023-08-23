import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
import 'package:medsur_app/utils/apiUrl.dart';
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
import 'package:cached_network_image/cached_network_image.dart';

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
                      color: AppColors.primaryBlue,
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
                          child: Column(children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(bottom: kMarginY / 2),
                                child: Text(
                                  'Logo'.tr,
                                  style: TextStyle(
                                      fontSize: kMediumText,
                                      fontFamily: 'Montserrat',
                                      color: AppColors.grey8,
                                      fontWeight: FontWeight.w500),
                                )),
                            InkWell(
                              onTap: () => Get.dialog(ModalDialogImageUpdate()),
                              child: dController.etablissement.logo != null
                                  ? CachedNetworkImage(
                                      height: kMdHeight * .3,
                                      width: Get.width,
                                      fit: BoxFit.cover,
                                      imageUrl: ApiUrl.baseUrlAlerte +
                                          '/' +
                                          dController.etablissement.logo.path,
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.grey8,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                      placeholder: (context, url) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryGreen,
                                          ),
                                          child: Center(
                                              child: CircularProgressIndicator(
                                            color: AppColors.primaryGreen,
                                          )),
                                        );
                                      },
                                      errorWidget: (context, url, error) {
                                        return CircleAvatar(
                                            backgroundColor:
                                                AppColors.primaryGreen,
                                            radius: 50,
                                            backgroundImage:
                                                AssetImage(Assets.listblanck));
                                      },
                                    )
                                  : Container(
                                      height: kMdHeight * .3,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: AppColors.grey8,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Icon(
                                        Icons.add,
                                        size: 50,
                                        color: Colors.white,
                                      )),
                            ),
                          ])),
                      Padding(
                        padding: EdgeInsets.only(
                          top: kMarginY * 2,
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
                      Container(
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
                              initialCountryCode: dController.codeCountry,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primaryGreen, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.grey7, width: 1.5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: AppColors.grey7, width: 1.5),
                                ),
                                // border: OutlineInputBorder(
                                //   borderSide: BorderSide(),
                                // ),
                              ),
                              controller: dController.phoneController,
                              languageCode: "en",
                              onChanged: (phone) {
                                print(phone.number);
                                // dController.setPhoneCode(
                                //   phone.number,
                                // );
                              },
                              onCountryChanged: (country) {
                                print(
                                    'Country changed to: ' + country.dialCode);
                                dController.setCode(
                                    country.dialCode, country.code);
                              },
                            ),
                            //  AppInput(
                            //         controller: dController.phoneController,
                            //         onChanged: (value) {},
                            //         label: '',
                            //         validator: (value) {
                            //           //  int.parse(dController.emailController.text)
                            //           return Validators.isValidEmailOrNum(
                            //               dController.phoneController.text);
                            //         },
                            //       ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: kMarginY,
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

class ModalDialogImageUpdate extends StatelessWidget {
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
                onTap: () {
                  eController.updateImagelogoCamera();
                }),
          ),
          AppButton(
              text: 'Galerie'.tr,
              width: kWidth / 2.5,
              size: MainAxisSize.max,
              bgColor: AppColors.grey1,
              onTap: () {
                eController.updateImagelogoGallery();
              }),
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
