import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/modules/etablissement/models/etablissement_model.dart';
import 'package:medsur_app/styles/dimension.dart';
import 'package:medsur_app/utils/formatData.dart';
import '../../../constants/assets.dart';

class AppEstasblishmentComponent extends StatelessWidget {
  EtablissementModel etablissement;

  var onTap;
  AppEstasblishmentComponent({required this.etablissement, this.onTap});
  @override
  Widget build(BuildContext context) {
    var _format = new FormatData();

    return InkWell(
      onTap: onTap,
      child: Container(
          // height: kHeight / 4,
          // width: kWidth / 4,
          alignment: Alignment.center,
          padding: EdgeInsets.all(kMarginX / 2),
          // margin: EdgeInsets.only(right: kMarginX),
          decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: kWidth * .50,
                  child: Text(
                    _format
                        .capitalizeFirstLetter(etablissement.name.toString()),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.primaryGreen,
                        fontSize: kMediumText /* / 1.2 */,
                        overflow: TextOverflow.fade,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: EdgeInsets.only(top: kMarginY),
                  width: kWidth * .50,
                  child: Text(
                    _format.capitalizeFirstLetter(
                        etablissement.localisation!.ville.toString()),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.whitecolor,
                        fontSize: kMediumText /* / 1.2 */,
                        overflow: TextOverflow.fade,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: EdgeInsets.only(top: kMarginY),
                  width: kWidth * .50,
                  child: Text(
                    'Status : ' +
                        (etablissement.status! ? 'Active' : 'Inactive'),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.whitecolor,
                        fontSize: kMediumText /* / 1.2 */,
                        overflow: TextOverflow.fade,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          )),
    );
  }
}
