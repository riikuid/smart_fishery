import 'package:common/data/repository/token_repository_impl.dart';
import 'package:common/domain/model/kualitas_air.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_input_kualitas_air/data/api_client/input_kualitas_air_api_client.dart';
import 'package:fitur_input_kualitas_air/domain/repository/i_input_kualitas_air_repository.dart';
import 'package:flutter/material.dart';

class InputKualitasAirRepositoryImpl implements IInputKualitasAirRepository{
  final tokenManager = TokenRepositoryImpl();
  final apiClient = InputKualitasAirApiClient();

  @override
  Future<ApiResponse> submitKualitasAir({
    required KualitasAir data,
    required String idKolam,
  }) async {
    try {
      debugPrint("masuk try di input kualitas air repo impl");
      final response = await apiClient.submitData(
        token: (await tokenManager.getToken())!,
        data: data,
        idKolam: idKolam
      );
      debugPrint("status code : ${response.statusCode}");
      if (response.statusCode == 201){
        return ApiResponseSuccess();
      }
      else {

        return ApiResponseFailed(
          errorMessage: response.body,
          errorCode: response.statusCode,
        );
      }
    } catch (e) {
      return ApiResponseFailed(
        errorMessage: e.toString()
      );
    }
  }

}