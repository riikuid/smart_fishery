import 'dart:convert';

import 'package:smart_fishery/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://api.smartfishery.me/api/auth';

  Future<UserModel> register({
    String? fullName,
    String? noHp,
    String? password,
    String? konfirmasiPassword,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'full_name': fullName,
      'no_hp': noHp,
      'password': password,
      'konfirmasi_password': konfirmasiPassword,
    });
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      if (data['refresh_token'] != null) {
        user.token = '${data['refresh_token']}';
      } else {
        user.token = 'Invalid Token';
      }
      return user;
    } else {
      throw Exception('Failed to register user.');
    }
  }

  Future<UserModel> login({
    String? noHp,
    String? password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({'no_hp': noHp, 'password': password});
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      if (data['refresh_token'] != null) {
        user.token = '${data['refresh_token']}';
      } else {
        user.token = 'Invalid Token';
      }

      return user;
    } else {
      throw Exception('Failed to login.');
    }
  }

  Future<UserModel> getProfile({
    String? token,
  }) async {
    var url = '$baseUrl/profile';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token},'
    };
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      if (data['refresh_token'] != null) {
        user.token = '${data['refresh_token']}';
      } else {
        user.token = 'Invalid Token';
      }

      return user;
    } else {
      throw Exception('Failed to login.');
    }
  }

  Future<void> logout({String? token}) async {
    var url = '$baseUrl/logout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.post(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      print('Success logout');
    } else {
      throw Exception('Failed to logout user.');
    }
  }
}
