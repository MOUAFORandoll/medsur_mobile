import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/core.dart';
// import 'package:medsur_app/utils/NotificationService.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/utils/routing.dart';
import 'package:medsur_app/utils/translations.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // MyBinding().dependencies();
  await initServices();
  await initApp();
  runApp(MyApp());
}

final _darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: AppColors.primaryText,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  textTheme: TextTheme(
    bodyText2:
        TextStyle(fontFamily: 'Montserrat', color: AppColors.primaryText),
  ),
);

final _lightTheme = ThemeData(
  primaryColor: Colors.white,
  brightness: Brightness.light,
  iconTheme: IconThemeData(
    color: AppColors.primaryBlue,
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: kMdText + 1,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w700),
  ),
  // Couleur du texte principal
  primaryTextTheme: TextTheme(
    headline6: TextStyle(
      color: AppColors.primaryText,
    ),
  ),
  // Couleur du bouton pour autoriser la localisation
  buttonColor: AppColors.green,
  // Couleur du bouton pour refuser la localisation
  disabledColor: AppColors.wrappBGB,
  dividerColor: Colors.white54,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kMdText,
      color: AppColors.primaryText,
    ),
    displayLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      fontSize: kMdText,
      color: AppColors.primaryText,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kMdText,
      color: AppColors.primaryText,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kMdText,
      color: AppColors.primaryText,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kMdText,
      color: AppColors.primaryText,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kMdText,
      color: AppColors.primaryText,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kLg1Text,
      color: AppColors.primaryText,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kLg1Text,
      color: AppColors.primaryText,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kLg1Text,
      color: AppColors.primaryText,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kMdText,
      color: AppColors.primaryText,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kMdText,
      color: AppColors.primaryText,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kMdText,
      color: AppColors.primaryText,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kMdText,
      color: AppColors.primaryText,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
      .copyWith(background: AppColors.whitecolor)
      .copyWith(
        secondary: AppColors.primaryText,
      ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MyBinding().onInit();

    return GetMaterialApp(
      translations: Transalations(),
      // locale: Get.find<ActionController>().lan,
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: ThemeMode.light, //ThemeMode.system,
      debugShowCheckedModeBanner: false,
      // fallbackLocale:Get.find<ActionController>().lan, //
      //  initialBinding: MyBinding(),
      initialRoute: AppLinks.TEST,
      getPages: AppRoutes.pages,
    );
  }
}
