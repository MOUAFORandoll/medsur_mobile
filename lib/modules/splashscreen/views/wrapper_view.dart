import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/general_component/app_lang_button.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
 
import 'package:medsur_app/modules/splashscreen/components/app_carroussel_item.dart';
import 'package:medsur_app/utils/routing.dart'; 
class WrapperView extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActionController>(
        builder: (action) => Scaffold(
              // appBar: AppBar(
              //   title: const Text('Agora Video Call'),
              // ),
              backgroundColor: AppColors.primaryGreen,

              body: SingleChildScrollView(
                  child: Stack(
                children: [
                  CarouselSlider(
                    carouselController: action.controller,
                    items: [
                      AppCarrousselItem(
                        title: 'ctitle1'.tr,
                        description: 'cdescription1'.tr,
                        image: Assets.wrapper3,
                      ),
                      AppCarrousselItem(
                          title: 'ctitle2'.tr,
                          description: 'cdescription2'.tr,
                          image: Assets.wrapper2,
                          index: action.index),
                      AppCarrousselItem(
                        title: 'ctitle3'.tr,
                        description: 'cdescription3'.tr,
                        image: Assets.wrapper1,
                      )
                    ],
                    options: CarouselOptions(
                      aspectRatio: 4 / 4,

                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      onPageChanged: (index, reason) {
                        action.setIndex(index);
                      },

                      disableCenter: true,
                      height: Get.height,
                      // enlargeCenterPage: true,
                      // autoPlay: true,

                      // autoPlayCurve: Curves.fastOutSlowIn,
                      // enableInfiniteScroll: true,
                      viewportFraction: 1.0,
                    ),
                  ),
                  // action.index == 0
                  //     ? Container()
                  //     : Positioned(
                  //         left: 5,
                  //         top: 5,
                  //         bottom: 5,
                  //         right: 5,
                  //         child: Container(

                  //             // margin: EdgeInsets.all(kMarginX / 4),
                  //             child: SvgPicture.asset(
                  //           action.index == 1 ? Assets.w1 : Assets.w2,
                  //           width: 23,
                  //           height: 23,
                  //         )),
                  //       ),
                  Positioned(
                    left: 5,
                    top: 5,
                    bottom: 5,
                    right: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: ['0', '1', '2'].asMap().entries.map((entry) {
                        return Container(
                          width: 6.0,
                          height: 6.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : AppColors.primaryGreen)
                                  .withOpacity(
                                      action.index == entry.key ? 0.9 : 0.2)),
                        );
                      }).toList(),
                    ),
                  ),
                  // Positioned(
                  //   left: 0,
                  //   top: 12,
                  //   // right: 5,
                  //   child: Container(
                  //     padding: EdgeInsets.all(kMarginX),
                  //     // margin: EdgeInsets.symmetric(
                  //     //     vertical: kMarginY, horizontal: kMarginX * 3),
                  //     child: Image.asset(
                  //       Assets.logoMedium,
                  //       height: kMdHeight / 30,
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    left: 0,
                    top: 12,
                    child: Container(
                        margin: EdgeInsets.all(kMarginX)
                            .add(EdgeInsets.only(top: -kMarginX / 2.2)),
                        padding: EdgeInsets.all(kMarginX / 3.2),
                        child: AppLangButton()),
                  ),
                  Positioned(
                    right: 0,
                    top: 12,
                    child: Container(
                        padding: EdgeInsets.only(
                            top: kMarginY * 2.6, right: kMarginX),
                        child: TextButton(
                          onPressed: () {
                            // Get.offNamedUntil(AppLinks.LOGIN, (route) => false);
                            Get.offNamedUntil(AppLinks.LOGIN, (route) => false);
                          },
                          child: Text('sauter'.tr,
                              style: TextStyle(
                                  color: AppColors.primaryGreen,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: kLgText)),
                        )),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: action.index == 0
                        ? Container()
                        : Container(
                            margin: EdgeInsets.all(kMarginX)
                                .add(EdgeInsets.only(bottom: 15)),
                            padding: EdgeInsets.all(kMarginX / 3.2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: InkWell(
                              onTap: () {
                                action.controller.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear,
                                );
                              },
                              child: Icon(
                                Icons.keyboard_arrow_left_outlined,
                                size: 25,
                                color: action.index == 1
                                    ? AppColors.blue
                                    : AppColors.green,
                              ),
                            )),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: /* action.isState
                        ? Column(children: [
                            Padding(
                              padding: EdgeInsets.only(top: kMarginY * 3),
                              child: AppButton(
                                text: 'logbtn'.tr,
                                bgColor: Colors.white,
                                size: MainAxisSize.max,
                                onTap: () async {
                                  Get.toNamed(AppLinks.LOGIN);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kMarginY * 1.5,
                                  vertical: kMarginX),
                              child: AppButton(
                                text: 'regbtn'.tr,
                                bgColor: Colors.blueAccent,
                                size: MainAxisSize.max,
                                onTap: () async {
                                  Get.toNamed(AppLinks.REGISTER);
                                },
                              ),
                            )
                          ])
                        :  */
                        Container(
                            margin: EdgeInsets.all(kMarginX)
                                .add(EdgeInsets.only(bottom: 15)),
                            padding: EdgeInsets.all(kMarginX / 3.2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              onTap: () {
                                action.index == 2
                                    ? Get.offNamedUntil(
                                        AppLinks.LOGIN, (route) => false)

                                    // Get.toNamed(AppLinks.LOGIN)
                                    // action.setState()
                                    : action.controller.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.linear,
                                      );
                              },
                              child: Icon(
                                Icons.keyboard_arrow_right_outlined,
                                size: 25,
                                color: action.index == 1
                                    ? AppColors.blue
                                    : AppColors.green,
                              ),
                            )),
                  ),
                ],
              )),
            ));
  }
}
