import 'dart:convert';

import 'package:common/data/repository/token_repository_impl.dart';
import 'package:common/domain/model/penyakit_kolam.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_input_penyakit/data/api_client/input_penyakit_api_client.dart';
import 'package:fitur_input_penyakit/domain/model/penyakit_udang.dart';
import 'package:fitur_input_penyakit/domain/repository/i_input_penyakit_repository.dart';

import 'package:flutter/material.dart';

class InputPenyakitRepositoryImpl implements IInputPenyakitRepository {
  final tokenManager = TokenRepositoryImpl();
  final apiClient = InputPenyakitKolamApiClient();

  @override
  Future<ApiResponse> submitPenyakit({
    required PenyakitKolam data,
    required String idKolam,
  }) async {
    try {
      debugPrint("masuk try di input penyakit repo impl");
      final response = await apiClient.submitData(
          token: (await tokenManager.getToken())!,
          data: data,
          idKolam: idKolam);
      debugPrint("status code : ${response.statusCode}");
      if (response.statusCode == 201) {
        return ApiResponseSuccess();
      } else {
        return ApiResponseFailed(
          errorMessage: response.body,
          errorCode: response.statusCode,
        );
      }
    } catch (e) {
      return ApiResponseFailed(errorMessage: e.toString());
    }
  }

  @override
  Future<ApiResponse> getPenyakit() async {
    try {
      debugPrint("Masuk get repository");
      final apiResponse = await apiClient.getPenyakitUdang(
          token: (await tokenManager.getToken())!);

      if (apiResponse.statusCode == 200) {
        final jsonResponse = jsonDecode(apiResponse.body);
        final List<PenyakitUdang> data = jsonResponse['data']
            .map((penyakitUdangJson) {
              return PenyakitUdang.fromJson(penyakitUdangJson);
            })
            .toList()
            .cast<PenyakitUdang>();
        return ApiResponseSuccess(data: data);
      } else {
        return ApiResponseFailed(
            errorMessage: apiResponse.body, errorCode: apiResponse.statusCode);
      }
    } catch (e) {
      return ApiResponseFailed(
        errorMessage: e.toString(),
      );
    }
  }
}
