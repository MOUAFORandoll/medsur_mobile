import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_loader_element.dart';
import 'package:medsur_app/modules/alerte/components/app_input_min_add.dart';
import 'package:medsur_app/modules/alerte/constant/alert_level_color.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/models/emergency_model.dart';
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
    var _format = new FormatData();

    return GetBuilder<EtablissementController>(
        builder: (dController) => Scaffold(
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
                title: Text('Etablissement'.tr),
                centerTitle: true,
                backgroundColor: AppColors.grey3,
                elevation: 0.2),
            body: Container(
              margin: EdgeInsets.symmetric(
                  vertical: kMarginY, horizontal: kMarginX),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        constraints: BoxConstraints(minHeight: kHeight / 7),
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryBlue,
                        ),
                        child: Column(
                          children: [
                            // Row(children: [
                            Container(
                                width: kWidth * .83,
                                margin: EdgeInsets.symmetric(
                                  vertical: kMarginY / 2,
                                ),
                                child: Text(
                                  _format.capitalizeFirstLetter(
                                      dController.etablissement.name!),
                                  // overflow: TextOverflow.visible,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: kMediumText,
                                      overflow: TextOverflow.visible,
                                      color: AppColors.whitecolor,
                                      fontWeight: FontWeight.bold),
                                )),
                            // ]),
                            Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: kMarginY / 2,
                                ),
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
                                  margin: EdgeInsets.symmetric(
                                    vertical: kMarginY / 2,
                                  ),
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
                                  margin: EdgeInsets.symmetric(
                                    vertical: kMarginY / 2,
                                  ),
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
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                      width: kWidth * .5,
                                      child: Text(
                                        'Status : ' +
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
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                      width: kWidth * .28,
                                      child: Text(
                                        'Garanti :',
                                        // overflow: TextOverflow.visible,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: kMediumText,
                                            overflow: TextOverflow.visible,
                                            color: AppColors.whitecolor,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Icon(
                                    dController.etablissement.garanti
                                        ? Icons.check_circle
                                        : Icons.close,
                                    size: 16,
                                    color: dController.etablissement.garanti
                                        ? Colors.green
                                        : Colors.red,
                                  )
                                ],
                              ),
                            ),
                            Container(
                                child: Row(
                              children: [
                                Container(
                                    width: kWidth * .28,
                                    child: Text(
                                      'Autorisation :',
                                      // overflow: TextOverflow.visible,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: kMediumText,
                                          overflow: TextOverflow.visible,
                                          color: AppColors.whitecolor,
                                          fontWeight: FontWeight.w600),
                                    )),
                                Icon(
                                    dController.etablissement.autorisation
                                        ? Icons.check_circle
                                        : Icons.close,
                                    size: 16,
                                    color:
                                        dController.etablissement.autorisation
                                            ? Colors.green
                                            : Colors.red),
                              ],
                            )),
                            if (!dController.etablissement.status)
                              InkWell(
                                onTap:()=> dController.sendMailAsActivation(),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text('activate'.tr,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: AppColors.primaryGreen)),
                                      ),
                                      Icon(Icons.mail,
                                          color: dController
                                                  .etablissement.autorisation
                                              ? Colors.green
                                              : Colors.red),
                                    ],
                                  ),
                                ),
                              ),
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
                                    icon: Icons.crisis_alert),
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
                                      Get.toNamed(AppLinks
                                          .ETABLISSEMENT_SPECIALITE_LIST);
                                    },
                                    icon: Icons.type_specimen),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppEtablissementHomeOption(
                                  title: 'Informations',
                                  arg: '',
                                  icon: Icons.info,
                                  onTap: () {
                                    Get.toNamed(AppLinks.ETABLISSEMENT_INFO);
                                  },
                                ),
                                AppEtablissementHomeOption(
                                  title: 'Agenda',
                                  arg: dController.etablissement.agendas.length
                                          .toString() +
                                      (dController.etablissement.agendas
                                                  .length <
                                              2
                                          ? ' agenda'
                                          : ' agendas'),
                                  icon: Icons.view_agenda,
                                  onTap: () {
                                    Get.toNamed(
                                        AppLinks.ETABLISSEMENT_AGENDA_LIST);
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
                                            : ' notes'),
                                    icon: Icons.star),
                                // AppEtablissementHomeOption(
                                //     title: 'Agenda',
                                //     arg: dController
                                //             .etablissement.notation.length
                                //             .toString() +
                                //         (dController.etablissement.notation
                                //                     .length <
                                //                 2
                                //             ? ' agenda'
                                //             : ' agendas'),
                                //     icon: Icons.view_agenda),
                              ])
                        ]))
                  ],
                ),
              ),
            )));
  }
}
