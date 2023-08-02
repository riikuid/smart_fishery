import 'package:common/response/api_response.dart';

abstract class IEditKualitasAirRepository {
  Future<ApiResponse> deleteKualitasAir(String id);
}