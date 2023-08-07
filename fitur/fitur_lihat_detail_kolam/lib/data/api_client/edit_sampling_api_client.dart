import 'package:common/constant/api_url.dart';
import 'package:dependencies/http.dart';

class EditSamplingApiClient {
  String _getUrlById(String idSampling) =>
      "${ApiUrl.baseApiUrl}/sampling/$idSampling";

  Future<Response> deleteSampling({
    required Map<String, String> authHeaders,
    required idSampling,
  }) {
    return delete(
      Uri.parse(_getUrlById(idSampling)),
      headers: authHeaders,
    );
  }
}
