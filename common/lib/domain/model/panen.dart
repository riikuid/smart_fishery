class Panen {
  final String id;
  final DateTime tanggal;
  final double totalBerat;
  final int sizeUdang;
  final String jenisPanen;
  final int hargaPerKilo;
  final int totalHarga;

  Panen({
    required this.id,
    required this.tanggal,
    required this.totalBerat,
    required this.sizeUdang,
    required this.jenisPanen,
    required this.hargaPerKilo,
    required this.totalHarga,
  });

  factory Panen.fromJson(Map<String, dynamic> json) {
    // debugPrint("created_at ${json['created_at']}");
    // debugPrint("total_berat ${json['total_berat']}");
    // debugPrint("size_udang ${json['size_udang']}");
    // debugPrint('jenis_panen ${json['jenis_panen']}');
    // debugPrint('harga_perKilo ')
    return Panen(
      id: json['id'],
      tanggal: DateTime.parse(json['created_at']),
      totalBerat: json['total_berat'].toDouble(),
      sizeUdang: json['size_udang'],
      jenisPanen: json['jenis_panen'],
      hargaPerKilo: json['harga_perkilo'],
      totalHarga: json['total_harga'],
    );
  }
}
