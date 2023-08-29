import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_button.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/alerte/components/app_alert_component.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:medsur_app/modules/auth/models/oauth.dart';
import 'package:medsur_app/modules/etablissement/controller/etablissement_controller.dart';
import 'package:medsur_app/modules/home/components/App_btn_text.dart';
import 'package:medsur_app/modules/home/components/app_btn_home_add.dart';
import 'package:medsur_app/modules/home/controller/home_controller.dart';
import 'package:medsur_app/utils/routing.dart';
import '../../../constants/assets.dart';
import 'package:medsur_app/styles/dimension.dart';
import 'package:medsur_app/general_component/app_input_search.dart';
import 'package:medsur_app/general_component/app_text_title.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/home/components/App_btn_text.dart';
import 'package:medsur_app/modules/home/components/app_btn_home.dart';
import '../../../constants/index_common.dart';

class NewEtablissementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EtablissementController>(
        builder: (_controller) => WillPopScope(
            child: Scaffold(
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
                  title: Text(
                    _controller.buildTitle(),
                    style: TextStyle(
                      color: AppColors.primaryText,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: AppColors.grey3,
                  elevation: 0.2),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: kMarginX).add(
                    EdgeInsets.only(
                        top: _controller.currentIndex == 0
                            ? kMarginY * 5
                            : kMarginY)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _controller.buildContent(),
                      Container(
                        margin: EdgeInsets.only(top: kMarginY * 5),
                        child: _controller.currentIndex == 0
                            ? Container(
                                // margin: EdgeInsets.only(top: kMarginY * 3),
                                child: AppButton(
                                text: 'next'.tr,
                                size: MainAxisSize.max,
                                bgColor: AppColors.primaryGreen,
                                onTap: () async {
                                  _controller.changePageIndex(
                                    true,
                                  );
                                },
                              ))
                            : _controller.currentIndex != 2
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppButton(
                                        text: 'back'.tr,
                                        size: MainAxisSize.max,
                                        textColor: AppColors.primaryText,
                                        shadow: false,
                                        width: kWidth / 2.5,
                                        border: Border.all(
                                          color: AppColors.primaryText,
                                        ),
                                        bgColor: AppColors.whitecolor,
                                        onTap: () async {
                                          _controller.changePageIndex(
                                            false,
                                          );
                                        },
                                      ),
                                      AppButton(
                                        text: 'next'.tr,
                                        width: kWidth / 2.5,
                                        size: MainAxisSize.max,
                                        bgColor: AppColors.primaryGreen,
                                        onTap: () async {
                                          _controller.changePageIndex(
                                            true,
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppButton(
                                        text: 'back'.tr,
                                        size: MainAxisSize.max,
                                        textColor: AppColors.primaryText,
                                        shadow: false,
                                        width: kWidth / 2.5,
                                        border: Border.all(
                                          color: AppColors.primaryText,
                                        ),
                                        bgColor: AppColors.whitecolor,
                                        onTap: () async {
                                          _controller.changePageIndex(
                                            false,
                                          );
                                        },
                                      ),
                                      AppButton(
                                        text: 'next'.tr,
                                        width: kWidth / 2.5,
                                        size: MainAxisSize.max,
                                        bgColor: AppColors.primaryGreen,
                                        onTap: () async {
                                          Get.dialog(
                                              ModalDialog()); // await _controller.newEtablissement();
                                          // if (result) {
                                          //   Get.toNamed(
                                          //     AppLinks.LIST_ETABLISSEMENT,
                                          //   );
                                          // }
                                        },
                                      ),
                                    ],
                                  ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onWillPop: () {
              Get.back();
              return _controller.check(0);
            }));
  }
}

class ModalDialog extends StatelessWidget {
  var eController = Get.find<EtablissementController>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'correctinfoeta'.tr,
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
            child: Text("confirmcreate".tr,
                style: TextStyle(color: AppColors.whitecolor)),
            style: ElevatedButton.styleFrom(
              primary: AppColors.primaryGreen,
            ),
            onPressed: () async {
              await eController.newEtablissement();
            }),
      ],
    );
  }
}
