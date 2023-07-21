


import 'package:common/domain/model/kualitas_air.dart';
import 'package:common/domain/model/panen.dart';
import 'package:common/domain/model/penyakit.dart';
import 'package:common/domain/model/sampling.dart';

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