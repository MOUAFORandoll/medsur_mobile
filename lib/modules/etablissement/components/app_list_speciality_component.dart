import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/general_component/app_input_search_speciality.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/models/speciality_model.dart';
import 'package:medsur_app/styles/dimension.dart';
import '../../../constants/assets.dart';

class AppListSpecialityComponent extends StatelessWidget {
  AppListSpecialityComponent({this.isActualise = false});

  var isActualise;
  @override
  Widget build(BuildContext context) {
    var _format = new FormatData();

    return GetBuilder<AlerteController>(
        builder: (_alerteController) => Container(
            height: kHeight * .8,
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
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: kMarginY * 5),
                      child: AppInputSearchSpeciality(
                          border: true,
                          placeholder: 'search'.tr,
                          controller: _alerteController.searchSpeController,
                          onChanged: (value) => _alerteController.searchSpe())),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: kMarginY * 2),
                      child: SingleChildScrollView(
                          child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            _alerteController.searchSpeController.text.length ==
                                    0
                                ? _alerteController.listSpeciality.length
                                : _alerteController.listSearchSpe.length,
                        itemBuilder: (_ctx, index) {
                          return InkWell(
                              onTap: () {
                                _alerteController.addSpeciality(
                                    _alerteController.searchSpeController.text
                                                .length ==
                                            0
                                        ? _alerteController
                                            .listSpeciality[index]
                                        : _alerteController
                                            .listSearchSpe[index],
                                    isActualise);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppColors.grey7,
                                      )),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kMarginX / 2,
                                      vertical: kMarginY),
                                  margin: EdgeInsets.symmetric(
                                      vertical: kMarginY / 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Container(
                                              child: Text(
                                        _format.capitalizeFirstLetter(
                                            _alerteController
                                                        .searchSpeController
                                                        .text
                                                        .length ==
                                                    0
                                                ? Get.find<ActionController>()
                                                            .lang
                                                            .toLowerCase() ==
                                                        'en'
                                                    ? _alerteController
                                                        .listSpeciality[index]
                                                        .libelle_en
                                                    : _alerteController
                                                        .listSpeciality[index]
                                                        .libelle
                                                : Get.find<ActionController>()
                                                            .lang
                                                            .toLowerCase() ==
                                                        'en'
                                                    ? _alerteController
                                                        .listSearchSpe[index]
                                                        .libelle_en
                                                    : _alerteController
                                                        .listSearchSpe[index]
                                                        .libelle),
                                        style: TextStyle(
                                            // color: AppColors.primaryGreen,
                                            ),
                                      ))),
                                      Checkbox(
                                          value: _alerteController
                                              .isContainSpeciality(
                                                  _alerteController
                                                              .searchSpeController
                                                              .text
                                                              .length ==
                                                          0
                                                      ? _alerteController
                                                          .listSpeciality[index]
                                                      : _alerteController
                                                              .listSearchSpe[
                                                          index]),
                                          onChanged: (val) {
                                            _alerteController.addSpeciality(
                                                _alerteController
                                                            .searchSpeController
                                                            .text
                                                            .length ==
                                                        0
                                                    ? _alerteController
                                                        .listSpeciality[index]
                                                    : _alerteController
                                                        .listSearchSpe[index],
                                                isActualise);
                                          })
                                      // Container(
                                      //     child:
                                      //         InkWell(
                                      //   // onTap: onTap,
                                      //   child:
                                      //       Container(
                                      //     height:
                                      //         20,
                                      //     width: 20,
                                      //     decoration:
                                      //         BoxDecoration(
                                      //       borderRadius:
                                      //           BorderRadius.circular(30),
                                      //       color: _alerteController.isIntoSpe(_alerteController.listSearchSpe[index].id)
                                      //           ? AppColors.primaryGreen
                                      //           : AppColors.grey8,
                                      //     ),
                                      // ),
                                      // ))
                                    ],
                                  )));
                        },
                      )))
                ],
              ),
            )));
  }
}
