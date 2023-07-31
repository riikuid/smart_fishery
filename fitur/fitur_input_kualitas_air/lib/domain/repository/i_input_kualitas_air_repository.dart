import 'package:common/domain/model/kualitas_air.dart';
import 'package:common/response/api_response.dart';

abstract class IInputKualitasAirRepository {
  Future<ApiResponse> submitKualitasAir({
    required KualitasAir data,
    required String idKolam,
  });
}