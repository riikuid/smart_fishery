class Sampling {
  final String id;
  final DateTime tanggal;
  final double mbw;
  final double fr;
  final String kondisiUdang;
  Sampling({
    required this.id,
    required this.tanggal,
    required this.mbw,
    required this.fr,
    required this.kondisiUdang,
  });

  factory Sampling.fromJson(Map<String, dynamic> json) {
    return Sampling(
      id: json['id'],
      tanggal: DateTime.parse(json['created_at']),
      mbw: json['mbw_sampling'].toDouble(),
      fr: json['fr_sampling'].toDouble(),
      kondisiUdang: json['kondisi_udang'],
    );
  }
}
