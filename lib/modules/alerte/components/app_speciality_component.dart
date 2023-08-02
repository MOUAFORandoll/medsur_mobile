import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/alerte/models/speciality_model.dart';
import 'package:medsur_app/styles/dimension.dart';
import '../../../constants/assets.dart';

class AppSpecialityComponent extends StatelessWidget {
  AppSpecialityComponent(
      {required SpecialityModel this.specialite, this.onTap});
  SpecialityModel specialite;
  var onTap;
  @override
  Widget build(BuildContext context) {
    var _format = new FormatData();
    
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.grey7,
            )),
        padding: EdgeInsets.symmetric(
            horizontal: kMarginX / 2, vertical: kMarginY * 2.5),
        margin: EdgeInsets.symmetric(vertical: kMarginY / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Container(
              child: Text(
                _format.capitalizeFirstLetter(
                    Get.find<ActionController>().lang.toLowerCase() == 'en'
                        ? specialite.libelle_en
                        : specialite.libelle),
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: kMediumText,
                ),
              ),
            )),
            Container(
                child: InkWell(
              onTap: onTap,
              child: Icon(
                Icons.close,
                color: AppColors.grey6,
              ),
            ))
          ],
        ));
  }
}
