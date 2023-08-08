import 'package:common/constant/api_url.dart';
import 'package:common/domain/use_case/format_bearer_use_case.dart';
import 'package:dependencies/http.dart';

class LihatDetailKolamApiClient {
  final _baseLihatDetailKolamUrl = "${ApiUrl.baseApiUrl}/detail/kolam";
  final _bearerFormatter = FormatBearerUseCase();

  Future<Response> getDetailKolam({
    required String token,
    required String idKolam,
  }) {
    return post(Uri.parse(_baseLihatDetailKolamUrl),
        headers: _bearerFormatter.format(token), body: {"id_kolam": idKolam});
  }
}
