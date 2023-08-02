import 'package:common/constant/api_url.dart';
import 'package:dependencies/http.dart';

class EditKualitasAirApiClient {
  String _getUrlById(String idKualitasAir) =>
    "${ApiUrl.baseApiUrl}/kualitas-air/$idKualitasAir";

  Future<Response> deleteKualitasAir({
    required Map<String , String> authHeaders,
    required idKualitasAir,
  }){
    return delete(
      Uri.parse(_getUrlById(idKualitasAir)),
      headers: authHeaders,
    );
  }
}