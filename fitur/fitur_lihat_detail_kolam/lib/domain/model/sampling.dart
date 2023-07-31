class Sampling{
  final String tanggal;
  final double mbw;
  final double fr;
  final int isHealthy;
  Sampling({
    required this.tanggal,
    required this.mbw,
    required this.fr,
    required this.isHealthy,
  });

  factory Sampling.fromJson(Map<String , dynamic> json){
    return Sampling(
      tanggal: json['created_at'],
      mbw: json['mbw_sampling'].toDouble(),
      fr: json['fr_sampling'].toDouble(),
      isHealthy: json['is_shirimp']
    );
  }
}