import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewFunctions {
  snackBar(title, body, bgColor) {
    return Get.snackbar(
      title,
      body,
      icon: Icon(Icons.shopping_bag, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: bgColor,
      borderRadius: 10,
      margin: EdgeInsets.all(10),
      colorText: Colors.white,
      duration: Duration(seconds: 5),
      // isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
  
  /* 
Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.kindacode.com');
      if (response.isNotEmpty) {
        setState(() {
          _isConnected = true;
        });
      }
    } catch (err) {
      setState(() {
        _isConnected = false;
      });
      if (kDebugMode) {
        //print(err);
      }
    }
  } */

  bool connexion = true;

  showToast(bool status) {
    Color? color = status ? Colors.green : Colors.orange[600];
    String message = !status
        ? "Votre appareil n'es pas connecté à Internet. \n veillez vous assurer que votre connexion fonctionne."
        : "Vous ête connecté.";
    Get.snackbar(
        status ? 'vous êtes en ligne maintenant' : 'vous êtes hors ligne',
        message,
        icon: Icon(
          status ? Icons.wifi : Icons.wifi_off_sharp,
          color: color,
        ),
        borderRadius: 5,
        isDismissible: true,
        onTap: (getBar) {},
        snackPosition: SnackPosition.TOP,
        duration:
            status ? const Duration(seconds: 4) : const Duration(minutes: 10),
        barBlur: 20,
        shouldIconPulse: true,
        maxWidth: 450,
        snackStyle: SnackStyle.GROUNDED,
        leftBarIndicatorColor: color,
        backgroundColor: Colors.white);
  }
  
  call(scheme,url) async {
    Uri uri = Uri(scheme: scheme, path: url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
   
}
