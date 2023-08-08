import 'package:common/constant/api_url.dart';
import 'package:common/domain/model/penyakit_kolam.dart';
import 'package:common/domain/use_case/format_bearer_use_case.dart';
import 'package:dependencies/http.dart';
import 'package:flutter/material.dart';

class InputPenyakitKolamApiClient {
  final _baseUrl = "${ApiUrl.baseApiUrl}/penyakit-kolam";
  final _baseGetPenyakitUdangUrl = "${ApiUrl.baseApiUrl}/penyakit";
  final _bearerFormatter = FormatBearerUseCase();

  Future<Response> submitData({
    required String token,
    required PenyakitKolam data,
    required String idKolam,
  }) {
    Uri.parse(_baseUrl);
    _bearerFormatter.format(token);
    debugPrint("masuk api client");
    return post(Uri.parse(_baseUrl),
        headers: _bearerFormatter.format(token),
        body: {
          "nama_penyakit": data.namaPenyakit,
          "id_kolam": idKolam,
        });
  }

  Future<Response> getPenyakitUdang({
    required String token,
  }) {
    return get(Uri.parse(_baseGetPenyakitUdangUrl),
        headers: _bearerFormatter.format(token));
  }
}
