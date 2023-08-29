import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/modules/etablissement/models/etablissement_model.dart';
import 'package:medsur_app/styles/dimension.dart';
import 'package:medsur_app/utils/formatData.dart';
import '../constants/assets.dart';

class AppExperienceComponent extends StatelessWidget {
  var text, onTap;
  AppExperienceComponent({required this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    var _format = new FormatData();

    return InkWell(
      onTap: onTap,
      child: Container(
          height: kHeight / 5,
          // width: kWidth / 4,
          alignment: Alignment.center,
          padding: EdgeInsets.all(kMarginX / 2),
          margin: EdgeInsets.symmetric(
              horizontal: kMarginX, vertical: kMarginX / 2),
          decoration: BoxDecoration(
              color: AppColors.grayColor,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    child: Text(
                  _format.capitalizeFirstLetter(text.toString()),
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      // color: AppColors.primaryGreen,
                      fontSize: kMediumText /* / 1.2 */,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ],
          )),
    );
  }
}
