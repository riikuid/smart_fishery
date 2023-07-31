import 'package:common/constant/api_url.dart';
import 'package:common/domain/model/kualitas_air.dart';
import 'package:common/domain/use_case/format_bearer_use_case.dart';
import 'package:dependencies/http.dart';
import 'package:flutter/material.dart';
class InputKualitasAirApiClient {
  final _baseUrl = "${ApiUrl.baseApiUrl}/kualitas-air";
  final _bearerFormatter = FormatBearerUseCase();

  Future<Response> submitData({
    required String token,
    required KualitasAir data,
    required String idKolam,
  }){
    Uri.parse(_baseUrl);
    _bearerFormatter.format(token);
    debugPrint("masuk api client");
    return post(
      Uri.parse(_baseUrl),
      headers: _bearerFormatter.format(token),
      body: {
        "suhu" : data.suhu.toString(),
        "sal" : data.sal.toString(),
        "ph" : data.ph.toString(),
        "kecerahan" : data.kecerahan.toString(),
        "do" : data.dO.toString(),
        "tanggal_pengukuran" : data.tanggalPengukuran,
        "jam_pengukuran" : data.jamPengukuran,
        "id_kolam" : idKolam,
      }
    );
  }
}