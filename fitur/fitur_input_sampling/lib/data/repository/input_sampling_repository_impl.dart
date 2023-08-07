import 'package:common/data/repository/token_repository_impl.dart';
import 'package:common/domain/model/panen.dart';
import 'package:common/domain/model/sampling.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_input_sampling/data/api_client/input_sampling_api_client.dart';
import 'package:fitur_input_sampling/repository/i_input_panen_repository.dart';

import 'package:flutter/material.dart';

class InputSamplingRepositoryImpl implements IInputSamplingRepository {
  final tokenManager = TokenRepositoryImpl();
  final apiClient = InputSamplingApiClient();

  @override
  Future<ApiResponse> submitSampling({
    required Sampling data,
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
