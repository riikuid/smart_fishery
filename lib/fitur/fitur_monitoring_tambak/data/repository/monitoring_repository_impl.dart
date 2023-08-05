import 'dart:convert';

import 'package:common/data/repository/token_repository_impl.dart';
import 'package:common/response/api_response.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/data/api_client/monitoring_api_client.dart';
import 'package:common/domain/model/kolam.dart';
import 'package:common/domain/model/tambak.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/repository/i_monitoring_repository.dart';

class MonitoringRepositoryImpl implements IMonitoringRepository{
  final _apiClient = MonitoringApiClient();
  final _tokenManager = TokenRepositoryImpl();

  @override
  Future<ApiResponse> getTambak() async {
    try {
      final response = await _apiClient.getTambak(
          (await _tokenManager.getToken())!
      );

      if (response.statusCode == 200){
        final jsonResponse = jsonDecode(response.body);
        final List<Tambak> data = jsonResponse['data'].map(
          (tambakJson){
            return Tambak.fromJson(tambakJson);
          }
        ).toList().cast<Tambak>();
        return ApiResponseSuccess(
          data: data
        );
      } else {
        return ApiResponseFailed(
          errorMessage: response.body,
          errorCode: response.statusCode,
        );
      }
    } catch (e){
      return ApiResponseFailed(
        errorMessage: e.toString()
      );
    }
  }

  @override
  Future<ApiResponse> getKolam(String idTambak) async {
    try {
      final response = await _apiClient.getKolam(
          (await _tokenManager.getToken())!,
          idTambak
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final listKolamJson = jsonResponse['data']['tambak_detail']['kolam_detail'];
        final List<Kolam> listKolam = listKolamJson.map(
            (kolamJson) {
              return Kolam.fromJson(kolamJson);
            }
        ).toList().cast<Kolam>();

        return ApiResponseSuccess(
            data: listKolam
        );
      }
      else {
        return ApiResponseFailed(
          errorMessage: response.body
        );
      }
    } catch (e) {
      return ApiResponseFailed();
    }
  }

  @override
  Future<ApiResponse> deleteKolam({required String idKolam}) async {
    try {
      final response = await _apiClient.deleteKolam(
          idKolam: idKolam,
          token: (await _tokenManager.getToken())!
      );

      if (response.statusCode == 200){
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