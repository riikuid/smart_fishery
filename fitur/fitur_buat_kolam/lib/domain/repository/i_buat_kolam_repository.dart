import 'package:common/response/api_response.dart';

abstract class IBuatKolamRepository {
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
  );
}
