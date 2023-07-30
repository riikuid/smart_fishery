import 'package:common/data/repository/token_repository_impl.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_buat_tambak/data/api_client/buat_tambak_api_client.dart';
import 'package:fitur_buat_tambak/domain/repository/i_buat_tambak_repository.dart';

class BuatTambakRepositoryImpl implements IBuatTambakRepository{
  final tokenManager = TokenRepositoryImpl();
  final apiClient = BuatTambakApiClient();

  @override
  Future<ApiResponse> buatTambak(String namaTambak) async {
    try {
      final response = await apiClient.buatTambak(
        namaTambak: namaTambak,
        token: (await tokenManager.getToken())!,
      );

      if (response.statusCode == 201){
        return ApiResponseSuccess();
      }
      else {
        return ApiResponseFailed(
          errorMessage: response.body,
        );
      }
    } catch (e) {
      return ApiResponseFailed(
        errorMessage: "Gagal tersambung ke server",
      );
    }
  }

}