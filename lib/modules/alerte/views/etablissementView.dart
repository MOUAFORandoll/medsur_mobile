import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_button.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/alerte/components/app_agenda_component.dart';
import 'package:medsur_app/modules/alerte/components/app_alert_component.dart';
import 'package:medsur_app/modules/alerte/components/app_alert_map.dart';
import 'package:medsur_app/modules/alerte/components/app_estasblishment_component.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/models/etablissement_model.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:medsur_app/modules/auth/models/oauth.dart';
import 'package:medsur_app/modules/home/components/App_btn_text.dart';
import 'package:medsur_app/modules/home/components/app_btn_home_add.dart';
import 'package:medsur_app/modules/home/controller/home_controller.dart';
import 'package:medsur_app/utils/formatData.dart';
import 'package:medsur_app/utils/routing.dart';
import 'package:medsur_app/utils/viewFunctions.dart';
import '../../../constants/assets.dart';
import 'package:medsur_app/styles/dimension.dart';
import 'package:medsur_app/general_component/app_input_search.dart';
import 'package:medsur_app/general_component/app_text_title.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/home/components/App_btn_text.dart';
import 'package:medsur_app/modules/home/components/app_btn_home.dart';
import '../../../constants/index_common.dart';

class EtablissementView extends StatelessWidget {
  EtablissementModel etablissement;
  EtablissementView({required this.etablissement});
  @override
  Widget build(BuildContext context) {
    var _format = new FormatData();

    return WillPopScope(
        child: Scaffold(
            backgroundColor: AppColors.grey3,
            appBar: AppBar(
                leading: Container(),
                /*   IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left_outlined,
                  ),
                  tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                  onPressed: () {
                    return Get.find<AlerteController>().closeList();
                  },
                ), */
                actions: [
                  InkWell(
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: kMarginX, vertical: kMarginY * 2.5),
                        // padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(

                            // borderRadius: BorderRadius.circular(20),
                            ),
                        child: Text(
                          'change',
                          style: TextStyle(
                              // fontSize: kSmText,
                              fontFamily: 'Montserrat',
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w600),
                        )),
                    onTap: () {
                      Navigator.of(context).pop();
                      // Get.find<AlerteController>().closeList();
                    },
                  )
                ],
                title: Text(
                  _format.capitalizeFirstLetter(etablissement.name!),
                  style: TextStyle(
                      // fontSize: kSmText,
                      fontFamily: 'Montserrat',
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w600),
                ),
                centerTitle: true,
                backgroundColor: AppColors.grey3,
                elevation: 0.2),
            body: Container(
              // height: kHeight * .8,
              padding: EdgeInsets.symmetric(horizontal: kMarginX),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   margin: EdgeInsets.symmetric(vertical: kMarginX / 2),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Container(),
                    //       Container(
                    //           height: 3,
                    //           width: kMdWidth * .3,
                    //           margin: EdgeInsets.symmetric(vertical: kMarginY / 2),
                    //           decoration: BoxDecoration(
                    //               color: AppColors.grey2,
                    //               borderRadius: BorderRadius.circular(30)),
                    //           child: Container()),
                    //       Container(
                    //           child: Icon(Icons.ios_share_outlined,
                    //               color: AppColors.primaryGreen))
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   alignment: Alignment.topLeft,
                    //   width: kWidth,
                    //   margin: EdgeInsets.symmetric(vertical: kMarginY),
                    //   child: Text(
                    //     etablissement.name!,
                    //     overflow: TextOverflow.ellipsis,
                    //     textAlign: TextAlign.start,
                    //     style: TextStyle(
                    //         fontSize: kMdText, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    /*    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                      child: Row(
                        children: [
                          Container(
                              child: Icon(Icons.local_phone_sharp,
                                  color: AppColors.primaryGreen)),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: kMarginX),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Text(
                                        'emergency'.tr + ' ',
                                        style: TextStyle(
                                          fontSize: kSmText,
                                          fontFamily: 'Montserrat',
                                          color: AppColors.primaryText,
                                        ),
                                      ),
                                      Text(
                                        etablissement.phone!,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: kSmText,
                                            color: AppColors.primaryText,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Text(
                                        'ambulance'.tr + ' ',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: AppColors.primaryText,
                                          fontSize: kSmText,
                                        ),
                                      ),
                                      Text(
                                          etablissement.phone2!,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontFamily: 'Montserrat',
                                              fontSize: kSmText,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  */
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.symmetric(vertical: kMarginY),
                        child: Row(
                          children: [
                            // Container(
                            //     child: Icon(Icons.local_phone_sharp,
                            //         color: AppColors.primaryGreen)),
                            Expanded(
                              child: Container(
                                child: Text(
                                  _format.capitalizeFirstLetter(
                                      etablissement.name!),
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: kMediumText,
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        )),

                    InkWell(
                      child: Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.symmetric(vertical: kMarginY),
                          child: Row(
                            children: [
                              Container(
                                  child: Icon(Icons.local_phone_sharp,
                                      color: AppColors.primaryGreen)),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: kMarginX / 2),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'emergency'.tr + ' ',
                                  style: TextStyle(
                                    // fontSize: kSmText,
                                    fontFamily: 'Montserrat',
                                    color: AppColors.primaryText,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    etablissement.phone!,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      // fontSize: kSmText,
                                      color: AppColors
                                          .primaryText, /* fontWeight: FontWeight.w600 */
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      onTap: () => ViewFunctions().call(
                        'tel',
                        etablissement.phone!,
                      ),
                    ),
                    InkWell(
                      child: Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.symmetric(vertical: kMarginY),
                          child: Row(
                            children: [
                              Container(
                                  child: Icon(Icons.local_phone_sharp,
                                      color: AppColors.primaryGreen)),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: kMarginX / 2),
                                  child: Text(
                                    'ambulance'.tr + ' ',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: AppColors.primaryText,
                                      // fontSize: kSmText,
                                    ),
                                  )),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    etablissement.phone2!,
                                    softWrap: true,
                                    // overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontFamily: 'Montserrat',
                                      // fontSize: kSmText,
                                      /* fontWeight: FontWeight.w600 */
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      onTap: () => ViewFunctions().call(
                        'tel',
                        etablissement.phone!,
                      ),
                    ),
                    InkWell(
                      child: Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.symmetric(vertical: kMarginY),
                        child: Row(
                          children: [
                            Container(
                                child: Icon(Icons.mail,
                                    color: AppColors.primaryGreen)),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.symmetric(
                                    horizontal: kMarginX / 2),
                                child: Text(
                                  etablissement.email!,
                                  style: TextStyle(
                                      // fontSize: kSmText,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => ViewFunctions().call(
                        'mailto',
                        etablissement.email!,
                      ),
                    ),
                    InkWell(
                      child: Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.symmetric(vertical: kMarginY),
                          child: Row(
                            children: [
                              Container(
                                child: /* Icon(Icons.bookmark_outline_outlined,
                                  color: AppColors.primaryGreen) */

                                    SvgPicture.asset(
                                  Assets.globe,
                                  width: 22,
                                  height: 22,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: kMarginX / 2),
                                  child: Text(
                                    etablissement.siteweb ?? 'Aucun',
                                    style: TextStyle(
                                        // fontSize: kSmText,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      onTap: () => ViewFunctions().call(
                        'https',
                        etablissement.siteweb!,
                      ),
                    ),
                    if (etablissement.specialites!.length != 0)
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.symmetric(vertical: kMarginY),
                        child: Row(
                          children: [
                            Container(
                              child: SvgPicture.asset(
                                Assets.category,
                                width: 23,
                                height: 23,
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.symmetric(
                                  horizontal: kMarginX / 2),
                              child: Text(
                                'speciality1'.tr + ": ",
                                style: TextStyle(
                                    // fontSize: kSmText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (etablissement.specialites!.length != 0)
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.symmetric(vertical: kMarginY),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                                    new FormatData().specialityToText(
                                        etablissement.specialites!),
                                    textAlign: TextAlign.start,
                                    // overflow: TextOverflow.ellipsis,
                                    // softWrap: true,
                                    style: TextStyle(
                                        // fontSize: kSmText,
                                        ))),
                          ],
                        ),
                      ),
                    // if (etablissement.categories!.length != 0)
                    //   Container(
                    //     alignment: Alignment.topLeft,
                    //     margin: EdgeInsets.symmetric(vertical: kMarginY),
                    //     child: Row(children: [
                    //       Container(
                    //         child: SvgPicture.asset(
                    //           Assets.category,
                    //           width: 23,
                    //           height: 23,
                    //         ),
                    //       ),
                    //       Container(
                    //         alignment: Alignment.topLeft,
                    //         margin:
                    //             EdgeInsets.symmetric(horizontal: kMarginX / 2),
                    //         child: Text(
                    //           'services'.tr + ": ",
                    //           style: TextStyle(
                    //               // fontSize: kSmText,
                    //               ),
                    //         ),
                    //       ),
                    //     ]),
                    //   ),
                    // if (etablissement.categories!.length != 0)
                    //   Container(
                    //     alignment: Alignment.topLeft,
                    //     margin: EdgeInsets.symmetric(vertical: kMarginY),
                    //     child: Row(
                    //       children: [
                    //         Expanded(
                    //             child: Text(
                    //                 new FormatData().serviceToText(
                    //                     etablissement.categories!),
                    //                 textAlign: TextAlign.start,
                    //                 // overflow: TextOverflow.ellipsis,
                    //                 // softWrap: true,
                    //                 style: TextStyle(
                    //                     // fontSize: kSmText,
                    //                     ))),
                    //       ],
                    //     ),
                    //   ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(vertical: kMarginY),
                      child: Row(
                        children: [
                          Container(
                              child: Icon(Icons.watch_later,
                                  color: AppColors.primaryGreen)),
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.symmetric(horizontal: kMarginX / 2),
                            child: Column(
                              children: [
                                Text(
                                  _format.capitalizeFirstLetter('agenda'.tr),
                                  style: TextStyle(
                                      // fontSize: kSmText,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    AppAgendaComponent(
                      listAgenda: etablissement.agendas,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                      child: Row(
                        children: [
                          Container(
                              child: Icon(Icons.location_on,
                                  color: AppColors.primaryGreen)),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.symmetric(
                                  horizontal: kMarginX / 2),
                              child: Text(
                                etablissement.localisation == null
                                    ? 'Aucune'
                                    : etablissement.localisation!.ville! +
                                        ' long ${etablissement.localisation!.longitude} lat ${etablissement.localisation!.latitude} ',
                                softWrap: true,
                                overflow: TextOverflow
                                    .ellipsis, // Truncate with ellipsis (...) when the text overflows
                                maxLines: 2,
                                style: TextStyle(
                                    // fontSize: kSmText,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                      child: Column(
                        children: [
                          // Container(
                          //   alignment: Alignment.topLeft,
                          //   child: TextButton(
                          //       onPressed: () => Get.to(AppAlertMap(
                          //             etablissement: etablissement,
                          //           )),
                          //       child: Text('Voir sur la carte')),
                          Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: kMarginY * 2),
                              height: 200,
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     color: AppColors.primaryGreen),
                              child: AppAlertMap(
                                latitude: double.parse(etablissement
                                    .localisation!.latitude
                                    .toString()),
                                longitude: double.parse(etablissement
                                    .localisation!.longitude
                                    .toString()),

                                // text:'Voir sur la carte'
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
        onWillPop: () {
          return Get.find<AlerteController>().closeList();
        });
  }
}
