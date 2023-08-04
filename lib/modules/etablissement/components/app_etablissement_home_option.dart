import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/alerte/models/etablissement_model.dart';
import 'package:medsur_app/modules/etablissement/controller/etablissement_controller.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';
import 'package:time_picker_widget/time_picker_widget.dart';

class AppEtablissementHomeOption extends StatelessWidget {
  AppEtablissementHomeOption({required this.title, this.onTap, this.arg = ''});
  var title, arg, onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.whitecolor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primaryGreen, width: 1.5),
            ),
            constraints:
                BoxConstraints(minHeight: kHeight / 8, minWidth: kWidth / 2.5),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Text(
                    title,
                    style: TextStyle(
                      fontSize: kMdText,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      // color: AppColors.whitecolor,
                    ),
                  )),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        arg.toString(),
                        style: TextStyle(
                          fontSize: kMdText,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          // color: AppColors.whitecolor,
                        ),
                      )),
                ])),
        onTap: onTap);
  }
}

  // DateInputFormField(
  //                   onChanged: (value) {},
  //                   validation: (value) {
  //                     // return Validators.isDateValid(
  //                     // dController.birthDayController.text);
  //                   },
  //                   inputTextStyle: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     color: AppColors.grey8,
  //                     fontSize: kMediumText,
  //                     fontFamily: 'Montserrat',
  //                   ),
  //                   // controller: dController.birthDayController,
  //                   inputDecoration: InputDecoration(
  //                     errorStyle: TextStyle(
  //                       fontSize: 8,
  //                       fontFamily: 'Montserrat',
  //                     ),
  //                     hintStyle: TextStyle(color: Colors.black45),
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(10),
  //                       borderSide:
  //                           BorderSide(color: AppColors.grey7, width: 1.5),
  //                     ),
  //                     enabledBorder: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                       borderSide:
  //                           BorderSide(color: AppColors.grey7, width: 1.5),
  //                     ),
  //                     focusedBorder: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                       borderSide:
  //                           BorderSide(color: AppColors.primaryGreen, width: 2),
  //                     ),
  //                     // suffixIcon:
  //                     //     InkWell(child: Icon(Icons.event_note), onTap: () {}),
  //                     labelText: 'dd/mm/yyyy',
  //                     labelStyle: TextStyle(
  //                       color: AppColors.grayColor,
  //                       fontFamily: 'Montserrat',
  //                       fontSize: kMdText,
  //                     ),
  //                   ),
  //                 ),