import 'package:common/data/repository/token_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/models/suhu_model.dart';
import 'package:smart_fishery/models/user_model.dart';
import 'package:smart_fishery/services/auth_services.dart';
import 'package:smart_fishery/services/suhu_services.dart';

class SuhuProvider with ChangeNotifier {
  final tokenManager = TokenRepositoryImpl();

  SuhuModel? _suhu;
  SuhuModel get suhu => _suhu!;

  set suhu(SuhuModel suhu) {
    _suhu = suhu;
    notifyListeners();
  }

  Future<void> getSuhu() async {
    try {
      SuhuModel suhu =
          await SuhuService().getSuhu();
      _suhu = suhu;
    } catch (e) {
      print(e);
    }
  }
}