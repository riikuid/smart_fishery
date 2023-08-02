import 'package:common/data/repository/token_repository_impl.dart';
import 'package:common/response/api_response.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/data/api_client/kolam_api_client.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/repository/i_kolam_repository.dart';

class KolamRepositoryImpl implements IKolamRepository{
  final _tokenManager = TokenRepositoryImpl();
  final _apiClient = KolamApiClient();

  @override
  Future<ApiResponse> deleteKolam({required String idKolam}) async {
    try {
      final response = await _apiClient.deleteKolam(
        idKolam: idKolam,
        token: (await _tokenManager.getToken())!
      );

      if (response.statusCode == 200){
        return ApiResponseSuccess();
      }
      else {
        return ApiResponseFailed(
          errorMessage: response.body,
          errorCode: response.statusCode,
        );
      }
    } catch (e) {
      return ApiResponseFailed(
        errorMessage: e.toString()
      );
    }
  }
}