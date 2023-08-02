import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:medsur_app/utils/ApiClient.dart';
import 'package:medsur_app/constants/apiRoute.dart';

class StartRepo extends GetxService {
  final ApiClient apiClient;
  StartRepo({required this.apiClient});

  Future<Response> getData() async {
    //print('get----------------');
    // try {
    Response response = await apiClient.getCollections(ApiRoutes.start);

    return response;
  }
}
