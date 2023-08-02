import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:medsur_app/modules/alerte/constant/apiRouteAlerte.dart';
import 'package:medsur_app/utils/ApiClient.dart';
import 'package:medsur_app/constants/apiRoute.dart';
import 'package:medsur_app/utils/ApiClientAlerte.dart';

class AlerteRepo extends GetxService {
  final ApiClient apiClient;
  final ApiClientAlerte apiClientAlerte;
  AlerteRepo({required this.apiClient, required this.apiClientAlerte});
  
  Future<Response> getLevelEmergency() async {
    Response response = await apiClient.getCollections(
      ApiRoutesAlerte.listniveauurgence,
    );

    return response;
  }

  Future<Response> getSpeciality() async {
    Response response = await apiClientAlerte.getCollections(
      ApiRoutesAlerte.listspecialite,
    );

    return response;
  }

  Future<Response> newAlerte(data) async {
    // try {
    Response response =
        await apiClientAlerte.postData(ApiRoutesAlerte.end_alerte, data);

    return response;
  }

  Future<Response> subScirbeAlerte(user_id, data) async {
    // try {
    Response response = await apiClientAlerte.patchData(
        ApiRoutesAlerte.subscribe_alerte +
            '/' +
            user_id.toString() +
            "/subscribe",
        data);

    return response;
  }

  Future<Response> getUserAlertList(user_id) async {
    Response response = await apiClientAlerte.getCollections(
        ApiRoutesAlerte.end_alerte + '?user_id=' + user_id.toString());

    return response;
  }

  Future<Response> getHistoryParamUserAlert(user_id) async {
    Response response = await apiClientAlerte
        .getCollections(ApiRoutesAlerte.list_info + '/' + user_id.toString());

    return response;
  }
}
