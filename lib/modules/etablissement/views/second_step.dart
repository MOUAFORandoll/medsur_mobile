import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_loader_element.dart';
import 'package:medsur_app/modules/alerte/components/app_input_min_add.dart';
import 'package:medsur_app/modules/alerte/constant/alert_level_color.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/models/emergency_model.dart';
import 'package:medsur_app/modules/etablissement/components/app_list_speciality_etablissement_component.dart';
import 'package:medsur_app/modules/etablissement/components/app_speciality_component.dart';
import 'package:medsur_app/modules/etablissement/controller/etablissement_controller.dart';
import 'package:medsur_app/utils/validators.dart';
import '../../../constants/index_common.dart';
import '../../../general_component/index_widgets.dart';
import 'package:date_input_field/date_input_field.dart';
import 'package:intl/intl.dart';

class SecondStepView extends StatelessWidget {
  SecondStepView({required this.dController});
  EtablissementController dController;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Form(
        key: dController.secondstepformKey,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                child: Row(children: [
                  Expanded(
                      child: Text(
                    'etaspe'.tr,
                    style: TextStyle(
                      fontSize: kMdText,
                      fontFamily: 'Montserrat',
                      color: AppColors.grey8,
                    ),
                  ))
                ])),
            dController.loadSpeciality
                ? loaderElement()
                : InkWell(
                    onTap: () => {
                      Get.bottomSheet(
                        AppListSpecialityEtablissementComponent(),
                        isScrollControlled: true,
                        barrierColor: AppColors.primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        backgroundColor: Colors.transparent,
                      )
                    },
                    child: Container(
                      width: kWidth,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: kMarginY),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.grey7, width: 1.5),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: kMarginY * 3,
                      ),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: kMarginX / 2),
                                child: Text(
                                  'Select speciality',
                                  style: TextStyle(
                                      fontSize: kMediumText,
                                      color: AppColors.grayColor),
                                )),
                            Container(
                              padding: EdgeInsets.only(right: kMarginX / 2),
                              child: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: AppColors.grey6,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      //     child: Text(
                      //   'spst'.tr,
                      //   style: TextStyle(
                      // fontSize: kSmText,
                      //     fontFamily: 'Montserrat',
                      //     color: AppColors.grey1,
                      //   ),
                      // )),
                      Expanded(
                          child: Text(
                        'spt'.tr,
                        style: TextStyle(
                            fontSize: kMdText,
                            fontFamily: 'Montserrat',
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.bold),
                      )),
                      Container(
                          alignment: Alignment.centerLeft,
                          // margin: EdgeInsets.only(bottom: kMarginY),
                          child: Text(
                            'select'.tr +
                                ' ' +
                                dController.listSelectSpeciality.length
                                    .toString(),
                            style: TextStyle(
                                fontSize: kMdText,
                                fontFamily: 'Montserrat',
                                color: AppColors.grey8),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: kMarginY * 2),
                child: SingleChildScrollView(
                    child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dController.listSelectSpeciality.length,
                  itemBuilder: (_ctx, index) {
                    return AppSpecialityComponent(
                        specialite: dController.listSelectSpeciality[index],
                        onTap: () => dController.removeSpeciality(
                              dController.listSelectSpeciality[index],
                            ));
                  },
                ))),
          ],
        ),
      ),
    ));
  }
}
