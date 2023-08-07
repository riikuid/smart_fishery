import 'package:common/data/ApiResponseProcessor.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_lihat_detail_kolam/data/api_client/edit_sampling_api_client.dart';
import 'package:fitur_lihat_detail_kolam/domain/repository/i_edit_sampling_repository.dart';

class EditSamplingRepositoryImpl implements IEditSamplingRepository {
  final apiClient = EditSamplingApiClient();
  @override
  Future<ApiResponse> deleteSampling(String idSampling) {
    return ApiRequestProcessor.proceed(
        getResponse: (authHeaders) {
          return apiClient.deleteSampling(
              authHeaders: authHeaders, idSampling: idSampling);
        },
        preferredStatusCode: 200);
  }
}
