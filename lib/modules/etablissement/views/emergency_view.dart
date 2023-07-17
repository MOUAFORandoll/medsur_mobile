// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:medsur_app/general_component/app_button.dart';
// import 'package:medsur_app/modules/Home/components/listtile_component.dart';
// import 'package:medsur_app/modules/alerte/components/app_alert_component.dart';
// import 'package:medsur_app/modules/alerte/constant/alert_level_color.dart';
// import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
// import 'package:medsur_app/modules/alerte/models/emergency_model.dart';
// import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
// import 'package:medsur_app/modules/auth/models/oauth.dart';
// import 'package:medsur_app/modules/home/components/App_btn_text.dart';
// import 'package:medsur_app/modules/home/components/app_btn_home_add.dart';
// import 'package:medsur_app/modules/home/controller/home_controller.dart';
// import 'package:medsur_app/utils/routing.dart';
// import '../../../constants/assets.dart';
// import 'package:medsur_app/styles/dimension.dart';
// import 'package:medsur_app/general_component/app_input_search.dart';
// import 'package:medsur_app/general_component/app_text_title.dart';
// import 'package:medsur_app/modules/Home/components/listtile_component.dart';
// import 'package:medsur_app/modules/home/components/App_btn_text.dart';
// import 'package:medsur_app/modules/home/components/app_btn_home.dart';
// import '../../../constants/index_common.dart';
// import '../../../general_component/index_widgets.dart';

// class EmergencyView extends StatefulWidget {
//   @override
//   State<EmergencyView> createState() => _EmergencyViewState();
// }

// class _EmergencyViewState extends State<EmergencyView> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AlerteController>(
//         builder: (dController) => Container(
//                 child: SingleChildScrollView(
//               child: Form(
//                 key: dController.emergencyformKey,
//                 child: Column(
//                   children: [
//                     Container(
//                         alignment: Alignment.centerLeft,
//                         margin: EdgeInsets.only(bottom: kMarginY),
//                         child: Text(
//                           'levelE'.tr,
//                           style: TextStyle(
//                               fontSize: kSmText,
//                               fontFamily: 'Montserrat',
//                               color: AppColors.lightGrey,
//                               fontWeight: FontWeight.w600),
//                         )),
//                     Container(
//                         width: kWidth,
//                         alignment: Alignment.centerLeft,
//                         margin: EdgeInsets.only(bottom: kMarginY * 2),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           border:
//                               Border.all(color: AppColors.grey7, width: 1.5),
//                         ),
//                         padding: EdgeInsets.symmetric(
//                           vertical: kMarginY * .2,
//                         ),
//                         child: dController.loadLevelEmergency &&
//                                 dController.listLevelEmergency.length == 0
//                             ? Container()
//                             : DropdownButton<EmergencyModel?>(
//                                 value: dController.levelEmergency.isNull
//                                     ? null
//                                     : dController.levelEmergency,
//                                 hint: Container(
//                                     margin: EdgeInsets.only(left: kMarginX / 2),
//                                     child: Text(
//                                       'Select level of emergency',
//                                       style: TextStyle(
//                                           color: AppColors.grayColor,
//                                           fontSize: 15),
//                                     )),
//                                 icon: Container(
//                                   padding: EdgeInsets.only(right: kMarginX / 2),
//                                   child: Icon(
//                                     Icons.keyboard_arrow_down_outlined,
//                                     color: AppColors.primaryGreen,
//                                   ),
//                                 ),
//                                 iconSize: 25,
//                                 isExpanded: true,
//                                 underline: SizedBox(),
//                                 style: TextStyle(
//                                     color: AppColors.primaryGreen,
//                                     fontSize: 20),
//                                 onChanged: (newValue) {
//                                   dController.setLevelEmergence(newValue);
//                                 },
//                                 items: dController.listLevelEmergency
//                                     .map<DropdownMenuItem<EmergencyModel>>(
//                                         (EmergencyModel emergencyModel) {
//                                   return DropdownMenuItem<EmergencyModel>(
//                                     value: emergencyModel,
//                                     child: Container(
//                                       padding:
//                                           EdgeInsets.only(left: kMarginX / 2),
//                                       child: Text(
//                                         'Niveau d\'urgence ' +
//                                             emergencyModel.valeur.toString(),
//                                         style: TextStyle(
//                                             color:
//                                                 AlerteLevelColor.colorForLevel(
//                                                     emergencyModel.valeur
//                                                         .toString()),
//                                             fontSize: 15),
//                                       ),
//                                     ),
//                                   );
//                                 }).toList(),
//                               )),
//                     Container(
//                         alignment: Alignment.centerLeft,
//                         margin: EdgeInsets.only(bottom: kMarginY),
//                         child: Text(
//                           'complain'.tr,
//                           style: TextStyle(
//                               fontSize: kSmText,
//                               fontFamily: 'Montserrat',
//                               color: AppColors.lightGrey,
//                               fontWeight: FontWeight.w600),
//                         )),
//                     Container(
//                         alignment: Alignment.centerLeft,
//                         margin: EdgeInsets.only(bottom: kMarginY * 15),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                                 height: 200,
//                                 width: kMdWidth * 1.8,
//                                 child: AppTextForm(
//                                   controller: dController.descriptionController,
//                                 )),
//                             Container(
//                                 child: GestureDetector(
//                               child: !dController.speechToText.isNotListening
//                                   ? SpinKitWave(
//                                       color: AppColors.primaryBlue,
//                                       size: 25.0,
//                                     )
//                                   : Icon(
//                                       /*  dController.speechToText.isNotListening
//                                     ? Icons.mic_off
//                                     : */
//                                       Icons.mic,
//                                       // Icons.keyboard_voice_outlined,
//                                       size: kMdIcon,
//                                       color: AppColors.primaryBlue,
//                                     ),
//                               onLongPressStart:
//                                   (LongPressStartDetails details) {
//                                 if (dController.speechToText.isNotListening) {
//                                   dController.startListening();
//                                 }
//                               },
//                               onLongPressEnd: (LongPressEndDetails details) {
//                                 if (!dController.speechToText.isNotListening) {
//                                   dController.stopListening();
//                                 }
//                               },
//                               /* onLongPress:
//                                         dController.speechToText.isNotListening
//                                             ? dController.startListening
//                                             : dController.stopListening */
//                             )),
//                           ],
//                         )),
//                   ],
//                 ),
//               ),
//             )));
//   }
// }
