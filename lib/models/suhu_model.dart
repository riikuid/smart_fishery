class SuhuModel {
  late int suhu;
  late String kota;
  

  SuhuModel({
    required this.suhu,
    required this.kota,
    
  });

  SuhuModel.fromJson(Map<String, dynamic> json) {
    suhu = json['suhu'];
    kota = json['kota'];
    
  }

  
}