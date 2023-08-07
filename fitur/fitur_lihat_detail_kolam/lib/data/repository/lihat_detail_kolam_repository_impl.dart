import 'dart:convert';

import 'package:common/data/repository/token_repository_impl.dart';
import 'package:common/domain/model/penyakit_kolam.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_lihat_detail_kolam/data/api_client/lihat_detail_kolam_api_client.dart';
import 'package:fitur_lihat_detail_kolam/domain/model/detail_kolam.dart';
import 'package:common/domain/model/kualitas_air.dart';
import 'package:common/domain/model/panen.dart';
import 'package:common/domain/model/sampling.dart';
import 'package:fitur_lihat_detail_kolam/domain/repository/i_lihat_detail_kolam_repository.dart';

class LihatDetailKolamRepositoryImpl implements ILihatDetailKolamRepository {
  final tokenManager = TokenRepositoryImpl();
  final apiClient = LihatDetailKolamApiClient();

  @override
  Future<ApiResponse> getKolam(String idKolam) async {
    try {
      final apiResponse = await apiClient.getDetailKolam(
          token: (await tokenManager.getToken())!, idKolam: idKolam);

      if (apiResponse.statusCode == 200) {
        final jsonResponse = jsonDecode(apiResponse.body);

        final detailKolamJson = jsonResponse['data']['kolam_detail'];

        final listKualitasAirJson = detailKolamJson['kualitas_air_detail'];
        final listSamplingJson = detailKolamJson['sampling_detail'];
        final listPanenJson = detailKolamJson['panen_detail'];
        final listPenyakitKolamJson = detailKolamJson['penyakit_kolam_detail'];

        final listKualitasAir = listKualitasAirJson
            .map((kualitasAirJson) {
              return KualitasAir.fromJson(kualitasAirJson);
            })
            .toList()
            .cast<KualitasAir>();

        final listSampling = listSamplingJson
            .map((samplingJson) {
              return Sampling.fromJson(samplingJson);
            })
            .toList()
            .cast<Sampling>();

        final listPanen = listPanenJson
            .map((panenJson) {
              return Panen.fromJson(panenJson);
            })
            .toList()
            .cast<Panen>();

        final listPenyakitKolam = listPenyakitKolamJson
            .map((penyakitKolamJson) {
              return PenyakitKolam.fromJson(penyakitKolamJson);
            })
            .toList()
            .cast<PenyakitKolam>();

        return ApiResponseSuccess(
            data: DetailKolam(
                listKualitasAir: listKualitasAir,
                listPanen: listPanen,
                listPenyakitKolam: listPenyakitKolam,
                listSampling: listSampling));
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
