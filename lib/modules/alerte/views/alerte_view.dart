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

class AlertView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlerteController>(
        builder:
            (dController) => /*  Scaffold(
            backgroundColor: AppColors.grey3,
            appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left_outlined,
                    color: AppColors.primaryBlue,
                  ),
                  tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                  onPressed: () {
                    Get.back();
                  },
                ),
                title: Text(
                  'Alerte',
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                  ),
                ),
                centerTitle: true,
                // actions: [
                //   InkWell(
                //     child: Container(
                //       height: 40,
                //       width: 40,
                //       child: Container(
                //         child: Icon(Icons.add,
                //             color: AppColors.primaryGreen, size: kSmIcon),
                //       ),
                //     ),
                //     onTap: () async {},
                //   )
                // ],
                backgroundColor: Colors.transparent,
                elevation: 0),
            body: */
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: kMarginX, vertical: kMarginY * 2),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: kMdHeight / 8,
                            padding: EdgeInsets.symmetric(
                              horizontal: kPaddingX / 1.5,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.primaryBlue,
                                image: DecorationImage(
                                    fit: BoxFit.none,
                                    scale: 1.04,
                                    image: AssetImage(Assets.alertbg))),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                vertical: 5,
                                              ),
                                              child: Text(
                                                'titleAlerte'.tr,
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: kLg1Text,
                                                    color: AppColors.whitecolor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Container(
                                              width: kMdWidth * 1.4,
                                              child: Text(
                                                'titleAlerted'.tr,
                                                softWrap: true,
                                                maxLines: 3,
                                                style: TextStyle(
                                                  fontSize: kMdText,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.whitecolor,
                                                ),
                                              ))
                                        ]),
                                  ),
                                  Container(
                                    height: kMdHeight,
                                    width: kMdWidth / 2,
                                    child: Image.asset(Assets.alerte,
                                        color: AppColors.whitecolor,
                                        fit: BoxFit.contain),
                                  )
                                ]),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: kMarginY * 5),
                            padding: EdgeInsets.symmetric(horizontal: kMarginX),
                            child: AppButton(
                              text: 'cAlerte'.tr,
                              size: MainAxisSize.max,
                              bgColor: AppColors.primaryGreen,
                              onTap: () async {
                                dController.printT();
                                await dController.setUserInfo();
                                Get.toNamed(AppLinks.NEW_ALERTE);
                              },
                            ),
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: kMarginY * 5),
                              child: Text(
                                'hAlerte'.tr,
                                style: TextStyle(
                                  fontSize: kLg0Text,
                                  fontFamily: 'Montserrat',
                                  color: AppColors
                                      .primaryText, /*    fontWeight: FontWeight.bold */
                                ),
                              )),
                          dController.listUserAlert.length == 0
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
                                        dController.listUserAlert.length > 3
                                            ? 3
                                            : dController.listUserAlert.length,
                                    itemBuilder: (_ctx, index) {
                                      return AppAlertComponent(
                                          alerte:
                                              dController.listUserAlert[index]);
                                    },
                                  ))),
                          // dController.listUserAlert.length == 0 &&
                          dController.listUserAlert.length < 4
                              ? Container()
                              : Container(
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(top: kMarginY * 7),
                                  child: InkWell(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'btnHistoryAlerte'.tr,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                // fontSize: kSmText,
                                                color: AppColors.primaryGreen,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: Icon(
                                            Icons.arrow_forward,
                                            color: AppColors.primaryGreen,
                                            size: kSmIcon,
                                          ))
                                        ],
                                      ),
                                      onTap: () async {
                                        Get.toNamed(AppLinks.LIST_ALERTE);
                                      })),
                        ],
                      ),
                      // ),
                    )));
  }
}
