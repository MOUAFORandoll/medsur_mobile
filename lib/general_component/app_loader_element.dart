import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:medsur_app/constants/index_common.dart';

import 'bounce_loader.dart';

Widget loaderElement() {
  return Container(
      width: 100.0,
      height: 100.0,
      //color: AppColors.primaryBlue12,
      child: Center(
          child: Container(
              child: Image.asset(
        Assets.spin,
        fit: BoxFit.fill,
        height: kMdHeight / 30,
      ))));
}
