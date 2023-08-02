class KualitasAir {
  final String id;
  final String tanggalPengukuran;
  final String jamPengukuran;
  final double suhu;
  final double dO;
  final double sal;
  final double ph;
  final double kecerahan;
  KualitasAir({
    required this.id,
    required this.tanggalPengukuran,
    required this.jamPengukuran,
    required this.suhu,
    required this.dO,
    required this.sal,
    required this.ph,
    required this.kecerahan,
  });

  static KualitasAir? fromJson(dynamic json){
    if (json != null) {
      return KualitasAir(
        id: json['id'],
        tanggalPengukuran: json['tanggal_pengukuran'],
        jamPengukuran: json['jam_pengukuran'],
        suhu: json['suhu'].toDouble(),
        dO: json['do'].toDouble(),
        sal: json['sal'].toDouble(),
        ph: json['ph'].toDouble(),
        kecerahan: json['kecerahan'].toDouble(),
      );
    }
    else {
      return null;
    }
  }
}
