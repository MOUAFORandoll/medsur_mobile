import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_loader_element.dart';
import 'package:medsur_app/modules/alerte/components/app_input_min_add.dart';
import 'package:medsur_app/modules/alerte/constant/alert_level_color.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/models/emergency_model.dart';
import 'package:medsur_app/modules/etablissement/controller/etablissement_controller.dart';
import 'package:medsur_app/utils/validators.dart';
import '../../../constants/index_common.dart';
import '../../../general_component/index_widgets.dart';
import 'package:date_input_field/date_input_field.dart';
import 'package:intl/intl.dart';

class FirstStepView extends StatelessWidget {
  FirstStepView({required this.dController});
  EtablissementController dController;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Form(
        key: dController.firststepformKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: kMarginY,
              ),
              child: AppInput(
                controller: dController.nameController,
                onChanged: (value) {},
                label: 'name'.tr,
                validator: (value) {
                  //print(Validators.isValidUsername(
                  // dController.nameController.text));
                  //  int.parse(dController.emailController.text)
                  return Validators.isValidUsername(
                      dController.nameController.text);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: kMarginY * 2,
              ),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: kMarginY / 2),
                      child: Text(
                        'mail'.tr,
                        style: TextStyle(
                            fontSize: kMediumText,
                            fontFamily: 'Montserrat',
                            color: AppColors.grey8,
                            fontWeight: FontWeight.w500),
                      )),
                  AppInput(
                    controller: dController.emailController,
                    onChanged: (value) {},
                    label: '',
                    validator: (value) {
                      //  int.parse(dController.emailController.text)
                      return Validators.isValidEmailOrNum(
                          dController.emailController.text);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: kMarginY * 2,
              ),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: kMarginY / 2),
                      child: Text(
                        'phone'.tr,
                        style: TextStyle(
                            fontSize: kMediumText,
                            fontFamily: 'Montserrat',
                            color: AppColors.grey8,
                            fontWeight: FontWeight.w500),
                      )),
                  AppInput(
                    controller: dController.phoneController,
                    onChanged: (value) {},
                    label: '',
                    validator: (value) {
                      //  int.parse(dController.emailController.text)
                      return Validators.isValidEmailOrNum(
                          dController.phoneController.text);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: kMarginY * 2,
              ),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: kMarginY / 2),
                      child: Text(
                        'boite postale'.tr,
                        style: TextStyle(
                            fontSize: kMediumText,
                            fontFamily: 'Montserrat',
                            color: AppColors.grey8,
                            fontWeight: FontWeight.w500),
                      )),
                  AppInput(
                    controller: dController.boitePostaleController,
                    onChanged: (value) {},
                    label: '',
                    validator: (value) {
                      //  int.parse(dController.emailController.text)
                      // return Validators.isValidEmailOrNum(
                      //     dController.phoneController.text);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: kMarginY * 2,
              ),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: kMarginY),
                      child: Text(
                        'date'.tr,
                        style: TextStyle(
                            fontSize: kMediumText,
                            fontFamily: 'Montserrat',
                            color: AppColors.grey8,
                            fontWeight: FontWeight.w500),
                      )),
                  // AppInput(
                  //   controller: dController.birthDayController,
                  //   label: '',
                  //   onChanged: (value) {},
                  //   validator: (value) {
                  //     return Validators.isDateValid(
                  //         dController.birthDayController.text);
                  //   },
                  // ),
                  DateInputFormField(
                    onChanged: (value) {},
                    validation: (value) {
                      // return Validators.isDateValid(
                      // dController.birthDayController.text);
                    },
                    inputTextStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey8,
                      fontSize: kMediumText,
                      fontFamily: 'Montserrat',
                    ),
                    // controller: dController.birthDayController,
                    inputDecoration: InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 8,
                        fontFamily: 'Montserrat',
                      ),
                      hintStyle: TextStyle(color: Colors.black45),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppColors.grey7, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: AppColors.grey7, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: AppColors.primaryGreen, width: 2),
                      ),
                      // suffixIcon:
                      //     InkWell(child: Icon(Icons.event_note), onTap: () {}),
                      labelText: 'dd/mm/yyyy',
                      labelStyle: TextStyle(
                        color: AppColors.grayColor,
                        fontFamily: 'Montserrat',
                        fontSize: kMdText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
