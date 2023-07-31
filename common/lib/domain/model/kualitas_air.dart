class KualitasAir {
  final String tanggalPengukuran;
  final String jamPengukuran;
  final double suhu;
  final double dO;
  final double sal;
  final double ph;
  final double kecerahan;
  KualitasAir({
    required this.tanggalPengukuran,
    required this.jamPengukuran,
    required this.suhu,
    required this.dO,
    required this.sal,
    required this.ph,
    required this.kecerahan,
  });

  factory KualitasAir.fromJson(Map<String , dynamic> json){
    return KualitasAir(
      tanggalPengukuran: json['tanggal_pengukuran'],
      jamPengukuran: json['jam_pengukuran'],
      suhu: json['suhu'].toDouble(),
      dO: json['do'].toDouble(),
      sal: json['sal'].toDouble(),
      ph: json['ph'].toDouble(),
      kecerahan: json['kecerahan'].toDouble(),
    );
  }
}