import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_button.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/alerte/components/app_alert_component.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:medsur_app/modules/auth/models/oauth.dart';
import 'package:medsur_app/modules/etablissement/controller/etablissement_controller.dart';
import 'package:medsur_app/modules/etablissement/views/etablissement_list_view.dart';
import 'package:medsur_app/modules/etablissement/views/etablissementgestion.dart';
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

class EtablissementHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EtablissementController>(
        builder: (dController) => Container(
            margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /*    if (dController.loadetat == 0 || dController.loadetat == 2)
                   */
                  Container(
                    height: kMdHeight / 8,
                    padding: EdgeInsets.symmetric(
                      horizontal: kMarginX / 2,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: kMarginX,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryGreen_OP,
                      /*  image: DecorationImage(
                            fit: BoxFit.none,
                            scale: 1.04,
                            image: AssetImage(Assets.alertbg)) */
                    ),
                    child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      child: Text(
                                    'etablissement0'.tr,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: kLg1Text,
                                        // color: AppColors.whitecolor,
                                        fontWeight: FontWeight.w600),
                                  )),
                                  Container(
                                      width: kMdWidth * 1.4,
                                      child: Text(
                                        dController.listEtablissement.length !=
                                                0
                                            ? 'titleetablissement1'.tr
                                            : 'titleetablissement0'.tr,
                                        softWrap: true,
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontSize: kMdText / 1.25,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          // color: AppColors.whitecolor,
                                        ),
                                      ))
                                ]),
                          ),
                          Container(
                            height: kMdHeight,
                            width: kMdWidth / 2,
                            child: Image.asset(Assets.alerte,
                                color: AppColors.primaryBlue,
                                fit: BoxFit.contain),
                          )
                        ]),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                    child: Divider(
                      height: 10,
                      color: AppColors.primaryGreen,
                    ),
                  ),

                  if (dController.loadetat == 0)
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: kMarginX, vertical: kMarginY * 2),
                        child: CircularProgressIndicator()),
                  if (dController.loadetat != 0 &&
                      dController.listEtablissement.length != 0)
                    Container(
                      // margin: EdgeInsets.only(top: kMarginY),
                      child: Text(
                        'letab'.tr,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: kMediumText,
                        ),
                      ),
                    ),
                  if (dController.loadetat ==
                      1 /* &&
                          dController.etablissement != null */
                  )
                    Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: kMarginX,
                        ),
                        child: EtablissementListView()),
                  // if (dController.loadetat != 0 &&
                  //     dController.listEtablissement.length < 4)
                  Container(
                    // margin: EdgeInsets.only(top: kMarginY),
                    padding: EdgeInsets.symmetric(horizontal: kMarginX),
                    child: AppButton(
                      text: 'etablissementbtn'.tr,
                      size: MainAxisSize.max,
                      bgColor: AppColors.primaryGreen,
                      onTap: () async {
                        Get.toNamed(AppLinks.ETABLISSEMENT_NEW);
                      },
                    ),
                  ),
                ],
              ),
              // ),
            )));
  }
}
