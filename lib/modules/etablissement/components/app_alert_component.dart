import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/modules/alerte/components/app_alert_map.dart';
import 'package:medsur_app/modules/alerte/constant/alert_level_color.dart';
import 'package:medsur_app/modules/alerte/models/user_alert_model.dart';
import 'package:medsur_app/utils/datetime_format_utils.dart';
import 'package:medsur_app/utils/viewFunctions.dart';

class AppAlertComponent extends StatelessWidget {
  UserAlertModel alerte;
  AppAlertComponent({required this.alerte});

  @override
  Widget build(BuildContext context) {
    var _format = new FormatData();
    return InkWell(
      onTap: () => {
        Get.bottomSheet(
          Container(
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
                        margin: EdgeInsets.symmetric(vertical: kMarginX / 2),
                        height: 3,
                        width: kMdWidth * .3,
                        decoration: BoxDecoration(
                            color: AppColors.grey8,
                            borderRadius: BorderRadius.circular(30)),
                        child: Container()),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                      child: Container(
                        child: Text(
                          FormatDateTime().dateToSimpleDate(alerte.createdAt!),
                          style: TextStyle(
                              color: AppColors.grey8,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(vertical: kMarginY),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.grayColor, width: 0.5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _format.capitalizeFirstLetter(
                                      alerte.etablissement!.name!),
                                  style: TextStyle(
                                      fontSize: kMediumText,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  /*    "dville".tr + */ _format
                                      .capitalizeFirstLetter(alerte.ville!),
                                  style: TextStyle(
                                      fontSize: kSSmText,
                                      color: AppColors.grey8,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(vertical: kMarginY),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          width: 0.5,
                          color: AppColors.grayColor,
                        )),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'npatient'.tr + " : ",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                            child: Text(
                              _format.capitalizeFirstLetter(alerte.nameUser!),
                              style: TextStyle(),
                            ),
                          )
                        ],
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment.topLeft,
                    //   padding: EdgeInsets.symmetric(vertical: kMarginY),
                    //   decoration: BoxDecoration(
                    //     border: Border(
                    //         bottom: BorderSide(
                    //       width: 0.5,
                    //       color: AppColors.grayColor,
                    //     )),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         'date'.tr + " : ",
                    //         style: TextStyle(
                    //             /* fontSize: kSmText, */ fontWeight: FontWeight.w500),
                    //       ),
                    //       Text(
                    //         alerte.emailUser!,
                    //         style: TextStyle(
                    //           /* fontSize: kSmText, */
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    InkWell(
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(vertical: kMarginY),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                            width: 0.5,
                            color: AppColors.grayColor,
                          )),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'emergency'.tr + " : ",
                              style: TextStyle(
                                  /* fontSize: kSmText, */
                                  fontWeight: FontWeight.w500),
                            ),
                            Expanded(
                              child: Text(
                                alerte.etablissement!.phone!,
                                style: TextStyle(
                                    /* fontSize: kSmText, */
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () => ViewFunctions().call(
                        'tel',
                        alerte.etablissement!.phone!,
                      ),
                    ),
                    InkWell(
                      child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: kMarginY),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              width: 0.5,
                              color: AppColors.grayColor,
                            )),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'ambulance'.tr + " : ",
                                style: TextStyle(
                                    /* fontSize: kSmText, */
                                    fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                child: Text(
                                  alerte.etablissement!.phone2!,
                                  style: TextStyle(
                                      /* fontSize: kSmText, */
                                      ),
                                ),
                              )
                            ],
                          )),
                      onTap: () => ViewFunctions().call(
                        'tel',
                        alerte.etablissement!.phone2!,
                      ),
                    ),
                    InkWell(
                      child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: kMarginY),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              width: 0.5,
                              color: AppColors.grayColor,
                            )),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'mail'.tr + " : ",
                                style: TextStyle(
                                    /* fontSize: kSmText, */
                                    fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                  child: Text(alerte.etablissement!.email!,
                                      textAlign: TextAlign.start,
                                      // overflow: TextOverflow.ellipsis,
                                      // softWrap: true,
                                      style: TextStyle(
                                          /* fontSize: kSmText, */
                                          ))),
                            ],
                          )),
                      onTap: () => ViewFunctions().call(
                        'mailto',
                        alerte.etablissement!.email!,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(vertical: kMarginY),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          width: 0.5,
                          color: AppColors.grayColor,
                        )),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'speciality1'.tr + " : ",
                            style: TextStyle(
                                /* fontSize: kSmText, */ fontWeight:
                                    FontWeight.w500),
                          ),
                          Expanded(
                              child: Text(
                                  new FormatData()
                                      .specialityToText(alerte.specialites!),
                                  textAlign: TextAlign.start,
                                  // overflow: TextOverflow.ellipsis,
                                  // softWrap: true,
                                  style: TextStyle(
                                      // /* fontSize: kSmText, */
                                      ))),
                        ],
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment.topLeft,
                    //   padding: EdgeInsets.symmetric(vertical: kMarginY),
                    //   decoration: BoxDecoration(
                    //     border: Border(
                    //         bottom: BorderSide(
                    //       width: 0.5,
                    //       color: AppColors.grayColor,
                    //     )),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         'specialty'.tr + " : ",
                    //         style: TextStyle(
                    //             fontSize: kSmText, fontWeight: FontWeight.w500),
                    //       ),
                    //       Text(
                    //         '  ',
                    //         style: TextStyle(
                    //           fontSize: kSmText,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(vertical: kMarginY),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          width: 0.5,
                          color: AppColors.grayColor,
                        )),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'levelE'.tr + " : ",
                            style: TextStyle(
                                /* fontSize: kSmText, */ fontWeight:
                                    FontWeight.w500),
                          ),
                          Text(
                            alerte.niveauUrgence.toString(),
                            style: TextStyle(
                                /* fontSize: kSmText, */
                                ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment.topLeft,
                    //   padding: EdgeInsets.symmetric(vertical: kMarginY),
                    //   decoration: BoxDecoration(
                    //     border: Border(
                    //         bottom: BorderSide(
                    //       width: 0.5,
                    //       color: AppColors.grayColor,
                    //     )),
                    //   ),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         'complain'.tr + " : ",
                    //         style: TextStyle(
                    //             fontSize: kSmText, fontWeight: FontWeight.bold),
                    //       ),
                    //       Text(
                    //         alerte.description ?? 'Aucune',
                    //         style: TextStyle(
                    //           fontSize: kSmText,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                      child: Row(
                        children: [
                          Container(
                              child: Icon(Icons.location_on,
                                  color: AppColors.primaryGreen)),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              margin:
                                  EdgeInsets.symmetric(horizontal: kMarginX),
                              child: Text(
                                alerte.etablissement!.localisation == null
                                    ? 'Aucune'
                                    : alerte.etablissement!.localisation!
                                            .ville! +
                                        ' long ${alerte.etablissement!.localisation!.longitude!} lat ${alerte.etablissement!.localisation!.latitude} ',
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: kSmText,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                        height: 200,
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: AppColors.primaryGreen),
                        child: AppAlertMap(
                          latitude: double.parse(alerte
                              .etablissement!.localisation!.latitude
                              .toString()),
                          longitude: double.parse(alerte
                              .etablissement!.localisation!.longitude
                              .toString()),

                          // text:'Voir sur la carte'
                        )),
                  ],
                ),
              )),
          isScrollControlled:
              true, // Set to true if you want the bottom sheet to be scrollable
          barrierColor: Colors.black26, // Change the overlay color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ), // Customize the shape of the bottom sheet
          backgroundColor: Colors
              .transparent, // Set to transparent if you want to customize the background
        )
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.whitecolor,
          ),
          padding: EdgeInsets.symmetric(
              horizontal: kMarginX / 1.5, vertical: kMarginY * 2.5),
          margin: EdgeInsets.symmetric(vertical: kMarginY / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: kWidth * .51,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              _format.capitalizeFirstLetter(
                                  alerte.etablissement!.name!),
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: kMediumText,
                                  color: AppColors.primaryBlue,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w600),
                            ))
                          ],
                        )),
                    Container(
                        child: Text(
                      _format.capitalizeFirstLetter(alerte.nameUser!),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: kSmText,
                      ),
                    ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AlerteLevelColor.colorForLevel(
                                  alerte.niveauUrgence.toString()),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: kMarginX / 3.1,
                                vertical: kMarginY / 1.5),
                            child: Text(
                              'level'.tr + alerte.niveauUrgence.toString(),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: kSmText,
                              ),
                            ))
                      ],
                    ),
                  ),
                  // Container(
                  //     child: Icon(Icons.keyboard_arrow_right,
                  //         color: AppColors.grey1))
                ],
              )
            ],
          )),
    );
  }
}
