class KonsultasiModel {
  late String nomorWA;
  late String email;

  KonsultasiModel({
    required this.nomorWA,
    required this.email,
  });

  KonsultasiModel.fromJson(Map<String, dynamic> json) {
    nomorWA = json['nomor_whatsapp'];
    email = json['email'];
  }
}
