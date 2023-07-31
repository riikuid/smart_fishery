import 'package:common/constant/api_url.dart';
import 'package:common/domain/use_case/format_bearer_use_case.dart';
import 'package:dependencies/http.dart';

class BuatKolamApiClient {
  final _bearerFormatter = FormatBearerUseCase();
  final _buatKolamUrl = "${ApiUrl.baseApiUrl}/kolam";

  Future<Response> buatKolam({
    required String token,
    required String idTambak,
    required String namaKolam,
    required String panjangKolam,
    required String lebarKolam,
    required String kedalamanKolam,
    required String tanggalTebar,
    required String totalTebar,
    required String tipeTotalTebar,
    required String umurAwal,
    required String lamaPersiapan,
  }) {
    return post(Uri.parse(_buatKolamUrl),
        headers: _bearerFormatter.format(token),
        body: {
          'id_tambak': idTambak,
          'nama_kolam': namaKolam,
          'panjang_kolam': panjangKolam,
          'lebar_kolam': lebarKolam,
          'kedalaman_kolam': kedalamanKolam,
          'tanggal_tebar': tanggalTebar,
          'total_tebar': totalTebar,
          'tipe_total_tebar': tipeTotalTebar,
          'umur_awal': umurAwal,
          'lama_persiapan': lamaPersiapan,
        });
  }
}
