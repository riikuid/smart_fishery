import 'package:common/data/repository/token_repository_impl.dart';
import 'package:common/domain/model/kolam.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_buat_kolam/data/api_client/buat_kolam_api_client.dart';
import 'package:fitur_buat_kolam/domain/repository/i_buat_kolam_repository.dart';

class BuatKolamRepositoryImpl implements IBuatKolamRepository {
  final tokenManager = TokenRepositoryImpl();
  final apiClient = BuatKolamApiClient();

  @override
  Future<ApiResponse> buatKolam({
    required String idTambak,
    required Kolam kolam,
  }) async {
    try {
      final response = await apiClient.buatKolam(
        idTambak: idTambak,
        kolam: kolam,
        token: (await tokenManager.getToken())!,
      );

      if (response.statusCode == 201) {
        return ApiResponseSuccess();
      } else {
        return ApiResponseFailed(
          errorMessage: response.body,
        );
      }
    } catch (e) {
      return ApiResponseFailed(
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse> editKolam({required Kolam kolam}) async {
    try {
      final response = await apiClient.editKolam(
        token: (await tokenManager.getToken())!,
        kolam: kolam
      );

      if (response.statusCode == 200){
        return ApiResponseSuccess();
      } else {
        return ApiResponseFailed(
          errorMessage: response.body,
          errorCode: response.statusCode
        );
      }
    } catch (e) {
      return ApiResponseFailed(
        errorMessage: e.toString()
      );
    }
  }
}
