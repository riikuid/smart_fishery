import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_fishery/models/harga_udang_model.dart';

class HargaUdangService {
  String baseUrl = 'https://dashboard.servismo.me/api/auth';

  Future<List<HargaUdangModel>> getListHargaUdang(String token) async {
    var url = '$baseUrl/list/udang';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    // var authorization = {'Token': '$token'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<HargaUdangModel> hargaUdangs = [];

      for (var item in data) {
        hargaUdangs.add(HargaUdangModel.fromJson(item));
      }
      return hargaUdangs;
    } else {
      throw Exception('Failed to get List Harga Udang!');
    }
  }
}
