import 'package:common/constant/api_url.dart';
import 'package:common/domain/model/panen.dart';
import 'package:common/domain/use_case/format_bearer_use_case.dart';
import 'package:dependencies/http.dart';
import 'package:flutter/material.dart';

class InputPanenApiClient {
  final _baseUrl = "${ApiUrl.baseApiUrl}/panen";
  final _bearerFormatter = FormatBearerUseCase();

  Future<Response> submitData({
    required String token,
    required Panen data,
    required String idKolam,
  }) {
    Uri.parse(_baseUrl);
    _bearerFormatter.format(token);
    debugPrint("masuk api client");
    return post(Uri.parse(_baseUrl),
        headers: _bearerFormatter.format(token),
        body: {
          "total_berat": data.totalBerat.toString(),
          "size_udang": data.sizeUdang.toString(),
          "jenis_panen": data.jenisPanen,
          "harga_perkilo": data.hargaPerKilo.toString(),
          "total_harga": data.totalHarga.toString(),
          "note_pembeli": "",
          "id_kolam": idKolam,
        });
  }
}
