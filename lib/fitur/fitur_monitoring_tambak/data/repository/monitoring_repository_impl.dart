import 'dart:convert';

import 'package:common/data/repository/token_repository_impl.dart';
import 'package:common/response/api_response.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/data/api_client/monitoring_api_client.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/model/kolam.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/model/tambak.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/repository/i_monitoring_repository.dart';

class MonitoringRepositoryImpl implements IMonitoringRepository{
  final apiClient = MonitoringApiClient();
  final tokenManager = TokenRepositoryImpl();

  @override
  Future<ApiResponse> getTambak() async {
    try {
      final response = await apiClient.getTambak(
          (await tokenManager.getToken())!
      );
      debugPrint("hahahhaha : ${response.statusCode}");

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
      debugPrint("nyoba gunain api client");
      final response = await apiClient.getKolam(
          (await tokenManager.getToken())!,
          idTambak
      );

      if (response.statusCode == 200) {
        debugPrint("Kolam Json : ${response.body}");
        final jsonResponse = jsonDecode(response.body);
        debugPrint("Berhasil nge-decode json Kolam");
        final listKolamJson = jsonResponse['data']['tambak_detail']['kolam_detail'];
        debugPrint("Berhasil dapeting listKolam");
        final List<Kolam> listKolam = listKolamJson.map(
            (kolamJson) {
              return Kolam.fromJson(kolamJson);
            }
        ).toList().cast<Kolam>();
        debugPrint("Total Kolam : ${listKolam.length}");

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
      debugPrint("Error Kolam repository : $e");
      return ApiResponseFailed();
    }
  }
}