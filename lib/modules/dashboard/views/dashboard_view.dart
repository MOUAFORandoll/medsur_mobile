import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_button.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:medsur_app/modules/auth/models/oauth.dart';
import 'package:medsur_app/modules/dashboard/controller/dashboard_controller.dart';
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

class DashBoard extends StatelessWidget {
  final String? name;
  DashBoard({this.name});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
        builder: (dController) => Stack(
              children: [
                CustomScrollView(
                  // controller: _scrollController,
                  slivers: [
                    // Add the app bar to the CustomScrollView.
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      elevation: 0,
                      backgroundColor: AppColors.grey3,
                      flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kMarginX * 0.8),
                              decoration: BoxDecoration(
                                color: AppColors.grey3,
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextTitle(
                                        text: 'bienvenue'.tr,
                                        bolder: true,
                                        color: AppColors.secondaryBlue),
                                    Container(
                                        width: kMdWidth * 1.3,
                                        margin:
                                            EdgeInsets.only(top: kMarginY * 1),
                                        child: AppTextTitle(
                                            text: name == null || name == 'null'
                                                ? ""
                                                : name.toString(),
                                            bolder: false,
                                            color: AppColors.secondaryBlue)),
                                    Container(
                                        // height: kMdHeight * .08,
                                        // width: kMdWidth * 1.2,
                                        margin:
                                            EdgeInsets.only(top: kMarginY * 4),
                                        // alignment: Alignment.center,
                                        // padding: EdgeInsets.all(8),
                                        child: AppInputSearch(
                                            status: dController.isPermission(
                                                'Rechercher un patient'),
                                            placeholder: 'searchp'.tr)),
                                  ]))),
                      expandedHeight: 150,
                      // pinned: true,
                    ),
                    SliverList(
                        // mainAxisSpacing: 20.0,
                        // crossAxisSpacing: 30.0,
                        delegate: SliverChildBuilderDelegate(
                      // The builder function returns a ListTile with a title that
                      // displays the index of the current item.
                      (context, index) => Container(
                          // height: double.maxFinite,
                          color: AppColors.grey3,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: kMarginY),
                          padding:
                              EdgeInsets.symmetric(horizontal: kMarginX * 0.8),
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  margin:
                                      EdgeInsets.symmetric(vertical: kMarginY),
                                  child: AppTextTitle(
                                      text: 'categories'.tr,
                                      percent: 1.5,
                                      bolder: true,
                                      color: AppColors.secondaryBlue)),
                              Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppbtnHome(
                                        libelle: 'rendezvous'.tr,
                                        image: Assets.rendez_vous,
                                        status: dController.isPermission(
                                            'Créer un rendez-vous'),
                                        onTap: () {}),
                                    AppbtnHome(
                                        libelle: 'alert'.tr,
                                        image: Assets.alerte,
                                        status: dController
                                            .isPermission('Créer une alerte'),
                                        onTap: () {
                                          Get.toNamed(
                                            AppLinks.ALERTE,
                                          );
                                        }),
                                    // AppbtnHome(
                                    //     libelle: 'parcoursante'.tr,
                                    //     status: dController.isPermission(''),
                                    //     image: Assets.parcour_de_soins,
                                    //     onTap: () {}),
                                  ]),
                              // Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceAround,
                              //     crossAxisAlignment: CrossAxisAlignment.center,
                              //     children: [
                              //       AppbtnHomeAdd(),
                              //       AppbtnHomeAdd(),
                              //       AppbtnHomeAdd(),
                              //     ]),
                              // Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceAround,
                              //     crossAxisAlignment: CrossAxisAlignment.center,
                              //     children: [
                              //       AppbtnHome(
                              //           libelle: "Messages",
                              //           image: Assets.envelope,
                              //           select: (dController.selected == 4),
                              //           onTap: () {
                              //             dController.setSelected(4);
                              //           }),
                              //       AppbtnHome(
                              //           libelle: "'rendezvous'.tr",
                              //           image: Assets.clipboard,
                              //           select: (dController.selected == 5),
                              //           onTap: () {
                              //             dController.setSelected(5);
                              //           })
                              //     ])
                            ]),
                          )),
                      childCount: 1,
                    )),
                  ],
                ),
              ],
            ));
  }
}
