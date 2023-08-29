import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_loader_element.dart';
import 'package:medsur_app/modules/alerte/components/app_input_min_add.dart';
import 'package:medsur_app/modules/alerte/constant/alert_level_color.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/models/emergency_model.dart';
import 'package:medsur_app/modules/etablissement/components/app_estasblishment_component.dart';
import 'package:medsur_app/modules/etablissement/components/app_etablissement_home_option.dart';
import 'package:medsur_app/modules/etablissement/components/app_home_speciality_etablissement_component%20.dart';
import 'package:medsur_app/modules/etablissement/controller/etablissement_controller.dart';
import 'package:medsur_app/utils/routing.dart';
import 'package:medsur_app/utils/validators.dart';
import '../../../constants/index_common.dart';
import '../../../general_component/index_widgets.dart';
import 'package:date_input_field/date_input_field.dart';
import 'package:intl/intl.dart';

class EtablissementListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _format = new FormatData();

    return GetBuilder<EtablissementController>(
        builder: (dController) => Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            // margin: EdgeInsets.only(top: kMarginY),
            // height: kHeight / 2.2,
            // constraints: BoxConstraints(maxHeight: kHeight / 2),
            // decoration: BoxDecoration(
            //     color: AppColors.red, borderRadius: BorderRadius.circular(20)),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2,
                //   crossAxisSpacing: 8.0,
                //   childAspectRatio: 1.1,
                //   mainAxisSpacing: 15.0,
                // ),
                itemCount: dController.listEtablissement.length,
                itemBuilder: (_ctx, index) => AppEstasblishmentComponent(
                    etablissement: dController.listEtablissement[index],
                    onTap: () => dController.selectEtablissement(
                        dController.listEtablissement[index])))));
  }
}
