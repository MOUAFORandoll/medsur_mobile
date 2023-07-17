import 'package:flutter/material.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/styles/colors.dart';

class AppTextTitleNoE extends StatelessWidget {
  AppTextTitleNoE(
      {required this.text,
      required this.bolder,
      this.center = false,
      this.big = false});
  final bool bolder;
  final bool big;
  final String text;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: center ? TextAlign.center : TextAlign.start,
      style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: bolder ? FontWeight.w600 : FontWeight.normal,
          fontSize: big ? kLg0Text : kMdText,
          color: AppColors.primaryText),
    );
  }
}
