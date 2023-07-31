import 'package:common/data/repository/token_repository_impl.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_buat_kolam/data/api_client/buat_kolam_api_client.dart';
import 'package:fitur_buat_kolam/domain/repository/i_buat_kolam_repository.dart';

class BuatKolamRepositoryImpl implements IBuatKolamRepository {
  final tokenManager = TokenRepositoryImpl();
  final apiClient = BuatKolamApiClient();

  @override
  Future<ApiResponse> buatKolam(
    String idTambak,
    String namaKolam,
    String panjangKolam,
    String lebarKolam,
    String kedalamanKolam,
    String tanggalTebar,
    String totalTebar,
    String tipeTotalTebar,
    String umurAwal,
    String lamaPersiapan,
  ) async {
    try {
      final response = await apiClient.buatKolam(
        idTambak: idTambak,
        namaKolam: namaKolam,
        panjangKolam: panjangKolam,
        lebarKolam: lebarKolam,
        kedalamanKolam: kedalamanKolam,
        tanggalTebar: tanggalTebar,
        totalTebar: totalTebar,
        tipeTotalTebar: tipeTotalTebar,
        umurAwal: umurAwal,
        lamaPersiapan: lamaPersiapan,
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
        errorMessage: "Gagal tersambung ke server",
      );
    }
  }
}
