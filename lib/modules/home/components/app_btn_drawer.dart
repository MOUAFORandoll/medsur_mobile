import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class AppbtnDrawer extends StatelessWidget {
  String title;
  var onTap;
  var present;
  AppbtnDrawer({required this.title, required this.onTap, required this.present});
  @override
  Widget build(BuildContext context) {
    return present == true ? InkWell(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: TextStyle(
                        
                        color: AppColors.grayColor,
                      )),
                  Container(
                      child: Icon(
                    Icons.keyboard_arrow_right,
                    size: 25,
                    color: AppColors.grayColor,
                  )),
                ]))): Container();
  }
}
