import 'package:flutter/material.dart';
import 'package:medsur_app/constants/index_common.dart';

// ignore: must_be_immutable
class AppbtnHomeAdd extends StatelessWidget {
  String? libelle = '';
  var image;
  var select;

  var onTap;
  AppbtnHomeAdd({this.libelle, this.image, this.onTap, this.select});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: kSmHeight * 1.8,
          width: kSmWidth * .575,
          padding: EdgeInsets.all(kMarginX),
          margin: EdgeInsets.symmetric(
              vertical: kMarginY, horizontal: kMarginX * .01),
          decoration: BoxDecoration(
              // gradient: GradientApp.blueG,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryGrey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              color: AppColors.extraLightGrey,
              borderRadius: BorderRadius.circular(15)),
          child: Icon(Icons.add, size: 30, color: AppColors.primaryGrey)),
    );
  }
}
