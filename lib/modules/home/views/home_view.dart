import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_button.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:medsur_app/modules/home/components/App_btn_text.dart';
import 'package:medsur_app/modules/home/components/app_btn_drawer.dart';
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
import '../components/app_btn_deconnect.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medsur_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:medsur_app/general_component/app_lang_button.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (hController) => GetBuilder<DashBoardController>(
          builder: (dController) => Scaffold(
              key: hController.scaffoldKey,
              backgroundColor: AppColors.grey3,
              appBar: AppBar(
                backgroundColor: AppColors.grey3,
                // title: Text(hController.buildTitle()),
                // centerTitle: true,
                elevation: 0,
                leading: InkWell(
                  child: Container(
                    // padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(

                        // borderRadius: BorderRadius.circular(20),
                        ),
                    child: Icon(Icons.menu,
                        color: AppColors.primaryBlue, size: 25.0),
                  ),
                  onTap: () async {
                    hController.openDrawer();
                  },
                ),
                actions: [
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: kMarginX),
                      // padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(

                          // borderRadius: BorderRadius.circular(20),
                          ),
                      child: Icon(Icons.notifications_outlined,
                          color: AppColors.primaryBlue, size: 25.0),
                    ),
                    onTap: () async {},
                  )
                ],
              ),
              drawer: Drawer(
                backgroundColor: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBlue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: hController.isInfos &&
                          hController.user != null &&
                          hController.roleUser != null
                      ? ListView(
                          padding: EdgeInsets.zero,
                          children: <Widget>[
                            DrawerHeader(
                              margin: EdgeInsets.only(bottom: 0.0),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryBlue,
                                  border: Border(bottom: BorderSide.none)),
                              child: Container(
                                  child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Image.asset(Assets.logoMedium,
                                              fit: BoxFit.fill,
                                              height: kMdHeight / 32,
                                              color: AppColors.whitecolor),
                                        ),
                                        InkWell(
                                            child: Icon(Icons.close,
                                                color: AppColors.whitecolor),
                                            onTap: () {
                                              hController.closeDrawer();
                                            })
                                      ]),
                                  Container(
                                      margin:
                                          EdgeInsets.only(top: kMarginY * 5),
                                      // alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Stack(children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: AppColors.whitecolor),
                                              padding: EdgeInsets.all(2),
                                              child: SvgPicture.asset(
                                                Assets.user,
                                                width: 50,
                                                height: 50,
                                              ),
                                            ),
                                            Positioned(
                                                top: 38,
                                                left: 38,
                                                child: hController.isInternet
                                                    ? Container(
                                                        height: 15,
                                                        width: 15,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: AppColors
                                                                .primaryGreen),
                                                        alignment: Alignment
                                                            .centerLeft,
                                                      )
                                                    : Container(
                                                        height: 15,
                                                        width: 15,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: AppColors
                                                                .grayColor),
                                                        alignment: Alignment
                                                            .centerLeft,
                                                      )),
                                          ]),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  left: kMarginX / 2),
                                              alignment: Alignment.centerLeft,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                        top: kMarginY,
                                                      ),
                                                      // height: 180,
                                                      width: kMdWidth * 1,
                                                      child: AppTextTitle(
                                                          bolder: true,
                                                          percent: 1.3,
                                                          text: hController
                                                              .user.name
                                                              .toString())),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                        top: kMarginY / 1.5,
                                                      ),
                                                      child: AppTextTitle(
                                                          bolder: true,
                                                          percent: 1.8,
                                                          text: hController
                                                              .roleUser.name
                                                              .toString())),
                                                ],
                                              )),
                                          Container(
                                            child: AppLangButton(),
                                          ),
                                        ],
                                      ))
                                ],
                              )),
                            ),
                            AppbtnDrawer(
                                title: 'Alerte',
                                present: hController.roleUser.name ==
                                    'Patient-Alerte',
                                onTap: () {
                                  Get.toNamed(
                                    AppLinks.NEW_ALERTE,
                                  );
                                }),
                            AppbtnDeconnect(),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              Container(
                                // height: 25,
                                // width: 25,
                                child: SpinKitCircle(
                                  color: Colors.blue,
                                  size: 40,
                                ),
                              )
                            ]),
                ),
              ),
              body: hController.buildContent(),
              bottomNavigationBar: CustomNavigationBar(
                iconSize: 25.0,
                elevation: 0.0,
                selectedColor: AppColors.primaryGreen,
                strokeColor: AppColors.primaryGreen,
                unSelectedColor: AppColors.grey6,
                backgroundColor: AppColors.whitecolor,

                // blurEffect: true,
                items: dController.isRole('Patient-Alerte')
                    ? [
                        CustomNavigationBarItem(
                            icon: Container(
                              height: kSmHeight,
                              width: kSmWidth / 4.2,
                              child: SvgPicture.asset(
                                Assets.home,
                                width: 90,
                                height: 90,
                                color: hController.currentIndex == 0
                                    ? AppColors.primaryGreen
                                    : AppColors.grey6,
                              ),
                            ),
                            title: Container(
                                padding: EdgeInsets.only(bottom: 3),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: hController.currentIndex == 0
                                            ? BorderSide(
                                                color: AppColors.primaryGreen,
                                                width: 2)
                                            : BorderSide.none,
                                        top: BorderSide.none)),
                                child: Text('home'.tr,
                                    style: TextStyle(
                                        fontSize: kSmText,
                                        fontWeight: FontWeight.bold,
                                        color: hController.currentIndex == 0
                                            ? AppColors.primaryGreen
                                            : AppColors.grey6)))),
                        CustomNavigationBarItem(
                          icon: Container(
                            height: kSmHeight,
                            width: kSmWidth / 4.2,
                            child: SvgPicture.asset(
                              Assets.user,
                              width: 90,
                              height: 90,
                              color: hController.currentIndex == 1
                                  ? AppColors.primaryGreen
                                  : AppColors.grey6,
                            ),
                          ),
                          title: Container(
                              padding: EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: hController.currentIndex == 1
                                          ? BorderSide(
                                              color: AppColors.primaryGreen,
                                              width: 2)
                                          : BorderSide.none,
                                      top: BorderSide.none)),
                              child: Text('account'.tr,
                                  style: TextStyle(
                                      fontSize: kSmText,
                                      fontWeight: FontWeight.bold,
                                      color: hController.currentIndex == 1
                                          ? AppColors.primaryGreen
                                          : AppColors.grey6))),
                        ),
                      ]
                    : [
                        CustomNavigationBarItem(
                            icon: Container(
                              height: kSmHeight,
                              width: kSmWidth / 4.2,
                              child: SvgPicture.asset(
                                Assets.home,
                                width: 90,
                                height: 90,
                                color: hController.currentIndex == 0
                                    ? AppColors.primaryGreen
                                    : AppColors.grey6,
                              ),
                            ),
                            title: Container(
                                padding: EdgeInsets.only(bottom: 3),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: hController.currentIndex == 0
                                            ? BorderSide(
                                                color: AppColors.primaryGreen,
                                                width: 2)
                                            : BorderSide.none,
                                        top: BorderSide.none)),
                                child: Text('home'.tr,
                                    style: TextStyle(
                                        fontSize: kSmText,
                                        fontWeight: FontWeight.bold,
                                        color: hController.currentIndex == 0
                                            ? AppColors.primaryGreen
                                            : AppColors.grey6)))),
                        CustomNavigationBarItem(
                            icon: Container(
                              height: kSmHeight,
                              width: kSmWidth / 4.2,
                              child: SvgPicture.asset(
                                Assets.activity,
                                width: 90,
                                height: 90,
                                color: hController.currentIndex == 1
                                    ? AppColors.primaryGreen
                                    : AppColors.grey6,
                              ),
                            ),
                            title: Container(
                              padding: EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: hController.currentIndex == 1
                                          ? BorderSide(
                                              color: AppColors.primaryGreen,
                                              width: 2)
                                          : BorderSide.none,
                                      top: BorderSide.none)),
                              child: Text('activity'.tr,
                                  style: TextStyle(
                                      fontSize: kSmText,
                                      fontWeight: FontWeight.bold,
                                      color: hController.currentIndex == 1
                                          ? AppColors.primaryGreen
                                          : AppColors.grey6)),
                            )),
                        CustomNavigationBarItem(
                          icon: Icon(Icons.search),

                          title: Container(
                              padding: EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: hController.currentIndex == 2
                                          ? BorderSide(
                                              color: AppColors.primaryGreen,
                                              width: 2)
                                          : BorderSide.none,
                                      top: BorderSide.none)),
                              child: Text('search'.tr,
                                  style: TextStyle(
                                      fontSize: kSmText,
                                      fontWeight: FontWeight.bold,
                                      color: hController.currentIndex == 2
                                          ? AppColors.primaryGreen
                                          : AppColors.grey6))),
                          // showBadge: _badgeShows[2],
                        ),
                        CustomNavigationBarItem(
                          icon: Container(
                            height: kSmHeight,
                            width: kSmWidth / 4.2,
                            child: SvgPicture.asset(
                              Assets.user,
                              width: 90,
                              height: 90,
                              color: hController.currentIndex == 3
                                  ? AppColors.primaryGreen
                                  : AppColors.grey6,
                            ),
                          ),
                          title: Container(
                              padding: EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: hController.currentIndex == 3
                                          ? BorderSide(
                                              color: AppColors.primaryGreen,
                                              width: 2)
                                          : BorderSide.none,
                                      top: BorderSide.none)),
                              child: Text('account'.tr,
                                  style: TextStyle(
                                      fontSize: kSmText,
                                      fontWeight: FontWeight.bold,
                                      color: hController.currentIndex == 3
                                          ? AppColors.primaryGreen
                                          : AppColors.grey6))),
                        ),
                      ],
                currentIndex: hController.currentIndex,
                onTap: (index) {
                  hController.changePageIndex(index);
                },
              ))),
    );
  }
}
