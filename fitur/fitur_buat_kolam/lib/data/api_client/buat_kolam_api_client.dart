import 'package:common/constant/api_url.dart';
import 'package:common/domain/model/kolam.dart';
import 'package:common/domain/use_case/format_bearer_use_case.dart';
import 'package:dependencies/http.dart';

class BuatKolamApiClient {
  final _bearerFormatter = FormatBearerUseCase();
  final _buatKolamUrl = "${ApiUrl.baseApiUrl}/kolam";

  Future<Response> buatKolam({
    required String token,
    required String idTambak,
    required Kolam kolam,
  }) {
    final jsonRequest = kolam.toJson();
    jsonRequest['id_tambaks'] = idTambak;

    return post(Uri.parse(_buatKolamUrl),
        headers: _bearerFormatter.format(token),
        body: jsonRequest
    );
  }

  Future<Response> editKolam({
    required String token,
    required Kolam kolam,
  }){
    return put(
      Uri.parse(_buatKolamUrl),
      headers: _bearerFormatter.format(token),
      body: kolam.toJson()
    );
  }
}
