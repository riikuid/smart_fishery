import 'package:common/constant/api_url.dart';
import 'package:common/domain/use_case/format_bearer_use_case.dart';
import 'package:http/http.dart';

class KolamApiClient {
  final _bearerFormatter = FormatBearerUseCase();
  final _baseUrl = "${ApiUrl.baseApiUrl}/kolam";

  String _getDeleteUrl(String idKolam) =>
    "$_baseUrl/$idKolam";

  Future<Response> deleteKolam({
    required String idKolam,
    required String token
  }){
    return delete(
      Uri.parse(_getDeleteUrl(idKolam)),
      headers: _bearerFormatter.format(token),
    );
  }
}