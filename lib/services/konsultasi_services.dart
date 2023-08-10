import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_fishery/models/konsultasi_model.dart';

class KonsultasiService {
  String baseUrl = 'http://api.smartfishery.me/api/auth';

  Future<List<KonsultasiModel>> getKonsultasi(String token) async {
    var url = '$baseUrl/kontak';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<KonsultasiModel> belajars = [];

      for (var item in data) {
        belajars.add(KonsultasiModel.fromJson(item));
      }
      return belajars;
    } else {
      throw Exception('Failed to get Belajar Budidaya!');
    }
    // if (response.statusCode == 200) {
    //   var data = jsonDecode(response.body)['data'];
    //   KonsultasiModel konsultasi = KonsultasiModel.fromJson(data);
    //   return konsultasi;
    // } else {
    //   throw Exception('Failed to get kontak konsul!');
    // }
  }
}
