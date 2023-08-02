import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_button.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/alerte/components/app_alert_component.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:medsur_app/modules/auth/models/oauth.dart';
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

class ListAlertView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlerteController>(
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
                  title: Text('hAlerte'.tr),
                  centerTitle: true,
                  backgroundColor: AppColors.grey3,
                  elevation: 0.2),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: kMarginX),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: kMarginY * 5),
                          child: AppInputSearch(
                              border: true,
                              placeholder: 'search'.tr,
                              controller: dController.searchController,
                              onChanged: (value) =>
                                  dController.searchAlertt())),
                      dController.searchController.text.length != 0
                          ? dController.listSearchAlert.length == 0
                              ? Container(
                                  // height: kSmHeight,
                                  // width: kSmWidth / 4.2,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      vertical: kMarginY * 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Assets.listblanck,
                                          width: 50,
                                          height: 50,
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.symmetric(
                                                vertical: kMarginY * 2),
                                            child: Text(
                                              'No history',
                                              style: TextStyle(
                                                  fontSize: kMdText,
                                                  fontFamily: 'Montserrat',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: AppColors.grayColor,
                                                  fontWeight: FontWeight.w400),
                                            ))
                                      ]),
                                )
                              : Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(top: kMarginY * 2),
                                  child: SingleChildScrollView(
                                      child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        dController.listSearchAlert.length,
                                    itemBuilder: (_ctx, index) {
                                      return AppAlertComponent(
                                          alerte: dController
                                              .listSearchAlert[index]);
                                    },
                                  )))
                          : Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: kMarginY * 2),
                              child: SingleChildScrollView(
                                  child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: dController.listUserAlert.length,
                                itemBuilder: (_ctx, index) {
                                  return AppAlertComponent(
                                      alerte: dController.listUserAlert[index]);
                                },
                              ))),
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
