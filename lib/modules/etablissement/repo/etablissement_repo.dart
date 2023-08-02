import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:medsur_app/modules/alerte/constant/apiRouteAlerte.dart';
import 'package:medsur_app/modules/etablissement/constant/api_route_etablissement.dart';
import 'package:medsur_app/utils/ApiClient.dart';
import 'package:medsur_app/constants/apiRoute.dart';
import 'package:medsur_app/utils/ApiClientAlerte.dart';

class EtablissementRepo extends GetxService {
  final ApiClient apiClient;
  final ApiClientAlerte apiClientAlerte;
  EtablissementRepo({required this.apiClient, required this.apiClientAlerte});

  Future<Response> getSpeciality() async {
    Response response = await apiClientAlerte.getCollections(
      ApiRoutesEtablissement.listspecialite,
    );

    return response;
  }

  Future<Response> newEtablissement(data) async {
    // try {
    Response response = await apiClientAlerte.postData(
        ApiRoutesEtablissement.end_etablissement, data);

    return response;
  }

  Future<Response> getEtablissementForuser(user_id) async {
    Response response = await apiClientAlerte.getCollections(
        ApiRoutesEtablissement.end_etablissement +
            '?user_id=' +
            user_id.toString());

    return response;
  }
}
