import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/alerte/models/speciality_model.dart';
import 'package:medsur_app/styles/dimension.dart';
import '../../../constants/assets.dart';

class AppSpecialityComponentSecond extends StatelessWidget {
  AppSpecialityComponentSecond(
      {required SpecialityModel this.specialite, this.onTap});
  SpecialityModel specialite;
  var onTap;
  @override
  Widget build(BuildContext context) {
    var _format = new FormatData();

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColors.primaryGreen,
          ),
        ),
        padding: EdgeInsets.all(8),

        // padding: EdgeInsets.only(bottom:8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                constraints: BoxConstraints(maxWidth: kWidth * .72),
                child: Text(
                  _format.capitalizeFirstLetter(
                      Get.find<ActionController>().lang.toLowerCase() == 'en'
                          ? specialite.libelle_en
                          : specialite.libelle),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: kMediumText,
                  ),
                )),
            Container(
                child: InkWell(
              onTap: onTap,
              child: Icon(
                Icons.close,
                color: AppColors.grey6,
                size: kMediumText * 2,
              ),
            ))
          ],
        ));
  }
}
