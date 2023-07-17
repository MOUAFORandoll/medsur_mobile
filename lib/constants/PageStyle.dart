 
import 'package:flutter/material.dart';
import 'package:medsur_app/constants/index_common.dart';

abstract class PageStyle {
  static const decoration = BoxDecoration(
    color: Colors.white,
    image: DecorationImage(
      opacity: 0.3,
      image: AssetImage(
        Assets.bgAuth,
      ),
      fit: BoxFit.cover,
    ),
  );
}
