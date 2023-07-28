import 'package:flutter/material.dart';
import 'package:smart_fishery/models/harga_udang_model.dart';
import 'package:smart_fishery/services/harga_udang_service.dart';

class HargaUdangProvider with ChangeNotifier {
  List<HargaUdangModel> _hargaUdangs = [];
  List<HargaUdangModel> get hargaUdangs => _hargaUdangs;

  set hargaUdangs(List<HargaUdangModel> hargaUdangs) {
    _hargaUdangs = hargaUdangs;
    notifyListeners();
  }

  Future<void> getListHargaUdangs(String token) async {
    try {
      List<HargaUdangModel> hargaUdangs =
          await HargaUdangService().getListHargaUdang(token);
      _hargaUdangs = hargaUdangs;
    } catch (e) {
      print(e);
    }
  }
}
