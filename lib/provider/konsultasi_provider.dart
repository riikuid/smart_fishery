import 'package:common/data/repository/token_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/models/konsultasi_model.dart';
import 'package:smart_fishery/services/konsultasi_services.dart';

class KonsultasiProvider with ChangeNotifier {
  List<KonsultasiModel> _konsultasi = [];
  List<KonsultasiModel> get konsultasi => _konsultasi;

  set konsultasi(List<KonsultasiModel> konsultasi) {
    _konsultasi = konsultasi;
    notifyListeners();
  }

  Future<void> getKonsultasi(String token) async {
    try {
      List<KonsultasiModel> konsultasi =
          await KonsultasiService().getKonsultasi(token);
      _konsultasi = konsultasi;
    } catch (e) {
      print(e);
    }
  }
}
