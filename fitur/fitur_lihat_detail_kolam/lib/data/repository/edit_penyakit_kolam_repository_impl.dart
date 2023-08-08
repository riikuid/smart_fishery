import 'package:common/data/ApiResponseProcessor.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_lihat_detail_kolam/data/api_client/edit_penyakit_kolam_api.dart';
import 'package:fitur_lihat_detail_kolam/domain/repository/i_edit_penyakit_kolam_repository.dart';

class EditPenyakitKolamRepositoryImpl implements IEditPenyakitKolamRepository {
  final apiClient = EditPenyakitKolamApiClient();
  @override
  Future<ApiResponse> deletePenyakitKolam(String idPenyakitKolam) {
    return ApiRequestProcessor.proceed(
        getResponse: (authHeaders) {
          return apiClient.deletePenyakitKolam(
              authHeaders: authHeaders, idPenyakitKolam: idPenyakitKolam);
        },
        preferredStatusCode: 200);
  }
}
