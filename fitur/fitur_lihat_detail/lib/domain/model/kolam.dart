import 'package:fitur_lihat_detail/domain/model/kualitas_air.dart';
import 'package:fitur_lihat_detail/domain/model/panen.dart';
import 'package:fitur_lihat_detail/domain/model/penyakit.dart';
import 'package:fitur_lihat_detail/domain/model/sampling.dart';


class Kolam{
  List<KualitasAir> listKualitasAir;
  List<Panen> listPanen;
  List<Penyakit> listPenyakit;
  List<Sampling> listSampling;
  Kolam({
    required this.listKualitasAir,
    required this.listPanen,
    required this.listPenyakit,
    required this.listSampling,
  });
}