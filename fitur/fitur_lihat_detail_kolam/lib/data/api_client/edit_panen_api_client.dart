import 'package:common/constant/api_url.dart';
import 'package:dependencies/http.dart';

class EditPanenApiClient {
  String _getUrlById(String idPanen) => "${ApiUrl.baseApiUrl}/panen/$idPanen";

  Future<Response> deletePanen({
    required Map<String, String> authHeaders,
    required idPanen,
  }) {
    return delete(
      Uri.parse(_getUrlById(idPanen)),
      headers: authHeaders,
    );
  }
}
