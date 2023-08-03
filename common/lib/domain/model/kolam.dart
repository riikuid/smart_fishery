import 'package:common/domain/model/kualitas_air.dart';

class Kolam {
  final String id;
  final String namaKolam;
  final double lebarKolam;
  final double panjangKolam;
  final double kedalamanKolam;
  final int totalTebar;
  final String tanggalTebar;
  final int umurAwal;
  final int lamaPersiapan;
  final String tipeTotalTebar;
  final DateTime updateTerakhir;
  final KualitasAir? lastKualitasAir;
  Kolam({
    required this.id,
    required this.namaKolam,
    required this.lebarKolam,
    required this.panjangKolam,
    required this.kedalamanKolam,
    required this.totalTebar,
    required this.tanggalTebar,
    required this.umurAwal,
    required this.lamaPersiapan,
    required this.tipeTotalTebar,
    required this.updateTerakhir,
    required this.lastKualitasAir,
  });

  factory Kolam.fromJson(Map<String, dynamic> json) {
    return Kolam(
      id: json['id'],
      namaKolam: json['nama_kolam'],
      lebarKolam: json['lebar_kolam'].toDouble(),
      panjangKolam: json['panjang_kolam'].toDouble(),
      kedalamanKolam: json['kedalaman_kolam'].toDouble(),
      totalTebar: json['total_tebar'],
      tanggalTebar: json['tanggal_tebar'],
      umurAwal: json['umur_awal'],
      lamaPersiapan: json['lama_persiapan'],
      tipeTotalTebar: json['tipe_total_tebar'],
      updateTerakhir: DateTime.parse(json['updated_at']),
      lastKualitasAir: KualitasAir.fromJson(json['kualitas_air_detail']),
    );
  }

  Map<String , String> toJson(){
    return {
      "id" : id,
      "nama_kolam" : namaKolam,
      "lebar_kolam" : lebarKolam.toString(),
      "panjang_kolam" : panjangKolam.toString(),
      "kedalaman_kolam" : kedalamanKolam.toString(),
      "total_tebar" : totalTebar.toString(),
      "tanggal_tebar" : tanggalTebar.toString(),
      "umur_awal" : umurAwal.toString(),
      "lama_persiapan" : lamaPersiapan.toString(),
      "tipe_total_tebar" : tipeTotalTebar.toString(),
    };
  }
}
