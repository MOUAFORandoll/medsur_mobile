import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_button.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/alerte/components/app_alert_component.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:medsur_app/modules/auth/models/oauth.dart';
import 'package:medsur_app/modules/etablissement/components/app_agenda_etablissement_add_component.dart';
import 'package:medsur_app/modules/etablissement/components/app_agenda_etablissement_update_component.dart';
import 'package:medsur_app/modules/etablissement/components/app_alert_etablissement_component.dart';
import 'package:medsur_app/modules/etablissement/controller/etablissement_controller.dart';
import 'package:medsur_app/modules/home/components/App_btn_text.dart';
import 'package:medsur_app/modules/home/components/app_btn_home_add.dart';
import 'package:medsur_app/modules/home/controller/home_controller.dart';
import 'package:medsur_app/utils/routing.dart';
import '../../../constants/assets.dart';
import 'package:medsur_app/styles/dimension.dart';
import 'package:medsur_app/general_component/app_input_search.dart';
import 'package:medsur_app/general_component/app_text_title.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/home/components/App_btn_text.dart';
import 'package:medsur_app/modules/home/components/app_btn_home.dart';
import '../../../constants/index_common.dart';

class AgendaEtablissementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EtablissementController>(
        builder: (dController) => Scaffold(
              backgroundColor: AppColors.grey3,
              appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left_outlined,
                    ),
                    tooltip:
                        MaterialLocalizations.of(context).backButtonTooltip,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  title: Text('hAlerte'.tr),
                  centerTitle: true,
                  backgroundColor: AppColors.grey3,
                  elevation: 0.2),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: kMarginX),
                child: SingleChildScrollView(
                  child: /*  dController.loadAlert
                      ? Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator())
                      :  */
                      Container(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                          itemCount: dController.etablissement.agendas.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              AppAgendaEtablissementUpdateComponent(
                                  jour: Get.find<ActionController>()
                                              .lang
                                              .toLowerCase() ==
                                          'en'
                                      ? dController
                                          .etablissement.agendas[index].libelleEn
                                      : dController
                                          .etablissement.agendas[index].libelle,
                                  start: dController
                                      .etablissement.agendas[index].pivot.debut,
                                  end: dController
                                      .etablissement.agendas[index].pivot.fin)),
                    ),
                  ),
                ),
              ),
              // bottomNavigationBar: Container(
              //   height: kHeight * .12,
              //   child: Text('fddfdf'),
              // ),
            ));
  }
}
