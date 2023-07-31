class KualitasAir {
  final String tanggal;
  final double suhu;
  final double dO;
  final double sal;
  final double ph;
  final double kecerahan;
  KualitasAir({
    required this.tanggal,
    required this.suhu,
    required this.dO,
    required this.sal,
    required this.ph,
    required this.kecerahan,
  });

  factory KualitasAir.fromJson(Map<String , dynamic> json){
    return KualitasAir(
      tanggal: json['created_at'],
      suhu: json['suhu'].toDouble(),
      dO: json['do'].toDouble(),
      sal: json['sal'].toDouble(),
      ph: json['ph'].toDouble(),
      kecerahan: json['kecerahan'].toDouble(),
    );
  }
}
