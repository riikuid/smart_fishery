import 'package:common/constant/api_url.dart';
import 'package:common/domain/model/sampling.dart';
import 'package:common/domain/use_case/format_bearer_use_case.dart';
import 'package:dependencies/http.dart';
import 'package:flutter/material.dart';

class InputSamplingApiClient {
  final _baseUrl = "${ApiUrl.baseApiUrl}/sampling";
  final _bearerFormatter = FormatBearerUseCase();

  Future<Response> submitData({
    required String token,
    required Sampling data,
    required String idKolam,
  }) {
    Uri.parse(_baseUrl);
    _bearerFormatter.format(token);
    debugPrint("masuk api client");
    return post(Uri.parse(_baseUrl),
        headers: _bearerFormatter.format(token),
        body: {
          "mbw_sampling": data.mbw.toString(),
          "fr_sampling": data.fr.toString(),
          "kondisi_udang": data.kondisiUdang,
          "id_kolam": idKolam,
        });
  }
}
