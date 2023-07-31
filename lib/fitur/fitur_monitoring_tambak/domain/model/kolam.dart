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
    );
  }
}
