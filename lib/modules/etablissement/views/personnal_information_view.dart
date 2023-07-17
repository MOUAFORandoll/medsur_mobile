import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_loader_element.dart';
import 'package:medsur_app/modules/alerte/components/app_input_min_add.dart';
import 'package:medsur_app/modules/alerte/constant/alert_level_color.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/models/emergency_model.dart';
import 'package:medsur_app/utils/validators.dart';
import '../../../constants/index_common.dart';
import '../../../general_component/index_widgets.dart';
import 'package:date_input_field/date_input_field.dart';
import 'package:intl/intl.dart';

class PersonnalInformationView extends StatelessWidget {
  PersonnalInformationView({required this.dController});
  AlerteController dController;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Form(
        key: dController.personnalformKey,
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
                      return Validators.isDateValid(
                          dController.birthDayController.text);
                    },
                    inputTextStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey8,
                      fontSize: kMediumText,
                      fontFamily: 'Montserrat',
                    ),
                    controller: dController.birthDayController,
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
            Padding(
              padding: EdgeInsets.only(top: kMarginY * 2),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: kMarginY),
                    child: Text(
                      'gender'.tr,
                      style: TextStyle(
                        fontSize: kMediumText,
                        fontFamily: 'Montserrat',
                        color: AppColors.grey8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              activeColor: AppColors.primaryGreen,
                              groupValue: dController.sexeInt,
                              onChanged: (value) {
                                dController.setSexe(value);
                              },
                            ),
                            Text('Male'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              activeColor: AppColors.primaryGreen,
                              groupValue: dController.sexeInt,
                              onChanged: (value) {
                                dController.setSexe(value);
                              },
                            ),
                            Text('Female'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: kMarginY * 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: kMarginY),
                      child: Text(
                        'poids'.tr,
                        style: TextStyle(
                            fontSize: kMediumText,
                            fontFamily: 'Montserrat',
                            color: AppColors.grey8,
                            fontWeight: FontWeight.w500),
                      )),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: kMarginY),
                    child: AppInputMinAdd(
                      textInputType: TextInputType.number,
                      controller: dController.poidsController,
                      enableButtonM: dController.hasPoids,
                      onChanged: (value) {
                        // dController.verifPoids();
                        dController.vPoids();
                      },
                      errorText: dController.errorW,
                      remove: () => dController.setPoids(false),
                      add: () => dController.setPoids(true),
                      label: '',
                      validator: (value) {
                        // return Validators.validateWeight(
                        //     dController.poidsController.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: kMarginY * 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: kMarginY),
                      child: Text(
                        'taille'.tr,
                        style: TextStyle(
                            fontSize: kMediumText,
                            fontFamily: 'Montserrat',
                            color: AppColors.grey8,
                            fontWeight: FontWeight.w500),
                      )),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: kMarginY),
                    child: AppInputMinAdd(
                      textInputType: TextInputType.number,
                      controller: dController.tailleController,
                      enableButtonM: dController.hasTaille,
                      onChanged: (value) {
                        print('000');
                        dController.vTaille();
                      },
                      errorText: dController.errorH,
                      remove: () => dController.setTaille(false),
                      add: () => dController.setTaille(true),
                      label: '',
                      // validator: (value) {
                      //   return Validators.validateHeight(
                      //       dController.tailleController.text);
                      // },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: kMarginY,
                ),
                child: Column(children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: kMarginY),
                      child: Text(
                        'Select level of emergency'.tr,
                        style: TextStyle(
                            fontSize: kMediumText,
                            fontFamily: 'Montserrat',
                            color: AppColors.grey8,
                            fontWeight: FontWeight.w500),
                      )),
                  Container(
                      width: kWidth,
                      alignment: Alignment.centerLeft,
                      // margin: EdgeInsets.only(bottom: kMarginY * 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.grey7, width: 1.5),
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: kMarginY * .2,
                      ),
                      child: dController.loadLevelEmergency &&
                              dController.listLevelEmergency.length == 0
                          ? Container()
                          : DropdownButton<EmergencyModel?>(
                              value: dController.levelEmergency.isNull
                                  ? null
                                  : dController.levelEmergency,
                              hint: Container(
                                  margin: EdgeInsets.only(left: kMarginX / 2),
                                  child: Text(
                                    'Select level of emergency',
                                    style: TextStyle(
                                        color: AppColors.grayColor,
                                        fontSize: kMdText),
                                  )),
                              icon: Container(
                                padding: EdgeInsets.only(right: kMarginX / 2),
                                child: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: AppColors.primaryGreen,
                                ),
                              ),
                              iconSize: 25,
                              isExpanded: true,
                              underline: SizedBox(),
                              style: TextStyle(
                                  color: AppColors.primaryGreen, fontSize: 20),
                              onChanged: (newValue) {
                                dController.setLevelEmergence(newValue);
                                dController.get_decription_niveau_urgence();
                              },
                              items: dController.listLevelEmergency
                                  .map<DropdownMenuItem<EmergencyModel>>(
                                      (EmergencyModel emergencyModel) {
                                return DropdownMenuItem<EmergencyModel>(
                                  value: emergencyModel,
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: kMarginX / 2),
                                    child: Text(
                                      'levelE'.tr +
                                          ' ' +
                                          emergencyModel.valeur.toString(),
                                      style: TextStyle(
                                          color: AlerteLevelColor.colorForLevel(
                                              emergencyModel.valeur.toString()),
                                          fontSize: 15),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ))
                ])),
          ],
        ),
      ),
    ));
  }
}
