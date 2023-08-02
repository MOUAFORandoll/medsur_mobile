import 'package:flutter/material.dart'
    show
        Container,
        EdgeInsets,
        Expanded,
        Icon,
        Icons,
        MainAxisAlignment,
        Row,
        ScaffoldMessenger,
        SnackBar,
        Text;
import 'package:get/get.dart';

import '../constants/index_common.dart';

toastShowNiveauUrgence(message, color, context) {
  // Toast.show(
  //   message,
  //   context,
  //   duration: 6,
  //   gravity: Toast.BOTTOM,
  //   backgroundColor: color,
  // );
  var snackBar = SnackBar(
      content: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  message,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
              // Icon(Icons.check_circle_sharp)
            ],
          )),
      backgroundColor: color);
  // Step 3
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

toastShowSuccess(message, context) {
  // Toast.show(
  //   message,
  //   context,
  //   duration: 6,
  //   gravity: Toast.BOTTOM,
  //   backgroundColor: color,
  // );
  var snackBar = SnackBar(
      content: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  message,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(Icons.check_circle_sharp)
            ],
          )),
      backgroundColor: AppColors.primaryGreen);
  // Step 3
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

checkError(bool log,
  data,) {
  // try {
  if (data != null) {
    if (data.containsKey('error')) {
      if (data['error'] is String) {
        toastShowError(data['error'], Get.context);
      } else {
        final errors = data['error'] as Map<String, dynamic>;

        // Affichage des erreurs pour chaque champ
        errors.forEach((key, value) {
          final errorMessage = value[0] as String;
          toastShowError(errorMessage, Get.context);
          print('$key: $errorMessage');
        });
      }
    } else if (data.containsKey('email')) {
      toastShowError(data['email'][0], Get.context);
    } else if (data.containsKey('message')) {
      toastShowError(data['message'], Get.context);
    } else {
      toastShowError("errors".tr, Get.context);
    }
  } else {
    if (log) {
      toastShowError("errorslog".tr, Get.context);
    }
  }
}

toastShowError(message, context) {
  // Toast.show(
  //   message,
  //   context,
  //   duration: 6,
  //   gravity: Toast.BOTTOM,
  //   backgroundColor: color,
  // );
  var snackBar = SnackBar(
      content: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Text(
                message,
                // overflow: TextOverflow.ellipsis,
              )),
              Icon(Icons.warning)
            ],
          )),
      backgroundColor: AppColors.red);
  // Step 3
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
