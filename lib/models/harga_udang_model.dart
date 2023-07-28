class HargaUdangModel {
  late String id;
  late int harga;
  late int size;
  late String provinsi;
  late String kota;

  HargaUdangModel({
    required this.id,
    required this.harga,
    required this.size,
    required this.provinsi,
    required this.kota,
  });

  HargaUdangModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    harga = json['harga'];
    size = json['size'];
    provinsi = json['provinsi'];
    kota = json['kota'];
  }
}
