// import 'package:get/get.dart';
// import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
// import 'package:medsur_app/utils/apiUrl.dart';
// import 'package:medsur_app/constants/apiRoute.dart';
// import 'package:medsur_app/utils/routing.dart';
// import '../general_controllers/dataBase_controller.dart';
// import 'package:get/get_connect/http/src/request/request.dart';

// class ApiClient extends GetConnect {
//   String token = '';
//   String appBaseUrl = ApiUrl.baseUrl;
//   late Map<String, String> _mainHeaders;
//   int maxConcurrentRequests = 5;
//   int currentRequestCount = 0;

//   ApiClient() {
//     baseUrl = appBaseUrl;
//     timeout = Duration(seconds: 600);
//     _mainHeaders = {
//       'Content-Type': 'application/json; charset=utf-8',
//     };
//     httpClient.addRequestModifier<dynamic>((request) {

//       setAuthHeaders();

//       request.headers['Authorization'] = 'Bearer $token';
//       return request;
//     });

//     httpClient.addResponseModifier<dynamic>((request, response) async {
//       setAuthHeaders();
//       if ((response.statusCode == 401 || response.statusCode == 403)) {
//         print(maxConcurrentRequests);
//         if (currentRequestCount >= maxConcurrentRequests) {
//           await Future.delayed(Duration(seconds: 10));
//           return await _retry(request);
//         } else {
//           request.headers.remove('Authorization');
//           print(response.statusCode);
//           await Get.find<AuthController>()
//               .refreshToken(request.url.path.toString());
//           setAuthHeaders();
//           _mainHeaders['Authorization'] = 'Bearer $token';
//           request.headers.addAll(_mainHeaders);
//           request.headers['Authorization'] = 'Bearer $token';
//           currentRequestCount++;
//           return await _retry(request);
//         }
//       } else {
//         return response;
//       }
//     });
//   }

//   Future<Response<dynamic>> _retry(Request request) async {
//     return this.request<dynamic>(
//       request.url.path,
//       request.method,
//       body: request.bodyBytes,
//       headers: request.headers,
//     );
//   }

//   void onInit() {
//     setAuthHeaders();
//     super.onInit();
//   }

//   DataBaseController db = Get.find();

//   setAuthHeaders() async {
//     var getU = await db.getToken();
//     token = getU['access_token'];
//   }

//   Future<Response> getCollections(url) async {
//     Response rep = await get(
//       url,
//     );
//     return rep;
//   }

//   Future<Response> getCollectionsP(url, data) async {
//     Response rep = await post(
//       url.toString(),
//       data,
//     );
//     return rep;
//   }

//   Future<Response> postData(url, data) async {
//     Response rep = await post(url.toString(), data);
//     return rep;
//   }

//   Future<Response> patchData(url, data) async {
//     Response rep = await patch(url.toString(), data);
//     return rep;
//   }
// }
import 'package:get/get.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
import 'package:medsur_app/utils/apiUrl.dart';
import 'package:medsur_app/constants/apiRoute.dart';
import '../general_controllers/dataBase_controller.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class ApiClient extends GetConnect {
  String token = '';
  String appBaseUrl = ApiUrl.baseUrl;
  late Map<String, String> _mainHeaders;
  int maxConcurrentRequests = 5;
  int currentRequestCount = 0;
  
  ApiClient() {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 120);
    _mainHeaders = {
      'Content-Type': 'application/json; charset=utf-8',
    };
    httpClient.addRequestModifier<dynamic>((request) async {
      print(request.url.path.toString());
      print(ApiRoutes.refresh);
      print(request.url.path.toString() == ApiRoutes.refresh);
      bool inExpiredToken = await db.inExpiredToken();
      if (inExpiredToken) {
        print('refresh*---------------');
        await Get.find<AuthController>()
            .refreshToken(request.url.path.toString());
      } else {
        print('is ok-----*---------------');
      }
      // if (request.url.path.toString() == ApiRoutes.refresh) {
       
      //   return request;
      // } else {
      setAuthHeaders();
      request.headers['Authorization'] = 'Bearer $token';
      return request;
      // }
    });

    httpClient.addResponseModifier<dynamic>((request, response) async {
      setAuthHeaders();
      // if (response.statusCode == 401 || response.statusCode == 403) {
      //   print(maxConcurrentRequests);
      //   if (currentRequestCount >= maxConcurrentRequests) {
      //     await Future.delayed(Duration(seconds: 10));
      //     return await _retry(request);
      //   } else {
      //     request.headers.remove('Authorization');
      //     print(response.statusCode);
      //     await Get.find<AuthController>()
      //         .refreshToken(request.url.path.toString());
      //     setAuthHeaders();
      //     _mainHeaders['Authorization'] = 'Bearer $token';
      //     request.headers.addAll(_mainHeaders);
      //     request.headers['Authorization'] = 'Bearer $token';
      //     currentRequestCount++;
      //     return await _retry(request);
      //   }
      // } else {
      return response;
      // }
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

  @override
  void onInit() {
    setAuthHeaders();
    super.onInit();
  }
  
  DataBaseController db = Get.find();
  
  Future<void> setAuthHeaders() async {
    if (db != null) {
      var getU = await db.getToken();
      token = getU['access_token'];
    }
  }

  Future<Response> getCollections(url) async {
    return get(url);
  }

  Future<Response> getCollectionsP(url, data) async {
    return post(url.toString(), data);
  }

  Future<Response> postData(url, data) async {
    return post(url.toString(), data);
  }

  Future<Response> patchData(url, data) async {
    return patch(url.toString(), data);
  }
}
