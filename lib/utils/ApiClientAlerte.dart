import 'package:get/get.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:medsur_app/utils/apiUrl.dart';
import 'package:medsur_app/constants/apiRoute.dart';
import 'package:medsur_app/utils/routing.dart';
import '../general_controllers/dataBase_controller.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class ApiClientAlerte extends GetConnect implements GetxService {
  String token = '';
  String appBaseUrl = ApiUrl.baseUrlAlerte;
  late Map<String, String> _mainHeaders;
  
  ApiClientAlerte() {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 10);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
    };

    // add the refresh token interceptor
    // httpClient.addAuthenticator<dynamic>((request) async {
    //   final newHeaders = {'Authorization': 'Bearer $token'};
    //       request.headers['Authorization'] = 'Bearer $token';
    //   // request.headers.addAll(newHeaders);
    //   return request;
    // });
    httpClient.addRequestModifier<dynamic>((request) {
      _setAuthHeaders();

      // //print('===========================$token============================');
      // Intercept the request before it is sent to the server
      request.headers['Authorization'] = 'Bearer $token';
      return request;
    });

    // add the token refresh logic to the response interceptor
    httpClient.addResponseModifier<dynamic>((request, response) async {
      _setAuthHeaders();

      if ((response.statusCode == '401' || response.statusCode == '403')) {
        //print(response.statusCode);
        await Get.find<AuthController>()
            .refreshToken(request.url.path.toString());
        //  //print('secomnd8888888=+++}+++++++++++++++++++++++++++}-=======================================================');
        _setAuthHeaders();
        _mainHeaders['Authorization'] = 'Bearer $token';

        request.headers.addAll(_mainHeaders);
        request.headers['Authorization'] = 'Bearer $token';
        return await _retry(request);
      } else {
        return response;
      }
    });
  }
  Future<Response<dynamic>> _retry(Request request) async {
    return this.request<dynamic>(
      request.url.path,
      request.method,
      body: request.bodyBytes,
      headers: request.headers,
    );
  }

  void onInit() {
    _setAuthHeaders();
    super.onInit();
  }

  DataBaseController db = Get.find();

  void _setAuthHeaders() async {
    var getU = await db.getToken();
    token = getU['access_token'];
    //print(token);
  }

  Future<Response> getCollections(url) async {
    Response rep = await get(
      url, /*  headers: _mainHeaders, */
    );
    return rep;
  }

  Future<Response> getCollectionsP(url, data) async {
    Response rep = await post(
      url.toString(),
      data, /*  headers: _mainHeaders, */
    );
    return rep;
  }

  Future<Response> postData(url, data) async {
    // //print(this.httpClient.defaultContentType);

    Response rep = await post(url.toString(), data);
    return rep;
  }

  Future<Response> patchData(url, data) async {
    // //print(this.httpClient.defaultContentType);

    Response rep = await patch(url.toString(), data);
    return rep;
  }
}


// class TokenInterceptor extends GetConnectInterceptor {
//   @override
//   Future<Request> onRequest(Request request) async {
//     request.headers['Authorization'] = 'Bearer $token';
//     return request;
//   }

//   @override
//   Future<Response<T>> onResponse<T>(Response<T> response) async {
//     if (response.statusCode == 401) {
//       // Si le jeton d'accès est expiré, récupérez un nouveau jeton en utilisant le jeton de rafraîchissement.
//       // Notez que cela suppose que vous avez une méthode pour récupérer un nouveau jeton à partir du jeton de rafraîchissement.
//       String newToken = await _getNewToken(refreshToken, clientId, clientSecret);
//       // Mettez à jour le jeton d'accès et réessayez la demande.
//       token = newToken;
//       return await super.onResponse(await super.request(response.request.method, response.request.url));
//     }
//     return response;
//   }

//   Future<String> _getNewToken(String refreshToken, String clientId, String clientSecret) async {
//     // Code pour récupérer un nouveau jeton à partir du jeton de rafraîchissement.
//     // ...
//     return 'nouveau_token_d_accès';
//   }
// }

