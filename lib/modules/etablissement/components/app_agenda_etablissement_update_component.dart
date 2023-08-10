import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/etablissement/models/etablissement_model.dart';
import 'package:medsur_app/modules/etablissement/controller/etablissement_controller.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';
import 'package:time_picker_widget/time_picker_widget.dart';

class AppAgendaEtablissementUpdateComponent extends StatefulWidget {
  AppAgendaEtablissementUpdateComponent({required this.agenda});
  Agendas agenda;

  @override
  State<AppAgendaEtablissementUpdateComponent> createState() =>
      _AppAgendaEtablissementUpdateComponentState();
}

class _AppAgendaEtablissementUpdateComponentState
    extends State<AppAgendaEtablissementUpdateComponent> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EtablissementController>(
        builder: (dController) => Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.whitecolor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.grey7, width: 1.5),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(
                          'jour'.tr,
                          style: TextStyle(
                            fontSize: kSmText,
                            fontFamily: 'Montserrat',
                            color: AppColors.primaryText,
                          ),
                        )),
                        Container(
                            child: Text(
                          Get.find<ActionController>().lang.toLowerCase() ==
                                  'en'
                              ? widget.agenda.libelleEn!
                              : widget.agenda.libelle!,
                        )),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.only(right: kWidth / 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      child: Text(
                                    'debut'.tr,
                                    style: TextStyle(
                                      fontSize: kSmText,
                                      fontFamily: 'Montserrat',
                                      color: AppColors.primaryText,
                                    ),
                                  )),
                                  Container(
                                      child: Text(
                                    widget.agenda.pivot!.debut!,
                                    style: TextStyle(
                                      fontSize: kSmText,
                                      fontFamily: 'Montserrat',
                                      color: AppColors.primaryText,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            onTap: () async {
                              // final result = await TimePicker.show<DateTime?>(
                              //   context: context,
                              //   sheet: TimePickerSheet(
                              //     sheetTitle: 'Set meeting schedule',
                              //     hourTitle: 'Hour',
                              //     minuteTitle: 'Minute',
                              //     saveButtonText: 'Save',
                              //   ),
                              // );
                              // print(result);
                              showCustomTimePicker(
                                  context: context,
                                  helpText: "Selectionner heure de debut",
                                  // It is a must if you provide selectableTimePredicate
                                  onFailValidation: (context) =>
                                      print('Unavailable selection'),
                                  initialTime: TimeOfDay(hour: 2, minute: 0),
                                  selectableTimePredicate: (time) =>
                                      time!.hour > 1 &&
                                      time.hour < 14 &&
                                      time.minute % 10 == 0).then((time) {
                                dController.agendaUpdate(
                                    widget.agenda.pivot!.id,
                                    {'debut': time?.format(context)});
                                dController.setDateDebut0(
                                    widget.agenda.pivot!.id,
                                    time?.format(context));
                                /*   setState(() => widget.start = time?.format(context)) */;
                              });
                            },
                          ),
                          InkWell(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: Text(
                                  'fin'.tr,
                                  style: TextStyle(
                                    fontSize: kSmText,
                                    fontFamily: 'Montserrat',
                                    color: AppColors.primaryText,
                                  ),
                                )),
                                Container(
                                    child: Text(
                                  widget.agenda.pivot!.fin!,
                                  style: TextStyle(
                                    fontSize: kSmText,
                                    fontFamily: 'Montserrat',
                                    color: AppColors.primaryText,
                                  ),
                                )),
                              ],
                            ),
                            onTap: () async {
                              // final result = await TimePicker.show<DateTime?>(
                              //   context: context,
                              //   dismissible: false,
                              //   sheet: TimePickerSheet(
                              //     sheetTitle: 'Set meeting schedule',
                              //     hourTitle: 'Hour',
                              //     minuteTitle: 'Minute',
                              //     saveButtonText: 'Save',
                              //   ),
                              // );
                              // print(result);
                              showCustomTimePicker(
                                  context: context,
                                  helpText:
                                      "Selectionner heure de fin", // It is a must if you provide selectableTimePredicate
                                  onFailValidation: (context) =>
                                      print('Unavailable selection'),
                                  initialTime: TimeOfDay(hour: 2, minute: 0),
                                  selectableTimePredicate: (time) =>
                                      time!.hour > 1 &&
                                      time.hour < 14 &&
                                      time.minute % 10 == 0).then((time) {
                                dController.agendaUpdate(
                                    widget.agenda.pivot!.id,
                                    {'fin': time?.format(context)});
                                dController.setDateFin0(
                                    widget.agenda.pivot!.id,
                                    time?.format(context));
                              } /*   setState(() => widget.end = time?.format(context)) */);
                            },
                          ),
                        ]),
                  ]),
            ));
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