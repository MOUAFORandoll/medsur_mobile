import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_loader_element.dart';
import 'package:medsur_app/modules/alerte/components/app_input_min_add.dart';
import 'package:medsur_app/modules/alerte/constant/alert_level_color.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/models/emergency_model.dart';
import 'package:medsur_app/modules/etablissement/components/app_agenda_etablissement_add_component.dart';
import 'package:medsur_app/modules/etablissement/components/app_agenda_etablissement_update_component.dart';
import 'package:medsur_app/modules/etablissement/components/app_list_speciality_etablissement_component.dart';
import 'package:medsur_app/modules/etablissement/components/app_speciality_component.dart';
import 'package:medsur_app/modules/etablissement/controller/etablissement_controller.dart';
import 'package:medsur_app/utils/validators.dart';
import '../../../constants/index_common.dart';
import '../../../general_component/index_widgets.dart';
import 'package:date_input_field/date_input_field.dart';
import 'package:intl/intl.dart';

class TirdStepView extends StatelessWidget {
  TirdStepView({required this.dController});
  EtablissementController dController;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Form(
          key: dController.tirdstepformKey,
          child: ListView.builder(
              itemCount: dController.agenda!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => AppAgendaEtablissementAddComponent(
                  jour: dController.agenda[index][0],
                  start: dController.agenda[index][1],
                  end: dController.agenda[index][2])
              //  Container(
              //     // padding: EdgeInsets.only(
              //     //   top: kMarginY * 2,
              //     // ),
              //     child: Column(
              //       children: [
              //         // Container(
              //         //     alignment: Alignment.centerLeft,
              //         //     margin: EdgeInsets.only(bottom: kMarginY),
              //         //     child: Text(
              //         //       'agenda'.tr,
              //         //       style: TextStyle(
              //         //           fontSize: kMediumText,
              //         //           fontFamily: 'Montserrat',
              //         //           color: AppColors.grey8,
              //         //           fontWeight: FontWeight.w500),
              //         //     )),agenda
              //         AppAgendaAddComponent(
              //             jour: 'Lundi', start: "08:05", end: "08:50"),
              //         AppAgendaAddComponent(
              //             jour: 'Lundi', start: "08:05", end: "08:50"),
              //         AppAgendaAddComponent(
              //             jour: 'Lundi', start: "08:05", end: "08:50"),
              //         AppAgendaAddComponent(
              //             jour: 'Lundi', start: "08:05", end: "08:50"),
              //         AppAgendaAddComponent(
              //             jour: 'Lundi', start: "08:05", end: "08:50"),
              //         AppAgendaAddComponent(
              //             jour: 'Lundi', start: "08:05", end: "08:50"),
              //         AppAgendaAddComponent(
              //             jour: 'Lundi', start: "08:05", end: "08:50"),
              //         // AppInput(
              //         //   controller: dController.birthDayController,
              //         //   label: '',
              //         //   onChanged: (value) {},
              //         //   validator: (value) {
              //         //     return Validators.isDateValid(
              //         //         dController.birthDayController.text);
              //         //   },
              //         // ),
              //       ],
              //     ),
              //   ),
              ),
        ),
      ),
    );
  }
}
