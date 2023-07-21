import 'package:common/domain/model/kualitas_air.dart';
import 'package:common/domain/model/panen.dart';
import 'package:common/domain/model/penyakit.dart';
import 'package:common/domain/model/sampling.dart';
import 'package:common/domain/repository/i_panen_repository.dart';
import 'package:common/response/response.dart';
import 'package:common/domain/model/kolam.dart';


class FakeDetailRepository implements IPanenRepository{
  @override
  Future<Response> getKolam(int id) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return ApiResponseSuccess(
      data: _fakeKolam
    );
  }

  final _fakeKolam = Kolam(
    listKualitasAir: [
      KualitasAir(tanggal: "12 Desember 2012", suhu: 34.5, dO: 12.5, sal: 26.7, ph: 8, orp: 95.1),
      KualitasAir(tanggal: "12 Desember 2012", suhu: 34.5, dO: 12.5, sal: 26.7, ph: 8, orp: 95.1),
      KualitasAir(tanggal: "12 Desember 2012", suhu: 34.5, dO: 12.5, sal: 26.7, ph: 8, orp: 95.1),
      KualitasAir(tanggal: "12 Desember 2012", suhu: 34.5, dO: 12.5, sal: 26.7, ph: 8, orp: 95.1),
      KualitasAir(tanggal: "12 Desember 2012", suhu: 34.5, dO: 12.5, sal: 26.7, ph: 8, orp: 95.1),
    ],
    listPanen: [
      Panen(tanggal: "11 November 2011", berat: 24, size: 3, jenis: "Udang"),
      Panen(tanggal: "11 November 2011", berat: 24, size: 3, jenis: "Udang"),
    ],
    listPenyakit: [
      Penyakit(nama: "Cacar air", tanggal: "1 Januari 2001"),
      Penyakit(nama: "Cacar air", tanggal: "1 Januari 2001"),
      Penyakit(nama: "Cacar air", tanggal: "1 Januari 2001"),
      Penyakit(nama: "Cacar air", tanggal: "1 Januari 2001"),
      Penyakit(nama: "Cacar air", tanggal: "1 Januari 2001"),
    ],
    listSampling: [
      Sampling(tanggal: "2 Februari 2022", mbw: 24.1),
      Sampling(tanggal: "2 Februari 2022", mbw: 24.1),
      Sampling(tanggal: "2 Februari 2022", mbw: 24.1),
    ],
  );
}