import 'package:common/data/ApiResponseProcessor.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_lihat_detail_kolam/data/api_client/edit_panen_api_client.dart';
import 'package:fitur_lihat_detail_kolam/domain/repository/i_edit_panen_repository.dart';

class EditPanenRepositoryImpl implements IEditPanenRepository {
  final apiClient = EditPanenApiClient();
  @override
  Future<ApiResponse> deletePanen(String idPanen) {
    return ApiRequestProcessor.proceed(
        getResponse: (authHeaders) {
          return apiClient.deletePanen(
              authHeaders: authHeaders, idPanen: idPanen);
        },
        preferredStatusCode: 200);
  }
}
