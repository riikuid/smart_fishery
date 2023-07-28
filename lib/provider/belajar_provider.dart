import 'package:flutter/material.dart';
import 'package:smart_fishery/models/belajar_model.dart';
import 'package:smart_fishery/services/belajar_services.dart';

class BelajarProvider with ChangeNotifier {
  List<BelajarModel> _belajars = [];
  List<BelajarModel> get belajars => _belajars;

  set belajars(List<BelajarModel> belajars) {
    _belajars = belajars;
    notifyListeners();
  }

  Future<void> getListBudidayaBelajars(String token) async {
    try {
      List<BelajarModel> belajars =
          await BelajarService().getListBudidaya(token);
      _belajars = belajars;
    } catch (e) {
      print(e);
    }
  }
}
