import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_fishery/models/belajar_model.dart';

class BelajarService {
  String baseUrl = 'http://api.smartfishery.me/api/auth';

  Future<List<BelajarModel>> getListBudidaya(String token) async {
    var url = '$baseUrl/event';
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
      List<BelajarModel> belajars = [];

      for (var item in data) {
        belajars.add(BelajarModel.fromJson(item));
      }
      return belajars;
    } else {
      throw Exception('Failed to get Belajar Budidaya!');
    }
  }
}
