import 'package:common/domain/model/kualitas_air.dart';
import 'package:common/domain/model/panen.dart';
import 'package:common/domain/model/penyakit_kolam.dart';
import 'package:common/domain/model/sampling.dart';

class DetailKolam {
  List<KualitasAir> listKualitasAir;
  List<Panen> listPanen;
  List<PenyakitKolam> listPenyakit;
  List<Sampling> listSampling;
  DetailKolam({
    required this.listKualitasAir,
    required this.listPanen,
    required this.listPenyakit,
    required this.listSampling,
  });
}
