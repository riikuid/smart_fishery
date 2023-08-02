import 'package:common/data/ApiResponseProcessor.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_lihat_detail_kolam/data/api_client/edit_kualitas_air_api_client.dart';
import 'package:fitur_lihat_detail_kolam/domain/repository/i_edit_kualitas_air_repository.dart';

class EditKualitasAirRepositoryImpl implements IEditKualitasAirRepository {
  final apiClient = EditKualitasAirApiClient();
  @override
  Future<ApiResponse> deleteKualitasAir(String idKualitasAir) {
    return ApiRequestProcessor.proceed(
      getResponse: (authHeaders){
        return apiClient.deleteKualitasAir(
          authHeaders: authHeaders,
          idKualitasAir: idKualitasAir
        );
      },
      preferredStatusCode: 200
    );
  }

}