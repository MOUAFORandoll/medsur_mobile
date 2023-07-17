import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:medsur_app/utils/ApiClient.dart';
import 'package:medsur_app/constants/apiRoute.dart';

class HomeRepo extends GetxService {
  final ApiClient apiClient;
  HomeRepo({required this.apiClient});
   
}
