import 'package:common/response/api_response.dart';

abstract class IBuatKolamRepository {
  Future<ApiResponse> buatKolam(
    String idTambak,
    String namaKolam,
    double panjangKolam,
    double lebarKolam,
    double kedalamanKolam,
    DateTime tanggalTebar,
    int totalTebar,
    String tipeTotalTebar,
    int umurAwal,
    int lamaPersiapan,
  );
}
