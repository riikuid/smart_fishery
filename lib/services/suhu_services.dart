import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_fishery/models/suhu_model.dart';

class SuhuService {
  String baseUrl = 'http://api.smartfishery.me/api/auth';

  Future<SuhuModel> getSuhu() async {
    var url = '$baseUrl/suhu';
    var headers = {
      'Content-Type': 'application/json',
      
    };
    // var authorization = {'Token': '$token'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      SuhuModel suhu = SuhuModel.fromJson(data);
      return suhu;
    } else {
      throw Exception('Failed to get suhu!');
    }
  }
}
