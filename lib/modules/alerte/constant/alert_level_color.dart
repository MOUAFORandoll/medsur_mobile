import 'package:flutter/material.dart';

class AlerteLevelColor {
  static const l11 = Color(0xFFDBEFDB);
  static const l12 = Color(0xFF46AF46);
  static const l21 = Color(0xFFDBEFDB);
  static const l22 = Color(0xFF46AF46);
  static const l31 = Color(0xFFF8EFC2);
  static const l32 = Color(0xFFFFBC01);
  static const l41 = Color(0xFFFEE3D1);
  static const l42 = Color(0xFFFF6600);
  static const l51 = Color(0xFFF1E2E4);
  static const l52 = Color(0xFFF5365C);

  static colorForLevel(a) {
    var level = int.parse(a);
    switch (level) {
      case 1:
        return l12;
      case 2:
        return l22;
      case 3:
        return l32;
      case 4:
        return l42;
      case 5:
        return l52;

      default:
        return l12;
    }
  }
}
