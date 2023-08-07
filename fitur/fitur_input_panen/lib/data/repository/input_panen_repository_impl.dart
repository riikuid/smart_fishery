import 'package:common/data/repository/token_repository_impl.dart';
import 'package:common/domain/model/panen.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_input_panen/data/api_client/input_panen_api_client.dart';
import 'package:fitur_input_panen/domain/repository/i_input_panen_repository.dart';

import 'package:flutter/material.dart';

class InputPanenRepositoryImpl implements IInputPanenRepository {
  final tokenManager = TokenRepositoryImpl();
  final apiClient = InputPanenApiClient();

  @override
  Future<ApiResponse> submitPanen({
    required Panen data,
    required String idKolam,
  }) async {
    try {
      debugPrint("masuk try di input panen repo impl");
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
}
