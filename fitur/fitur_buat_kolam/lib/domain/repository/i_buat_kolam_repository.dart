import 'package:common/domain/model/kolam.dart';
import 'package:common/response/api_response.dart';

abstract class IBuatKolamRepository {
  Future<ApiResponse> buatKolam({
    required String idTambak,
    required Kolam kolam,
    // String namaKolam,
    // String panjangKolam,
    // String lebarKolam,
    // String kedalamanKolam,
    // String tanggalTebar,
    // String totalTebar,
    // String tipeTotalTebar,
    // String umurAwal,
    // String lamaPersiapan,
  });

  Future<ApiResponse> editKolam({
    required Kolam kolam,
  });
}
