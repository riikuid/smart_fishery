import 'package:common/constant/api_url.dart';
import 'package:dependencies/http.dart';

class EditPenyakitKolamApiClient {
  String _getUrlById(String idPenyakitKolam) =>
      "${ApiUrl.baseApiUrl}/penyakit-kolam/$idPenyakitKolam";

  Future<Response> deletePenyakitKolam({
    required Map<String, String> authHeaders,
    required idPenyakitKolam,
  }) {
    return delete(
      Uri.parse(_getUrlById(idPenyakitKolam)),
      headers: authHeaders,
    );
  }
}
