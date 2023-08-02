import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/modules/alerte/models/etablissement_model.dart';
import 'package:medsur_app/modules/alerte/views/etablissementView.dart';
import 'package:medsur_app/styles/dimension.dart';
import 'package:medsur_app/utils/formatData.dart';
import '../../../constants/assets.dart';

class AppEstasblishmentComponent extends StatelessWidget {
  EtablissementModel etablissement;
  bool selected;
  var onTap;
  AppEstasblishmentComponent(
      {required this.etablissement, required this.selected, this.onTap});
  @override
  Widget build(BuildContext context) {
    var _format = new FormatData();

    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: selected ? AppColors.primaryGreen : AppColors.whitecolor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.extraLightGrey,
              )),
          padding: EdgeInsets.symmetric(
              horizontal: kMarginX / 2, vertical: kMarginY * 1.5),
          margin: EdgeInsets.symmetric(vertical: kMarginY / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: kWidth * .45,
                                child: Text(
                                  _format.capitalizeFirstLetter(
                                      etablissement.name.toString()),
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: !selected
                                          ? AppColors.primaryText
                                          : AppColors.whitecolor,
                                      fontSize: kMediumText /* / 1.2 */,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                                // margin: EdgeInsets.only(left:10),
                                width: kWidth * .28,
                                child: Text(
                                  calculerTempsDeplacement(
                                              etablissement.distance!)
                                          .toString() +
                                      ' | ' +
                                      etablissement.distance!
                                          .toInt()
                                          .toString() +
                                      " km ",
                                  style: TextStyle(
                                      fontSize: 13 * proportion /* / 1.2 */,
                                      fontFamily: 'Montserrat',
                                      overflow: TextOverflow.ellipsis,
                                      color: !selected
                                          ? AppColors.newgreen
                                          : AppColors.whitecolor,
                                      fontWeight: FontWeight.bold),
                                )),
                          ]),
                    ),
                    if (etablissement.specialites!.length != 0)
                      Container(
                        margin: EdgeInsets.only(top: 5)
                            .add(EdgeInsets.symmetric(vertical: 5)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: SvgPicture.asset(
                                  Assets.category,
                                  // width: 50,
                                  // height: 50,
                                  color: !selected
                                      ? AppColors.primaryGreen
                                      : AppColors.whitecolor,
                                ),
                              ),
                              Container(
                                  width: kWidth * .28,
                                  margin: EdgeInsets.only(left: 5),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(3)
                                      .add(EdgeInsets.symmetric(vertical: 5)),
                                  decoration: BoxDecoration(
                                      color: !selected
                                          ? AppColors.primaryGreen_OP
                                          : AppColors.whitecolor,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text(
                                    _format.capitalizeFirstLetter(etablissement
                                        .specialites![0].libelle
                                        .toString()),
                                    style: TextStyle(
                                        fontSize: 13 * proportion,
                                        fontFamily: 'Montserrat',
                                        overflow: TextOverflow.ellipsis,
                                        color: /* selected
                                          ? */
                                            AppColors
                                                .primaryGreen /*   : AppColors.whitecolor */,
                                        // color:   AppColors.grey5,
                                        fontWeight: FontWeight.w600),
                                  )),
                              if (etablissement.specialites_number! > 1)
                                //   Container(
                                //       width: kWidth * .28,
                                //       margin: EdgeInsets.only(left: 5),
                                //       padding: EdgeInsets.all(3),
                                //       decoration: BoxDecoration(
                                //           color: AppColors.primaryGreen_OP,
                                //           borderRadius: BorderRadius.circular(30)),
                                //       child: Text(
                                //         etablissement.specialites!.length == 0
                                //             ? 'Aucune'
                                //             : etablissement.specialites![1].libelle
                                //                 .toString(),
                                //         style: TextStyle(
                                //             fontSize: kSSmText,
                                //             fontFamily: 'Montserrat',
                                //             overflow: TextOverflow.ellipsis,
                                //             color: !selected
                                //                 ? AppColors.primaryGreen
                                //                 : AppColors.grey5,
                                //             // color:   AppColors.grey5,
                                //             fontWeight: FontWeight.w600),
                                //       )),
                                // if (etablissement.specialites_number! > 1)
                                //   Container(
                                //       height: 22,
                                //       width: 22,
                                //       margin: EdgeInsets.only(left: 5),
                                //       alignment: Alignment.center,
                                //       padding: EdgeInsets.all(1.5),
                                //       decoration: BoxDecoration(
                                //           color: !selected
                                //               ? AppColors.blue
                                //               : AppColors.whitecolor,
                                //           borderRadius: BorderRadius.circular(30)),
                                //       child: Text(
                                //         "+" +
                                //             (etablissement.specialites_number! - 1)
                                //                 .toString(),
                                //         style: TextStyle(
                                //             // fontSize: kSSmText,
                                //             fontFamily: 'Montserrat',
                                //             // overflow: TextOverflow.ellipsis,
                                //             color: selected
                                //                 ? AppColors.primaryGreen
                                //                 : AppColors.whitecolor,
                                //             // color:   AppColors.grey5,
                                //             fontWeight: FontWeight.w600),
                                //       )),
                                Stack(
                                  children: [
                                    Container(
                                      width: kWidth * .28,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: 5),
                                      padding: EdgeInsets.all(3).add(
                                          EdgeInsets.symmetric(vertical: 5)),
                                      decoration: BoxDecoration(
                                        color: !selected
                                            ? AppColors.primaryGreen_OP
                                            : AppColors.whitecolor,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Text(
                                        etablissement.specialites!.length == 0
                                            ? 'Aucune'
                                            : _format.capitalizeFirstLetter(
                                                etablissement
                                                    .specialites![1].libelle
                                                    .toString()),
                                        style: TextStyle(
                                          fontSize: 13 * proportion,
                                          fontFamily: 'Montserrat',
                                          overflow: TextOverflow.ellipsis,
                                          color: AppColors.primaryGreen,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    if (etablissement.specialites_number! - 2 >
                                        0)
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: kWidth * .31, top: 3),
                                        height: 22,
                                        width: 22,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: !selected
                                              ? AppColors.primaryText
                                              : AppColors.whitecolor,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          "+" +
                                              (etablissement.specialites_number! -
                                                              2 >
                                                          9
                                                      ? 9
                                                      : etablissement
                                                              .specialites_number! -
                                                          2)
                                                  .toString(),
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: kSmText * .8,
                                            color: selected
                                                ? AppColors.primaryText
                                                : AppColors.whitecolor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                  ],
                                )
                            ]),
                      ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (etablissement.authorisation!)
                              Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    Container(
                                      child: SvgPicture.asset(
                                        Assets.safe,
                                        // width: 50,
                                        // height: 50,
                                        color: !selected
                                            ? AppColors.red
                                            : AppColors.whitecolor,
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 2),
                                        width: kWidth * .3,
                                        child: Text(
                                          "autorisation".tr,
                                          style: TextStyle(
                                              fontSize: 12 * proportion,
                                              fontFamily: 'Montserrat',
                                              overflow: TextOverflow.ellipsis,
                                              color: !selected
                                                  ? AppColors.grey1
                                                  : AppColors.whitecolor,
                                              // color:   AppColors.grey5,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    // Container(
                                    //     margin: EdgeInsets.only(left: 1),
                                    //     child: Text(
                                    //       (etablissement.authorisation!
                                    //           ? 'Yes'
                                    //           : 'No'),
                                    //       style: TextStyle(
                                    //           fontSize: kSmText,
                                    //           fontFamily: 'Montserrat',
                                    //           overflow: TextOverflow.ellipsis,
                                    //           color: !selected
                                    //               ? AppColors.grey1
                                    //               : AppColors.whitecolor,
                                    //           // color:   AppColors.grey5,
                                    //           fontWeight: FontWeight.w600),
                                    //     )),
                                  ])),
                            if (etablissement.garanti!)
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          child: Icon(
                                        Icons.ac_unit_sharp,
                                        color: !selected
                                            ? AppColors.yellow
                                            : AppColors.whitecolor,
                                        size: 15,
                                      )
                                          //  SvgPicture.asset(
                                          //   Assets.highqualitys,
                                          //   color: AppColors.red,
                                          // ),
                                          ),
                                      Container(
                                          margin: EdgeInsets.only(left: 5),
                                          width: kWidth * .3,
                                          child: Text(
                                            "garanti".tr,
                                            style: TextStyle(
                                                fontSize: 12 * proportion,
                                                fontFamily: 'Montserrat',
                                                overflow: TextOverflow.ellipsis,
                                                color: !selected
                                                    ? AppColors.grey1
                                                    : AppColors.whitecolor,
                                                // color:   AppColors.grey5,
                                                fontWeight: FontWeight.w600),
                                          )),
                                      // Container(
                                      //     margin: EdgeInsets.only(left: 1),
                                      //     child: Text(
                                      //       (etablissement.garanti!
                                      //           ? 'Yes'
                                      //           : 'No'),
                                      //       style: TextStyle(
                                      //           fontSize: kSmText,
                                      //           fontFamily: 'Montserrat',
                                      //           overflow: TextOverflow.ellipsis,
                                      //           color: !selected
                                      //               ? AppColors.grey1
                                      //               : AppColors.whitecolor,
                                      //           // color:   AppColors.grey5,
                                      //           fontWeight: FontWeight.w600),
                                      //     )),
                                    ]),
                              ),
                          ]),
                    ),
                  ],
                ),
              ),
              Container(
                  child: Icon(
                Icons.keyboard_arrow_right_outlined,
                color: selected ? AppColors.whitecolor : AppColors.primaryGreen,
              ))
            ],
          )),
    );
  }
}

calculerTempsDeplacement(double distance) {
  double vitesseMoyenne = 30;
  // Estimation du temps de déplacement en tenant compte de la circulation
  double temps = distance / vitesseMoyenne;

  return formaterTemps(temps * 3600); // Conversion en secondes
}

String formaterTemps(double temps) {
  if (temps < 60) {
    return '${temps.toInt()} scs';
  } else if (temps < 3600) {
    double minutes = temps / 60;
    return '${minutes.toInt()} mins';
  } else if (temps < 31536000) {
    double heures = temps / 3600;
    return '${heures.toInt()} hrs';
  } else {
    double heures = temps / 31536000;
    return '${heures.toInt()} jrs';
  }
}
