import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/alerte/models/etablissement_model.dart';

class AppCategorieFilterComponent extends StatelessWidget {
  AppCategorieFilterComponent({required this.categorie});
  var categorie;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColors.primaryGreen,
          ),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Expanded(
            //     child: Text(
            //   "categories" +
            //       " : ${Get.find<ActionController>().lang.toLowerCase() == 'en' ? categorie.libelle_en.toString() : categorie.libelle}",
            //   style: TextStyle(
            //     fontFamily: 'Montserrat',
            //     fontSize: kMediumText,
            //   ),
            // )),
            Expanded(
                child: Text(
              "categories".tr +
                  " :  ${categorie.length == 0 ? Get.find<ActionController>().lang.toLowerCase() == 'en' ? 'All' : 'Tous' : new FormatData().serviceToText(categorie!)}",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: kMediumText,
              ),
            )),
            Container(
                child: InkWell(
              // onTap: onTap,
              child: Icon(
                Icons.settings,
                color: AppColors.grey6,
              ),
            ))
          ],
        ));
  }
}
