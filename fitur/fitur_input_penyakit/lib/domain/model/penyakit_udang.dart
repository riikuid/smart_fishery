class PenyakitUdang {
  final String id;
  final String namaPendek;
  final String namaPanjang;
  PenyakitUdang({
    required this.id,
    required this.namaPendek,
    required this.namaPanjang,
  });

  factory PenyakitUdang.fromJson(Map<String, dynamic> json) {
    return PenyakitUdang(
      id: json['id'],
      namaPendek: json['title_penyakit'],
      namaPanjang: json['description_penyakit'],
    );
  }
}
