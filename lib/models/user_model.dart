class UserModel {
  late String id;
  late String fullName;
  late int noHp;
  late String token;

  UserModel({
    required this.id,
    required this.fullName,
    required this.noHp,
    required this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    noHp = json['no_hp'];
    token = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'no_hp': noHp,
      'refresh_token': token,
    };
  }
}
