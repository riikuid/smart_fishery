import 'package:common/data/repository/token_repository_impl.dart';
import 'package:common/domain/model/tambak.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_buat_tambak/data/api_client/buat_tambak_api_client.dart';
import 'package:fitur_buat_tambak/domain/repository/i_buat_tambak_repository.dart';
import 'package:flutter/material.dart';

class BuatTambakRepositoryImpl implements IBuatTambakRepository {
  final tokenManager = TokenRepositoryImpl();
  final apiClient = BuatTambakApiClient();

  @override
  Future<ApiResponse> buatTambak({
    required Tambak data,
  }) async {
    try {
      debugPrint("masuk try di input panen repo impl");
      final response = await apiClient.buatTambak(
        data: data,
        token: (await tokenManager.getToken())!,
      );
      debugPrint("status code : ${response.statusCode}");
      if (response.statusCode == 201) {
        return ApiResponseSuccess();
      } else {
        return ApiResponseFailed(
          errorMessage: response.body,
        );
      }
    } catch (e) {
      return ApiResponseFailed(
        errorMessage: "Gagal tersambung ke server",
      );
    }
  }
}
