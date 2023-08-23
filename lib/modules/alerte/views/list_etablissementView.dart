import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/general_component/app_button.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/Home/components/listtile_component.dart';
import 'package:medsur_app/modules/alerte/components/app_alert_component.dart';
import 'package:medsur_app/modules/alerte/components/app_categorie_filter_component.dart';
import 'package:medsur_app/modules/alerte/components/app_estasblishment_component.dart';
import 'package:medsur_app/modules/alerte/components/app_list_speciality_component.dart';
import 'package:medsur_app/modules/alerte/components/app_speciality_component_second.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/models/etablissement_model.dart';
import 'package:medsur_app/modules/alerte/views/etablissementView.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:medsur_app/modules/auth/models/oauth.dart';
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

class ListEtablissementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlerteController>(
        builder: (aController) => WillPopScope(
            child: Scaffold(
              backgroundColor: AppColors.grey3,
              appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left_outlined,
                      color: AppColors.primaryText,
                    ),
                    tooltip:
                        MaterialLocalizations.of(context).backButtonTooltip,
                    onPressed: () {
                      return aController.closeList();
                    },
                  ),
                  title: Text(
                    'etablissement'.tr,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w600),
                  ),
                  centerTitle: true,
                  backgroundColor: AppColors.grey3,
                  elevation: 0.2),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: kMarginX).add(
                  EdgeInsets.only(top: kMarginY * 2),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // InkWell(
                      //   child: AppCategorieFilterComponent(
                      //       categorie: aController.listCategoriesSelect),
                      //   onTap: () {
                      //     Get.bottomSheet(
                      //       GetBuilder<AlerteController>(
                      //           builder: (_alerteController) => Container(
                      //               height: kHeight * .8,
                      //               padding: EdgeInsets.symmetric(
                      //                   horizontal: kMarginX),
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.only(
                      //                   topLeft: Radius.circular(10),
                      //                   topRight: Radius.circular(10),
                      //                 ),
                      //                 color: AppColors.whitecolor,
                      //               ),
                      //               child: SingleChildScrollView(
                      //                 child: Column(
                      //                   children: [
                      //                     Container(
                      //                       alignment: Alignment.centerLeft,
                      //                       margin: EdgeInsets.only(
                      //                           top: kMarginY * 2),
                      //                       child: InkWell(
                      //                         onTap: () {
                      //                           _alerteController
                      //                               .resetFilterCategories();
                      //                           Get.back();
                      //                         },
                      //                         child: Container(
                      //                           decoration: BoxDecoration(
                      //                               borderRadius:
                      //                                   BorderRadius.circular(
                      //                                       8),
                      //                               border: Border.all(
                      //                                 color: AppColors.grey7,
                      //                               )),
                      //                           padding: EdgeInsets.symmetric(
                      //                               horizontal: kMarginX / 2,
                      //                               vertical: kMarginY * 2.5),
                      //                           // margin: EdgeInsets.symmetric(
                      //                           //     vertical: kMarginY / 2),
                      //                           child: Row(
                      //                               mainAxisAlignment:
                      //                                   MainAxisAlignment
                      //                                       .spaceBetween,
                      //                               children: [
                      //                                 Expanded(
                      //                                   child: Text(
                      //                                     Get.find<ActionController>()
                      //                                                 .lang
                      //                                                 .toLowerCase() ==
                      //                                             'en'
                      //                                         ? 'All'
                      //                                         : 'Tous',
                      //                                     style: TextStyle(
                      //                                       color: AppColors
                      //                                           .primaryGreen,
                      //                                     ),
                      //                                   ),
                      //                                 )
                      //                               ]),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     Container(
                      //                         alignment: Alignment.centerLeft,
                      //                         margin: EdgeInsets.only(
                      //                             top: kMarginY * 1),
                      //                         child: SingleChildScrollView(
                      //                             child: ListView.builder(
                      //                           physics:
                      //                               NeverScrollableScrollPhysics(),
                      //                           shrinkWrap: true,
                      //                           itemCount: _alerteController
                      //                               .listCategories.length,
                      //                           itemBuilder: (_ctx, index) {
                      //                             return InkWell(
                      //                                 onTap: () {
                      //                                   _alerteController
                      //                                       .filterCategorie0(
                      //                                           _alerteController
                      //                                                   .listCategories[
                      //                                               index]);
                      //                                   // Get.back();
                      //                                 },
                      //                                 child: Container(
                      //                                     decoration:
                      //                                         BoxDecoration(
                      //                                             borderRadius:
                      //                                                 BorderRadius
                      //                                                     .circular(
                      //                                                         8),
                      //                                             border: Border
                      //                                                 .all(
                      //                                               color: AppColors
                      //                                                   .grey7,
                      //                                             )),
                      //                                     padding: EdgeInsets
                      //                                         .symmetric(
                      //                                             horizontal:
                      //                                                 kMarginX /
                      //                                                     2,
                      //                                             vertical:
                      //                                                 kMarginY),
                      //                                     margin: EdgeInsets
                      //                                         .symmetric(
                      //                                             vertical:
                      //                                                 kMarginY /
                      //                                                     2),
                      //                                     child: Row(
                      //                                       mainAxisAlignment:
                      //                                           MainAxisAlignment
                      //                                               .spaceBetween,
                      //                                       children: [
                      //                                         Expanded(
                      //                                             child:
                      //                                                 Container(
                      //                                                     child:
                      //                                                         Text(
                      //                                           Get.find<ActionController>()
                      //                                                       .lang
                      //                                                       .toLowerCase() ==
                      //                                                   'en'
                      //                                               ? _alerteController
                      //                                                   .listCategories[
                      //                                                       index]
                      //                                                   .libelle_en
                      //                                               : _alerteController
                      //                                                   .listCategories[
                      //                                                       index]
                      //                                                   .libelle,
                      //                                           style:
                      //                                               TextStyle(
                      //                                             color: AppColors
                      //                                                 .primaryGreen,
                      //                                           ),
                      //                                         ))),
                      //                                         Checkbox(
                      //                                             value: _alerteController.isContainCategorie(
                      //                                                 _alerteController
                      //                                                         .listCategories[
                      //                                                     index]),
                      //                                             onChanged:
                      //                                                 (val) {
                      //                                               _alerteController
                      //                                                   .filterCategorie0(
                      //                                                       _alerteController.listCategories[index]);
                      //                                             })
                      //                                         // RadioListTile<
                      //                                         //     Categories>(
                      //                                         //   value: _alerteController
                      //                                         //           .listCategories[
                      //                                         //       index],
                      //                                         //   groupValue:
                      //                                         //       _alerteController
                      //                                         //           .categorie,
                      //                                         //   title: Text(
                      //                                         //     Get.find<ActionController>()
                      //                                         //                 .lang
                      //                                         //                 .toLowerCase() ==
                      //                                         //             'en'
                      //                                         //         ? _alerteController
                      //                                         //             .listCategories[
                      //                                         //                 index]
                      //                                         //             .libelle_en
                      //                                         //         : _alerteController
                      //                                         //             .listCategories[
                      //                                         //                 index]
                      //                                         //             .libelle,
                      //                                         //     style:
                      //                                         //         TextStyle(
                      //                                         //       color: AppColors
                      //                                         //           .primaryGreen,
                      //                                         //     ),
                      //                                         //   ),
                      //                                         //   activeColor:
                      //                                         //       AppColors
                      //                                         //           .primaryGreen,
                      //                                         //   onChanged:
                      //                                         //       (val) {
                      //                                         //     // authCont.selectCheck(val);
                      //                                         //   },
                      //                                         // )
                      //                                       ],
                      //                                     )));
                      //                           },
                      //                         )))
                      //                   ],
                      //                 ),
                      //               ))),
                      //       isScrollControlled: true,
                      //       barrierColor: AppColors.primaryBlue26,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.vertical(
                      //             top: Radius.circular(16)),
                      //       ),
                      //       backgroundColor: Colors.transparent,
                      //     );
                      //   },
                      // ),
                      Container(
                        width: double.infinity,
                        child: Wrap(
                          spacing: 7,
                          runSpacing: kMarginY / 2,
                          children: List.generate(
                              /*    aController.suiteSpeciality
                                  ? */
                              aController.listSelectSpeciality.length
                              /*   : aController.listSelectSpeciality.length > 3
                                      ? 3
                                      : aController.listSelectSpeciality.length */
                              , (index) {
                            return (aController.listSelectSpeciality.length -
                                        1 ==
                                    index)
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppSpecialityComponentSecond(
                                          specialite: aController
                                              .listSelectSpeciality[index],
                                          onTap: () async {
                                            aController.removeSpeciality(
                                              aController
                                                  .listSelectSpeciality[index],
                                            );
                                            await aController.newAlerte();
                                          }),
                                      InkWell(
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 5, top: 10),
                                            height: 30,
                                            padding: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryGreen_OP,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Icon(Icons.add)),
                                        onTap: () => Get.bottomSheet(
                                          AppListSpecialityComponent(
                                              isActualise: true),
                                          isScrollControlled: true,
                                          barrierColor: AppColors.primaryBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(16)),
                                          ),
                                          backgroundColor: Colors.transparent,
                                        ),
                                      )
                                    ],
                                  )
                                : AppSpecialityComponentSecond(
                                    specialite:
                                        aController.listSelectSpeciality[index],
                                    onTap: () async {
                                      aController.removeSpeciality(
                                        aController.listSelectSpeciality[index],
                                      );
                                      await aController.newAlerte();
                                    });
                          }),
                        ),
                      ),
                      // if (aController.listSelectSpeciality.length - 3 > 0 &&
                      //     !aController.suiteSpeciality)
                      //   InkWell(
                      //       child: Container(
                      //         margin: EdgeInsets.only(top: 3),
                      //         height: 30,
                      //         padding: EdgeInsets.all(3),
                      //         decoration: BoxDecoration(
                      //           color: AppColors.primaryGreen_OP,
                      //           borderRadius: BorderRadius.circular(30),
                      //         ),
                      //         child: Icon(Icons.keyboard_arrow_down_outlined),
                      //       ),
                      //       onTap: () => aController.setSuite()),
                      /*   if (aController.suiteSpeciality &&
                          aController.listSelectSpeciality.length - 3 > 0)
                        Container(
                          width: double.infinity,
                          child: Wrap(
                            spacing: 7,
                            runSpacing: kMarginY / 2,
                            children: List.generate(
                                aController.listSelectSpeciality.length - 3,
                                (index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: AppColors.primaryGreen,
                                  ),
                                ),
                                margin: EdgeInsets.only(top: 4),
                                padding: EdgeInsets.all(3),
                                child: Text(
                                  aController
                                      .listSelectSpeciality[index + 3].libelle,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: kSmText,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                     */
                      // if (aController.suiteSpeciality &&
                      //     aController.listSelectSpeciality.length - 3 > 0)
                      //   InkWell(
                      //       child: Container(
                      //           margin: EdgeInsets.only(top: 3),
                      //           height: 30,
                      //           padding: EdgeInsets.all(3),
                      //           decoration: BoxDecoration(
                      //             color: AppColors.primaryGreen_OP,
                      //             borderRadius: BorderRadius.circular(30),
                      //           ),
                      //           child: Icon(Icons.keyboard_arrow_up_outlined)),
                      //       onTap: () => aController.setSuite()),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(vertical: kMarginY),
                        margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'enname'.tr,
                                style: TextStyle(
                                    fontSize: kMdText,
                                    fontFamily: 'Montserrat',
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              child: Text(
                                aController.iscategories
                                    ? aController.listSearchEtablissement.length
                                        .toString()
                                    : aController.listEtablissement.length
                                            .toString() +
                                        ' ' +
                                        'spst'.tr,
                                style: TextStyle(
                                    fontSize: 13.0 * proportion,
                                    color: AppColors.newgreen,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // aController.searchEtownController.text.length != 0
                      aController.iscategories
                          ? aController.listSearchEtablissement.length == 0
                              ? Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      vertical: kMarginY * 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Assets.listblanck,
                                          width: 50,
                                          height: 50,
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.symmetric(
                                                vertical: kMarginY * 2),
                                            child: Text(
                                              '',
                                              style: TextStyle(
                                                  fontSize: kMdText,
                                                  fontFamily: 'Montserrat',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: AppColors.grayColor,
                                                  fontWeight: FontWeight.w400),
                                            ))
                                      ]),
                                )
                              : Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(top: kMarginY),
                                  child: SingleChildScrollView(
                                      child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: aController
                                        .listSearchEtablissement.length,
                                    itemBuilder: (_ctx, index) {
                                      return AppEstasblishmentComponent(
                                        etablissement: aController
                                            .listSearchEtablissement[index],
                                        selected: aController.isEtablissment(
                                            aController.listSearchEtablissement[
                                                index]),
                                        onTap: () async {
                                          Get.dialog(ModalDialog(
                                            etablissement: aController
                                                .listSearchEtablissement[index],
                                          ));
                                        },
                                      );
                                    },
                                  )))
                          : Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: kMarginY),
                              child: SingleChildScrollView(
                                  child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: aController.listEtablissement.length,
                                itemBuilder: (_ctx, index) {
                                  return AppEstasblishmentComponent(
                                    etablissement:
                                        aController.listEtablissement[index],
                                    selected: aController.isEtablissment(
                                        aController.listEtablissement[index]),
                                    onTap: () async {
                                      Get.dialog(ModalDialog(
                                        etablissement: aController
                                            .listEtablissement[index],
                                      ));
                                    },
                                  );
                                },
                              ))),
                    ],
                  ),
                ),
              ),
            ),
            onWillPop: () {
              return aController.closeList();
            }));
  }
}

class ModalDialog extends StatelessWidget {
  EtablissementModel etablissement;
  ModalDialog({required this.etablissement});
  var aController = Get.find<AlerteController>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'confirm'.tr,
        style: TextStyle(
          fontSize: kSmText,
          fontFamily: 'Montserrat',
          color: AppColors.primaryText,
        ),
      ),
      actions: [
        TextButton(
          child: Text('cancel'.tr),
          onPressed: () {
            Get.back();
          },
        ),
        ElevatedButton(
            child: Text("choise".tr,
                style: TextStyle(color: AppColors.whitecolor)),
            style: ElevatedButton.styleFrom(
              primary: AppColors.primaryGreen,
            ),
            onPressed: () async {
              Get.back();
              aController.selectE(etablissement);
              var status = await aController.subScribeAlerte();
              //print(status);
              if (status) {
                Get.to(() => EtablissementView(etablissement: etablissement));
              }
            }),
      ],
    );
  }
}
