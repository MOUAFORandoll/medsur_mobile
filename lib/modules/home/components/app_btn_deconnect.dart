import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class AppbtnDeconnect extends StatelessWidget {
  var onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.find<AuthController>().deconnectUser();
        },
        child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: kSmHeight / 1.8,
                    width: kSmWidth / 4.5,
                    child: SvgPicture.asset(
                      Assets.disconnect,
                      width: 90,
                      height: 90,
                      color: AppColors.red,
                    ),
                  ),
                  Text('deconnecter'.tr,
                      style: TextStyle(
                        color: AppColors.grayColor,
                      )),
                ])));
  }
}
