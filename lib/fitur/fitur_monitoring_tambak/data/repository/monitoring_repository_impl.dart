import 'dart:convert';

import 'package:common/data/repository/token_repository_impl.dart';
import 'package:common/response/api_response.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/data/api_client/monitoring_api_client.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/model/tambak.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/repository/i_monitoring_repository.dart';

class MonitoringRepositoryImpl implements IMonitoringRepository{
  final apiClient = MonitoringApiClient();
  final tokenManager = TokenRepositoryImpl();

  @override
  Future<ApiResponse> getTambak() async {
    try {
      final response = await apiClient.getTambak(
          await tokenManager.getToken()
      );

      if (response.statusCode == 200){
        debugPrint("status code 200");
        debugPrint("status ${response.body}");
        final jsonResponse = jsonDecode(response.body);
        final List<Tambak> data = jsonResponse['data'].map(
          (tambakJson){
            debugPrint(tambakJson.runtimeType.toString());
            final id = tambakJson['id'];
            final namaTambak = tambakJson['nama_tambak'];
            final createdAt = tambakJson['created_at'];
            debugPrint("id $id");
            debugPrint("namaTambak $namaTambak");
            debugPrint("createdAt $createdAt");

            return Tambak.fromJson(tambakJson);
          }
        ).toList().cast<Tambak>();
        return ApiResponseSuccess(
          data: data
        );
      } else {
        return ApiResponseFailed(
          errorMessage: "Gagal tersambung ke server",
          errorCode: response.statusCode,
        );
      }
    } catch (e){
      return ApiResponseFailed(
        errorMessage: e.toString()
      );
    }
  }
  
}