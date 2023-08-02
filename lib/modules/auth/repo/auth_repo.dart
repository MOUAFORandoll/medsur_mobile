import 'package:get/get.dart';
import 'package:medsur_app/utils/ApiClient.dart';
import 'package:medsur_app/constants/apiRoute.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:medsur_app/general_controllers/dataBase_controller.dart';

class AuthRepo extends GetxService {
  final ApiClient apiClient;
  AuthRepo({required this.apiClient});
  var store = Get.find<DataBaseController>();
  
  Future<Response> authUser(data) async {
   
    Response response = await apiClient.postData(ApiRoutes.login, data);

    return response;
  }Future<Response> logOutUser(data) async {
   
    Response response = await apiClient.postData(ApiRoutes.logout, data);

    return response;
  }
    
  Future<Response> forgotPassword(data) async {
    Response response = await apiClient.postData(ApiRoutes.forgot, data);

    return response;
  }

  Future<Response> sendMailCode(data) async {
    Response response = await apiClient.postData(ApiRoutes.registerMail, data);

    return response;
  }
  
  Future<Response> refreshToken(data) async {
   
    Response response = await apiClient.postData(ApiRoutes.refresh, data);
    
    return response;
  }
  
  Future<Response> registerUser(data) async {
   
    Response response = await apiClient.postData(ApiRoutes.register, data);
    
    return response;
  }  
  Future getUser() async { 
    var getU = await store.getToken();
    
    if (getU != null ) {
      
      Response a =
          await apiClient.getCollections(ApiRoutes.user);
      
      
      return a;
      
    } else {
      return new Response(body: {
       
         
      }, statusCode: 200);
    }
  }

}
