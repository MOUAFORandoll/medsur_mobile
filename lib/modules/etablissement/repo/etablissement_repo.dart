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

  Future<Response> newEtablissement(data, formData) async {
    // try {
    Response response = await apiClientAlerte.postData(
        ApiRoutesEtablissement.end_etablissement, data);
    print(response.body['data']);
    Response response2 = await this
        .uploadLogoEtablissement(response.body['data']['id'], formData);

    return response;
  }

  Future<Response> uploadLogoEtablissement(etablissement_id, formData) async {
    Response response = await apiClientAlerte.postData(
        ApiRoutesEtablissement.end_etablissement +
            '/${etablissement_id.toString()}/store_image',
        formData);

    return response;
  }

  Future<Response> updateEtablissement(etablissement_id, data) async {
    // try {
    Response response = await apiClientAlerte.patchData(
        ApiRoutesEtablissement.end_etablissement +
            '/${etablissement_id.toString()}/update',
        data);
    return response;
  }

  Future<Response> getEtablissementForuser(user_id) async {
    Response response = await apiClientAlerte.getCollections(
        ApiRoutesEtablissement.end_etablissement +
            '/user/' +
            user_id.toString());

    return response;
  }

  Future<Response> getAlertList(etablissement_id) async {
    Response response = await apiClientAlerte.getCollections(
        ApiRoutesEtablissement.end_etablissement +
            '/${etablissement_id.toString()}/alerte');

    return response;
  }

  Future<Response> removeSpecialiteEtablissement(
      etablissement_id, specialite_id) async {
    Response response = await apiClientAlerte.patchData(
        ApiRoutesEtablissement.end_etablissement +
            '/${etablissement_id.toString()}/speciality/remove',
        {'specialite_id': specialite_id});

    return response;
  }

  Future<Response> addSpecialiteEtablissement(
      etablissement_id, specialite_id) async {
    Response response = await apiClientAlerte.patchData(
        ApiRoutesEtablissement.end_etablissement +
            '/${etablissement_id.toString()}/speciality/add',
        {'specialite_id': specialite_id});

    return response;
  }

  Future<Response> updateAgendaEtablissement(agenda_id, data) async {
    Response response = await apiClientAlerte.patchData(
        ApiRoutesEtablissement.end_etablissement +
            '/${agenda_id.toString()}/agenda/update',
        data);

    return response;
  }

  Future<Response> sendMailAsActivation(etablissement_id) async {
    Response response = await apiClientAlerte.getCollections(
        ApiRoutesEtablissement.end_etablissement +
            '/${etablissement_id.toString()}/mail');

    return response;
  }
}
