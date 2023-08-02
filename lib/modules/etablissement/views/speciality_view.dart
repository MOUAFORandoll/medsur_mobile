import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_button.dart';
import 'package:medsur_app/general_component/app_input_search_speciality.dart';
import 'package:medsur_app/general_component/app_loader_element.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/alerte/components/app_alert_component.dart';
import 'package:medsur_app/modules/alerte/components/app_list_speciality_component.dart';
import 'package:medsur_app/modules/alerte/components/app_speciality_component.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/models/speciality_model.dart';
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

class SpecialityView extends StatelessWidget {
  SpecialityView({this.dController});
  var dController;
  @override
  Widget build(BuildContext context) {
    var _format = new FormatData();

    return Container(
        child: SingleChildScrollView(
            child: Form(
                key: dController.specialityformKey,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                        child: Row(children: [
                          Expanded(
                              child: Text(
                            'sptl'.tr,
                            style: TextStyle(
                              fontSize: kMdText,
                              fontFamily: 'Montserrat',
                              color: AppColors.grey8,
                            ),
                          ))
                        ])),
                    dController.loadSpeciality
                        ? loaderElement()
                        : InkWell(
                            onTap: () => {
                              Get.bottomSheet(
                                AppListSpecialityComponent(),
                                isScrollControlled: true,
                                barrierColor: Colors.black26,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16)),
                                ),
                                backgroundColor: Colors.transparent,
                              )
                            },
                            child: Container(
                              width: kWidth,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: kMarginY),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: AppColors.grey7, width: 1.5),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: kMarginY * 3,
                              ),
                              child: /*  DropdownButton<SpecialityModel>(
                                // value: dController.Emergency,
                                hint: Container(
                                    margin: EdgeInsets.only(left: kMarginX / 2),
                                    child: Text(
                                      'Select speciality',
                                      style: TextStyle(
                                          fontSize: kMediumText,
                                          color: AppColors.grayColor),
                                    )),
                                icon: Container(
                                  padding: EdgeInsets.only(right: kMarginX / 2),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: AppColors.grey6,
                                  ),
                                ),
                                iconSize: 25,
                                isExpanded: true,
                                underline: SizedBox(),
                                style: TextStyle(
                                  color: AppColors.primaryGreen,
                                ),
                                onChanged: (SpecialityModel? newValue) {
                                  dController.addSpeciality(newValue);
                                },
                                items: <SpecialityModel>[
                                  ...dController.listSpeciality.map((e) => e)
                                ].map<DropdownMenuItem<SpecialityModel>>(
                                    (SpecialityModel value) {
                                  return DropdownMenuItem<SpecialityModel>(
                                    value: value,
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: kMarginX / 2),
                                      child: Text(
                                        Get.find<ActionController>()
                                                    .lang
                                                    .toLowerCase() ==
                                                'en'
                                            ? value.libelle_en
                                            : value.libelle,
                                        style: TextStyle(
                                          color: AppColors
                                              .primaryGreen, /*    fontSize: 15 */
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList()) */
                                  Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: kMarginX / 2),
                                        child: Text(
                                          'Select speciality',
                                          style: TextStyle(
                                              fontSize: kMediumText,
                                              color: AppColors.grayColor),
                                        )),
                                    Container(
                                      padding:
                                          EdgeInsets.only(right: kMarginX / 2),
                                      child: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: AppColors.grey6,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container(
                          //     child: Text(
                          //   'spt'.tr,
                          //   style: TextStyle(
                          // fontSize: kSmText,
                          //       fontFamily: 'Montserrat',
                          //       color: AppColors.primaryText,
                          //       fontWeight: FontWeight.bold),
                          // )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Container(
                              //     child: Text(
                              //   'spst'.tr,
                              //   style: TextStyle(
                              // fontSize: kSmText,
                              //     fontFamily: 'Montserrat',
                              //     color: AppColors.grey1,
                              //   ),
                              // )),
                              Expanded(
                                  child: Text(
                                'spt'.tr,
                                style: TextStyle(
                                    fontSize: kMdText,
                                    fontFamily: 'Montserrat',
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.bold),
                              )),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  // margin: EdgeInsets.only(bottom: kMarginY),
                                  child: Text(
                                    'select'.tr +
                                        ' ' +
                                        dController.listSelectSpeciality.length
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: kMdText,
                                        fontFamily: 'Montserrat',
                                        color: AppColors.grey8),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: kMarginY * 2),
                        child: SingleChildScrollView(
                            child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: dController.listSelectSpeciality.length,
                          itemBuilder: (_ctx, index) {
                            return AppSpecialityComponent(
                                specialite:
                                    dController.listSelectSpeciality[index],
                                onTap: () => dController.removeSpeciality(
                                      dController.listSelectSpeciality[index],
                                    ));
                          },
                        ))),
                  ],
                ))));
  }
}
