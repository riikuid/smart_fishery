import 'package:common/data/repository/token_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/models/user_model.dart';
import 'package:smart_fishery/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  final tokenManager = TokenRepositoryImpl();

  UserModel? _user;
  UserModel get user => _user!;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String? fullName,
    String? noHp,
    String? password,
    String? konfirmasiPassword,
  }) async {
    try {
      UserModel user = await AuthService().register(
        fullName: fullName,
        noHp: noHp,
        password: password,
        konfirmasiPassword: konfirmasiPassword,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({String? noHp, String? password}) async {
    try {
      UserModel user = await AuthService().login(
        noHp: noHp,
        password: password,
      );
      _user = user;
      tokenManager.putToken(user.token);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
