import 'package:get/get.dart';
import 'package:medsur_app/modules/DashBoard/repo/dashboard_repo.dart';
import 'package:medsur_app/modules/Home/repo/home_repo.dart';
import 'package:medsur_app/modules/alerte/controller/alerte_controller.dart';
import 'package:medsur_app/modules/alerte/repo/alerte_repo.dart';
import 'package:medsur_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:medsur_app/modules/home/controller/home_controller.dart';
import 'package:medsur_app/utils/ApiClient.dart';
import 'package:medsur_app/utils/ApiClientAlerte.dart';
import 'modules/auth/controller/auth_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:medsur_app/modules/auth/repo/auth_repo.dart';
import 'package:medsur_app/general_repository/start_repo.dart';
import 'package:medsur_app/general_controllers/start_controller.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/general_controllers/dataBase_controller.dart';

Future<void> initServices() async {
  await requestPermission();
  Get.put(DataBaseController(), permanent: true);

  Get.put(ApiClient(), permanent: true);
  Get.put(ApiClientAlerte(), permanent: true);

  Get.put(AuthRepo(apiClient: Get.find()), permanent: true);

  Get.put(AuthController(authRepo: Get.find()), permanent: true);
  Get.put(ActionController(), permanent: true);

  // Get.put(TeleconsultationRepo(apiClient: Get.find()), permanent: true);

  // Get.put(TeleconsultationController(teleconsultationRepo: Get.find()),
  //     permanent: true);
  Get.put(AlerteRepo(apiClient: Get.find(), apiClientAlerte: Get.find()),
      permanent: true);

  Get.put(AlerteController(alerteRepo: Get.find()), permanent: true);

  Get.put(HomeRepo(apiClient: Get.find()), permanent: true);

  Get.put(HomeController(homeRepo: Get.find()), permanent: true);
  Get.put(DashBoardRepo(apiClient: Get.find()), permanent: true);

  Get.put(DashBoardController(dashboardRepo: Get.find()), permanent: true);
  Get.put(StartRepo(apiClient: Get.find()), permanent: true);
  Get.put(StartController(startRepo: Get.find()), permanent: true);
}

Future<void> initApp() async {
  print("desssbut get bind************---------------------------");

  await Get.find<DataBaseController>().initDatabase();

  await Get.find<ActionController>().getLanguageInit();
  await Get.find<ActionController>().getMyPosition();
  await Get.find<HomeController>().getUserinfo_BD();
  await Get.find<AuthController>().getUserPermission_BD();
  await Get.find<DashBoardController>().getUserRole_BD();
  await Get.find<AuthController>().getUserToken();
  //print("fin get bind************---------------------------");
}

Future<void> startApp() async {
  //print("desssbut get bind************---------------------------");

  await Get.find<AuthController>().getUserinfo_OL();
  // await Get.find<AuthController>().getUserToken();
  await Get.find<AlerteController>().getUserAlert();
  await Get.find<AlerteController>().getHistoryParamUserAlert();
  await Get.find<AlerteController>().getLevelEmergency();
  await Get.find<AlerteController>().getSpeciality();
  await Get.find<AlerteController>().setUserInfo();
  //print("fin get bind************---------------------------");
}

// Future<void> initApp() async {
//   //print("desssbut get bind************---------------------------");

//   await Get.find<DataBaseController>().initDatabase();

//   await Get.find<ActionController>().getLanguageInit();
//   await Get.find<HomeController>().getUserinfo_BD();
//   await Get.find<AuthController>().getUserPermission_BD();
//   await Get.find<DashBoardController>().getUserRole_BD();
//   await Get.find<AuthController>().getUserinfo_OL();
//   await Get.find<AuthController>().getUserToken();
//   await Get.find<AlerteController>().getUserAlert();
//   await Get.find<AlerteController>().getHistoryParamUserAlert();
//   await Get.find<AlerteController>().getLevelEmergency();
//   await Get.find<AlerteController>().getSpeciality();
//   await Get.find<AlerteController>().setUserInfo();
//   //print("fin get bind************---------------------------");
// }

onGetAll() async {
  await Get.find<AuthController>().getUserToken();
  await Get.find<HomeController>().getUserinfo_BD();
  await Get.find<AuthController>().getUserPermission_BD();
  await Get.find<DashBoardController>().getUserRole_BD();
  await Get.find<AuthController>().getUserinfo_OL();
  await Get.find<AlerteController>().getUserAlert();

  await Get.find<AlerteController>().getLevelEmergency();
  await Get.find<AlerteController>().getSpeciality();
  await Get.find<AlerteController>().setUserInfo();
}

onGetDataNew() async {}

requestPermission() async {
  var status = await Permission.storage.status;
  print("voici le statut ,  $status");
  if (!status.isGranted) {
    await Permission.storage.request();
  }
}
