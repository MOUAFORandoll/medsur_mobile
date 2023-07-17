import 'package:flutter/material.dart';
import 'package:medsur_app/constants/index_common.dart';

// ignore: must_be_immutable
class Appbtntext extends StatelessWidget {
  String title = '';
  var icon;

  var onTap;
  Appbtntext({required this.title, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: AppColors.grayColor, width: 2),
                    top: BorderSide.none)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon),
                  Text(title),
                ])));
  }
}
