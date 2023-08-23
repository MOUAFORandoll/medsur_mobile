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
import '../../../constants/assets.dart';
import 'package:medsur_app/styles/dimension.dart';
import 'package:medsur_app/general_component/app_input_search.dart';
import 'package:medsur_app/general_component/app_text_title.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/home/components/App_btn_text.dart';
import 'package:medsur_app/modules/home/components/app_btn_home.dart';
import '../../../constants/index_common.dart';

class ActivityView extends StatelessWidget {
  final String? name;
  ActivityView({this.name});

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
                                        text: 'activity'.tr,
                                        bolder: true,
                                        color: AppColors.primaryBlue),
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
                            child: Column(children: []),
                          )),
                      childCount: 1,
                    )),
                  ],
                ),
              ],
            ));
  }
}
