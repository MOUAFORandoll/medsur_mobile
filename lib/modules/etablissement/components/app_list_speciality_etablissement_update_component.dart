import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/general_component/app_input_search_speciality.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/models/speciality_model.dart';
import 'package:medsur_app/modules/etablissement/controller/etablissement_controller.dart';
import 'package:medsur_app/styles/dimension.dart';
import '../../../constants/assets.dart';

class AppListSpecialityEtablissementUpdateComponent extends StatelessWidget {
  AppListSpecialityEtablissementUpdateComponent({this.isActualise = false});

  var isActualise;
  @override
  Widget build(BuildContext context) {
    var _format = new FormatData();
    return GetBuilder<EtablissementController>(builder: (_eController) {
      // var _listFinal0 = _eController.searchSpeController.text.length == 0
      //     ? _eController.listSpeciality
      //     : _eController.listSearchSpe;
      // var _listFinal = [];
      // _eController.etablissement.specialites.forEach((obj) {
      //   if (!_listFinal0.contains(obj.id)) {
      //     _listFinal.add(obj);
      //   }
      // });
      var _listFinal = _eController.searchSpeController.text.isEmpty
          ? _eController.listSpecialitySecond
          : _eController.listSearchSpe;

     

      // var _listFinal = _eController.searchSpeController.text.length == 0
      //     ?   _eController.listSpeciality.every((element) =>
      //         !_eController.etablissement.specialites.contains(element))
      //     : _eController.listSearchSpe.every((element) =>
      //         !_eController.etablissement.specialites.contains(element));

      return Container(
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
                        controller: _eController.searchSpeController,
                        onChanged: (value) => _eController.searchSpe())),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: kMarginY * 2),
                    child: SingleChildScrollView(
                        child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _listFinal.length,
                      itemBuilder: (_ctx, index) {
                        return InkWell(
                            // onTap: () {
                            //   _eController.addSpeciality(
                            //       _eController.searchSpeController.text
                            //                   .length ==
                            //               0
                            //           ? _eController
                            //               .listSpeciality[index]
                            //           : _eController
                            //               .listSearchSpe[index],
                            //       isActualise);
                            // },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
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
                                      _format.capitalizeFirstLetter(
                                          /* _eController
                                                  .searchSpeController
                                                  .text
                                                  .length ==
                                              0
                                          ? Get.find<ActionController>()
                                                      .lang
                                                      .toLowerCase() ==
                                                  'en'
                                              ? _eController
                                                  .listSpeciality[index]
                                                  .libelle_en
                                              : _eController
                                                  .listSpeciality[index].libelle
                                          : Get.find<ActionController>()
                                                      .lang
                                                      .toLowerCase() ==
                                                  'en'
                                              ? _eController
                                                  .listSearchSpe[index]
                                                  .libelle_en
                                              : _eController
                                                  .listSearchSpe[index]
                                                  .libelle */
                                          Get.find<ActionController>()
                                                      .lang
                                                      .toLowerCase() ==
                                                  'en'
                                              ? _listFinal[index].libelle_en
                                              : _listFinal[index].libelle),
                                      style: TextStyle(
                                          // color: AppColors.primaryGreen,
                                          ),
                                    ))),
                                    InkWell(
                                      child: Icon(Icons.add),
                                      onTap: () {
// remove specialite from etablissement
                                        _eController.addSpecialite(
                                            _listFinal[index].id);
                                      },
                                    )
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
                                    //       color: _eController.isIntoSpe(_eController.listSearchSpe[index].id)
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
          ));
    });
  }
}
