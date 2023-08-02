import 'package:flutter/material.dart';
import 'package:medsur_app/constants/assets.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/styles/colors.dart';
import 'package:get/get.dart';

class AppLangButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: kSmWidth * .6,
      // margin: EdgeInsets.only(
      //     top: Get.height * .005,
      //     left: Get.width * .008),

      child: GetBuilder<ActionController>(
        builder: (actionControl) => DropdownButton<String>(
            value: actionControl.lang.value,
            icon: Container(
              // padding: EdgeInsets.only(top: 4),
              child: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.primaryGreen,
              ),
            ),
            iconSize: 25,
            underline: SizedBox(),
            style: TextStyle(color: AppColors.primaryGreen, fontSize: 20),
            onChanged: (newValue) {
              actionControl.updateLanguage(newValue ?? '');
            },
            items: <String>[...actionControl.locale.map((e) => e['name'])]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Center(
                  child: Text(
                    value,
                    style:
                        TextStyle(color: AppColors.primaryGreen, fontSize: 15),
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}
