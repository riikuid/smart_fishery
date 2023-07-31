import 'package:fitur_lihat_detail_kolam/domain/model/kualitas_air.dart';
import 'package:fitur_lihat_detail_kolam/domain/model/panen.dart';
import 'package:fitur_lihat_detail_kolam/domain/model/penyakit.dart';
import 'package:fitur_lihat_detail_kolam/domain/model/sampling.dart';

class DetailKolam{
  List<KualitasAir> listKualitasAir;
  List<Panen> listPanen;
  List<Penyakit> listPenyakit;
  List<Sampling> listSampling;
  DetailKolam({
    required this.listKualitasAir,
    required this.listPanen,
    required this.listPenyakit,
    required this.listSampling,
  });
}