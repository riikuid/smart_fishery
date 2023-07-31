import 'package:common/constant/api_url.dart';
import 'package:common/domain/use_case/format_bearer_use_case.dart';
import 'package:http/http.dart';

class MonitoringApiClient{
  static const _baseTambakUrl = "${ApiUrl.baseApiUrl}/tambak";
  static const _baseKolamUrl = "${ApiUrl.baseApiUrl}/monitoring";
  final _bearerFormatter = FormatBearerUseCase();

  Future<Response> getTambak(String token){
    return get(
      Uri.parse(_baseTambakUrl),
      headers: _bearerFormatter.format(token),
    );
  }

  Future<Response> getKolam(String token , String idTambak){
    return post(
      Uri.parse(_baseKolamUrl),
      body: {
        "id_tambaks" : idTambak
      },
      headers: _bearerFormatter.format(token),
    );
  }
}