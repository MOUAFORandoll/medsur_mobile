import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_button.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/alerte/components/app_alert_component.dart';
import 'package:medsur_app/modules/alerte/components/app_list_speciality_component.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:medsur_app/modules/auth/models/oauth.dart';
import 'package:medsur_app/modules/etablissement/components/app_alert_etablissement_component.dart';
import 'package:medsur_app/modules/etablissement/components/app_list_speciality_etablissement_update_component.dart';
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

class ListSpecialiteEtablissementView extends StatelessWidget {
  var _format = new FormatData();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EtablissementController>(
        builder: (_eController) => Scaffold(
            backgroundColor: AppColors.grey3,
            appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left_outlined,
                  ),
                  tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                  onPressed: () {
                    Get.back();
                  },
                ),
                actions: [
                  InkWell(
                    child: Container(
                        margin: EdgeInsets.only(
                          right: 20,
                        ),
                        height: 20,
                        width: 20,
                        padding: EdgeInsets.all(3),
                        // decoration: BoxDecoration(
                        //   color: AppColors.primaryGreen_OP,
                        //   borderRadius: BorderRadius.circular(30),
                        // ),
                        child: Icon(Icons.add)),
                    onTap: () => Get.bottomSheet(
                      AppListSpecialityEtablissementUpdateComponent(),
                      isScrollControlled: true,
                      barrierColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  )
                ],
                title: Text('speciality1'.tr),
                centerTitle: true,
                backgroundColor: AppColors.grey3,
                elevation: 0.2),
            body: Container(
                height: kHeight * .95,
                padding: EdgeInsets.symmetric(horizontal: kMarginX),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: AppColors.whitecolor,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Container(
                      //     alignment: Alignment.centerLeft,
                      //     margin: EdgeInsets.only(top: kMarginY * 5),
                      //     child: AppInputSearchSpeciality(
                      //         border: true,
                      //         placeholder: 'search'.tr,
                      //         controller: _eController.searchSpeController,
                      //         onChanged: (value) => _eController.searchSpe())),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: kMarginY * 2),
                          child: SingleChildScrollView(
                              child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                _eController.etablissement.specialites.length,
                            itemBuilder: (_ctx, index) {
                              return InkWell(
                                  onTap: () {
                                    // _eController.addSpeciality(
                                    //   _eController.searchSpeController.text
                                    //               .length ==
                                    //           0
                                    //       ? _eController.listSpeciality[index]
                                    //       : _eController.listSearchSpe[index],
                                    // );
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: AppColors.grey7,
                                          )),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: kMarginX / 2,
                                          vertical: kMarginY * 2),
                                      margin: EdgeInsets.symmetric(
                                          vertical: kMarginY / 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Text(
                                            /*  _format.capitalizeFirstLetter(_eController
                                                        .searchSpeController
                                                        .text
                                                        .length ==
                                                    0
                                                ? */
                                            Get.find<ActionController>()
                                                        .lang
                                                        .toLowerCase() ==
                                                    'en'
                                                ? _eController
                                                    .etablissement
                                                    .specialites[index]
                                                    .libelle_en
                                                : _eController.etablissement
                                                    .specialites[index].libelle
                                            /*   : Get.find<ActionController>()
                                                            .lang
                                                            .toLowerCase() ==
                                                        'en'
                                                    ? _eController
                                                        .listSearchSpe[index]
                                                        .libelle_en
                                                    : _eController
                                                        .listSearchSpe[index]
                                                        .libelle) */
                                            ,
                                            style: TextStyle(
                                                // color: AppColors.primaryGreen,
                                                ),
                                          ))),
                                          InkWell(
                                            child: Icon(Icons.close),
                                            onTap: () {
// remove specialite from etablissement
                                              _eController.removeSpecialite(
                                                  _eController.etablissement
                                                      .specialites[index].id);
                                            },
                                          )
                                        ],
                                      )));
                            },
                          )))
                    ],
                  ),
                ))));
  }
}
