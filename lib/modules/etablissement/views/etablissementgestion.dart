import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_loader_element.dart';
import 'package:medsur_app/modules/alerte/components/app_input_min_add.dart';
import 'package:medsur_app/modules/alerte/constant/alert_level_color.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/models/emergency_model.dart';
import 'package:medsur_app/modules/etablissement/components/app_agenda_add_component.dart';
import 'package:medsur_app/modules/etablissement/components/app_etablissement_home_option.dart';
import 'package:medsur_app/modules/etablissement/components/app_home_speciality_etablissement_component%20.dart';
import 'package:medsur_app/modules/etablissement/controller/etablissement_controller.dart';
import 'package:medsur_app/utils/routing.dart';
import 'package:medsur_app/utils/validators.dart';
import '../../../constants/index_common.dart';
import '../../../general_component/index_widgets.dart';
import 'package:date_input_field/date_input_field.dart';
import 'package:intl/intl.dart';

class EtablissementGView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EtablissementController>(
        builder: (dController) => Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        constraints: BoxConstraints(minHeight: kHeight / 7),
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryBlue,
                        ),
                        child: Column(
                          children: [
                            Row(children: [
                              Container(
                                  width: kWidth * .83,
                                  child: Text(
                                    dController.etablissement.name!,
                                    // overflow: TextOverflow.visible,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: kMediumText,
                                        overflow: TextOverflow.visible,
                                        color: AppColors.whitecolor,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ]),
                            Container(
                                width: kWidth * .83,
                                child: Text(
                                  'Situe a ' +
                                      dController
                                          .etablissement.localisation.ville,
                                  // overflow: TextOverflow.visible,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: kMediumText,
                                      overflow: TextOverflow.visible,
                                      color: AppColors.whitecolor,
                                      fontWeight: FontWeight.w600),
                                )),
                            if (dController.etablissement.phone.length != 0)
                              Container(
                                  width: kWidth * .83,
                                  child: Text(
                                    'Disponible au ' +
                                        dController.etablissement.phone,
                                    // overflow: TextOverflow.visible,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: kMediumText,
                                        overflow: TextOverflow.visible,
                                        color: AppColors.whitecolor,
                                        fontWeight: FontWeight.w600),
                                  )),
                            if (dController.etablissement.phone2.length != 0)
                              Container(
                                  width: kWidth * .83,
                                  child: Text(
                                    'Ambulence ' +
                                        dController.etablissement.phone2,
                                    // overflow: TextOverflow.visible,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: kMediumText,
                                        overflow: TextOverflow.visible,
                                        color: AppColors.whitecolor,
                                        fontWeight: FontWeight.w600),
                                  )),
                            Row(
                              children: [
                                Container(
                                    width: kWidth * .28,
                                    child: Text(
                                      'Etat ' +
                                          (dController.etablissement.status
                                              ? 'Active'
                                              : 'Inactive'),
                                      // overflow: TextOverflow.visible,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: kMediumText,
                                          overflow: TextOverflow.visible,
                                          color: AppColors.whitecolor,
                                          fontWeight: FontWeight.w600),
                                    )),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: dController.etablissement.status
                                          ? AppColors.primaryGreen
                                          : AppColors.grayColor),
                                  alignment: Alignment.centerLeft,
                                )
                              ],
                            )
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppEtablissementHomeOption(
                                  title: 'Alerte',
                                  arg: dController.etablissement.nmbre_alerte
                                      .toString(),
                                  onTap: () {
                                    dController.getEtablissementAlert();
                                    Get.toNamed(
                                        AppLinks.ETABLISSEMENT_ALERTE_LIST);
                                  },
                                ),
                                AppEtablissementHomeOption(
                                  title: 'Specialite',
                                  arg: dController
                                          .etablissement.specialites.length
                                          .toString() +
                                      (dController.etablissement.specialites
                                                  .length <
                                              2
                                          ? ' specialite'
                                          : ' specialites'),
                                  onTap: () {
                                    // Get.bottomSheet(
                                    //   AppHomeSpecialityEtablissementComponent(),
                                    //   isScrollControlled: true,
                                    //   barrierColor: Colors.black26,
                                    //   shape: RoundedRectangleBorder(
                                    //     borderRadius: BorderRadius.vertical(
                                    //         top: Radius.circular(16)),
                                    //   ),
                                    //   backgroundColor: Colors.transparent,
                                    // )
                                    Get.toNamed(
                                        AppLinks.ETABLISSEMENT_SPECIALITE_LIST);
                                  },
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppEtablissementHomeOption(
                                    title: 'Notation',
                                    arg: dController
                                            .etablissement.notation.length
                                            .toString() +
                                        (dController.etablissement.notation
                                                    .length <
                                                2
                                            ? ' note'
                                            : ' notes')),
                                AppEtablissementHomeOption(
                                    title: 'Agenda',
                                    arg: dController
                                            .etablissement.notation.length
                                            .toString() +
                                        (dController.etablissement.notation
                                                    .length <
                                                2
                                            ? ' agenda'
                                            : ' agendas'))
                              ])
                        ]))
                  ],
                ),
              ),
            ));
  }
}
