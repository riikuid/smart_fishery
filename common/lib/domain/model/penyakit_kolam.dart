class PenyakitKolam {
  final String namaPenyakit;
  final String id;
  final DateTime tanggal;
  PenyakitKolam({
    required this.namaPenyakit,
    required this.id,
    required this.tanggal,
  });

  factory PenyakitKolam.fromJson(Map<String, dynamic> json) {
    return PenyakitKolam(
      id: json['id'],
      namaPenyakit: json['nama_penyakit'],
      tanggal: DateTime.parse(json['created_at']),
    );
  }
}
