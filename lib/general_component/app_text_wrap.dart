import 'package:flutter/material.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/styles/colors.dart';

class AppTextWrap extends StatelessWidget {
  AppTextWrap({
    required this.text,
    required this.bolder,
    this.color = Colors.white,
  });
  final bool bolder;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: bolder ? FontWeight.w600 : FontWeight.normal,
          fontSize: kXlText,
          color: color),
    );
  }
}
