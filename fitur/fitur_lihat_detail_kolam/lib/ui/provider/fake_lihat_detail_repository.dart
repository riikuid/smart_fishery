import 'package:common/response/api_response.dart';
import 'package:fitur_lihat_detail_kolam/domain/model/detail_kolam.dart';
import 'package:fitur_lihat_detail_kolam/domain/model/kualitas_air.dart';
import 'package:fitur_lihat_detail_kolam/domain/model/panen.dart';
import 'package:fitur_lihat_detail_kolam/domain/model/penyakit.dart';
import 'package:fitur_lihat_detail_kolam/domain/model/sampling.dart';
import 'package:fitur_lihat_detail_kolam/domain/repository/i_lihat_detail_kolam_repository.dart';

class FakeLihatDetailRepository implements ILihatDetailKolamRepository {
  @override
  Future<ApiResponse> getKolam(String idKolam) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return ApiResponseSuccess(data: _fakeKolam);
  }

  final _fakeKolam = DetailKolam(
    listKualitasAir: [
      KualitasAir(
          tanggal: "Sabtu, 12 Desember 2012",
          suhu: 34.5,
          dO: 12.5,
          sal: 26.7,
          ph: 8,
          kecerahan: 95.1),
      KualitasAir(
          tanggal: "Sabtu, 12 Desember 2012",
          suhu: 34.5,
          dO: 12.5,
          sal: 26.7,
          ph: 8,
          kecerahan: 95.1),
      KualitasAir(
          tanggal: "Sabtu, 12 Desember 2012",
          suhu: 34.5,
          dO: 12.5,
          sal: 26.7,
          ph: 8,
          kecerahan: 95.1),
      KualitasAir(
          tanggal: "Sabtu, 12 Desember 2012",
          suhu: 34.5,
          dO: 12.5,
          sal: 26.7,
          ph: 8,
          kecerahan: 95.1),
      KualitasAir(
          tanggal: "Sabtu, 12 Desember 2012",
          suhu: 34.5,
          dO: 12.5,
          sal: 26.7,
          ph: 8,
          kecerahan: 95.1),
    ],
    listPanen: [
      Panen(
        tanggal: "11 November 2011",
        totalBerat: 24,
        sizeUdang: 3,
        jenisPanen: "Udang",
        hargaPerKilo: 1000000,
        totalHarga: 500000,
      ),
      Panen(
        tanggal: "11 November 2011",
        totalBerat: 24,
        sizeUdang: 3,
        jenisPanen: "Udang",
        hargaPerKilo: 1000000,
        totalHarga: 500000,
      ),
    ],
    listPenyakit: [
      Penyakit(nama: "Cacar air", tanggal: "1 Januari 2001"),
      Penyakit(nama: "Cacar air", tanggal: "1 Januari 2001"),
      Penyakit(nama: "Cacar air", tanggal: "1 Januari 2001"),
      Penyakit(nama: "Cacar air", tanggal: "1 Januari 2001"),
      Penyakit(nama: "Cacar air", tanggal: "1 Januari 2001"),
    ],
    listSampling: [
      Sampling(
        tanggal: "2 Februari 2022",
        mbw: 24.1,
        fr: 12,
        isHealthy: 1,
      ),
      Sampling(
        tanggal: "2 Februari 2022",
        mbw: 24.1,
        fr: 12,
        isHealthy: 1,
      ),
      Sampling(
        tanggal: "2 Februari 2022",
        mbw: 24.1,
        fr: 12,
        isHealthy: 1,
      ),
    ],
  );
}
