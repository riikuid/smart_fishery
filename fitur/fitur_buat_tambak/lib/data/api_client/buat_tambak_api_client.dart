import 'package:common/constant/api_url.dart';
import 'package:common/domain/model/tambak.dart';
import 'package:common/domain/use_case/format_bearer_use_case.dart';
import 'package:dependencies/http.dart';

class BuatTambakApiClient {
  final _bearerFormatter = FormatBearerUseCase();
  final _buatTambakUrl = "${ApiUrl.baseApiUrl}/tambak";

  Future<Response> buatTambak({
    required Tambak data,
    required String token,
  }) {
    return post(Uri.parse(_buatTambakUrl),
        headers: _bearerFormatter.format(token),
        body: {'nama_tambak': data.name});
  }
}
