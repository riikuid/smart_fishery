import 'package:common/constant/api_url.dart';
import 'package:common/domain/use_case/format_bearer_use_case.dart';
import 'package:http/http.dart';

class MonitoringApiClient{
  final _baseTambakUri = Uri.parse("${ApiUrl.baseApiUrl}/tambak");
  final _bearerFormatter = FormatBearerUseCase();

  Future<Response> getTambak(String token){
    return get(
      _baseTambakUri,
      headers: _bearerFormatter.format(token),
    );
  }
}