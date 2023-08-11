import 'package:get/get.dart';
import 'package:medsur_app/TestView.dart';
import 'package:medsur_app/modules/alerte/views/alerte_view.dart';
import 'package:medsur_app/modules/alerte/views/list_alerte_view.dart';
import 'package:medsur_app/modules/alerte/views/list_etablissementView.dart';
import 'package:medsur_app/modules/alerte/views/new_alerte_view.dart';
import 'package:medsur_app/modules/auth/views/new_password_view.dart';
import 'package:medsur_app/modules/auth/views/select_account_view.dart';
import 'package:medsur_app/modules/auth/views/success_password_view.dart';
import 'package:medsur_app/modules/etablissement/views/agenda_etablissement_view.dart';
import 'package:medsur_app/modules/etablissement/views/etablissement_home_view.dart';
import 'package:medsur_app/modules/etablissement/views/etablissementgestion.dart';
import 'package:medsur_app/modules/etablissement/views/info_etablissement_view.dart';
import 'package:medsur_app/modules/etablissement/views/list_alerte_etablissement_view.dart';
import 'package:medsur_app/modules/etablissement/views/list_specialite_etablissement_view.dart';
import 'package:medsur_app/modules/etablissement/views/map_page.dart';
import 'package:medsur_app/modules/etablissement/views/new_etablissment_view.dart';
import 'package:medsur_app/modules/etablissement/views/success_etablissement_view.dart';
import 'package:medsur_app/modules/splashscreen/views/select_experience_view.dart';
import 'package:medsur_app/modules/splashscreen/views/wrapper_view.dart';
import '../modules/auth/views/login_view.dart';
import 'package:medsur_app/modules/Home/views/home_view.dart';
import 'package:medsur_app/modules/auth/views/forgot_password_view.dart';
import 'package:medsur_app/modules/splashscreen/views/splashscreen_view.dart';

import '../modules/auth/views/register_view.dart';
import '../modules/teleconsultation/views/teleconsultation_view.dart';

var transitionX = Transition.zoom;

class AppRoutes {
  static final pages = [
    GetPage(
      name: AppLinks.TEST,
      page: () => TestView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.SPLASHSCREEN,
      page: () => SplashscreenView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.WRAPPER,
      page: () => WrapperView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.EXPERIENCE,
      page: () => SelectExperienceView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.HOME,
      page: () => HomeView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.LOGIN,
      page: () => LoginView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.REGISTER,
      page: () => RegisterView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.FORGOT,
      page: () => ForgotPasswordView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.SELECTACCOUNT,
      page: () => SelectAccountView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.FNEWPASSWORD,
      page: () => NewPasswordView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.SUCCESSPASSWORD,
      page: () => SuccessPasswordView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.TELECONSULTATION,
      page: () => TeleconsultationView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.ALERTE,
      page: () => AlertView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.NEW_ALERTE,
      page: () => NewAlertView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.LIST_ALERTE,
      page: () => ListAlertView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.LIST_ETABLISSEMENT,
      page: () => ListEtablissementView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.ETABLISSEMENT,
      page: () => EtablissementHomeView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.ETABLISSEMENT_NEW,
      page: () => NewEtablissementView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.ETABLISSEMENT_GESTIOM,
      page: () => EtablissementGView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.SUCCESSETABLISSEMENT,
      page: () => SuccessEtablissementView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.ETABLISSEMENT_ALERTE_LIST,
      page: () => ListAlertEtablissementView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.ETABLISSEMENT_SPECIALITE_LIST,
      page: () =>
          ListSpecialiteEtablissementView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.ETABLISSEMENT_AGENDA_LIST,
      page: () => AgendaEtablissementView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.ETABLISSEMENT_INFO,
      page: () => InfoEtablissementView(), /* transition: transitionX */
    ),
    GetPage(
      name: AppLinks.MAP,
      page: () => MapPage(), /* transition: transitionX */
    ),
  ];
}

class AppLinks {
  static const String MAP = "/map";
  static const String TEST = "/test";
  static const String SPLASHSCREEN = "/splashscreen";
  static const String WRAPPER = "/wrapper";
  static const String EXPERIENCE = "/experience";
  static const String HOME = "/home";
  static const String LOGIN = "/login";
  static const String REGISTER = "/register";
  static const String FORGOT = "/forgot";
  static const String SELECTACCOUNT = "/forgot/selectaccount";
  static const String FNEWPASSWORD = "/forgot/newpassword";
  static const String SUCCESSPASSWORD = "/forgot/success";
  static const String TELECONSULTATION = "/teleconsultation";
  static const String ALERTE = "/alerte";
  static const String NEW_ALERTE = "/alerte/new";
  static const String LIST_ALERTE = "/alerte/list";
  static const String LIST_ETABLISSEMENT = "/etablissement/list";
  static const String ETABLISSEMENT = "/etablissement";
  static const String SUCCESSETABLISSEMENT = "/etablissement/success";
  static const String ETABLISSEMENT_NEW = "/etablissement/new";
  static const String ETABLISSEMENT_ALERTE_LIST = "/etablissement/alerte/list";
  static const String ETABLISSEMENT_SPECIALITE_LIST =
      "/etablissement/specialite/list";
  static const String ETABLISSEMENT_AGENDA_LIST = "/etablissement/agenda/list";
  static const String ETABLISSEMENT_INFO = "/etablissement/info";
  static const String ETABLISSEMENT_GESTIOM = "/etablissement/gestion";
}
