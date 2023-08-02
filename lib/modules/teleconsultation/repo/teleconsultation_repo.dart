import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:medsur_app/utils/ApiClient.dart';
import 'package:medsur_app/constants/apiRoute.dart';

class TeleconsultationRepo extends GetxService {
  final ApiClient apiClient;
  TeleconsultationRepo({required this.apiClient});
   
  Future<Response> listContact(data) async {
    // try {
    Response response = await apiClient.getCollectionsP(ApiRoutes.login, data);

    return response;
  }
}
