import 'package:common/domain/model/kolam.dart';
import 'package:common/response/api_response.dart';

abstract class IMonitoringRepository{
  Future<ApiResponse> getTambak();

  Future<ApiResponse> getKolam(String idTambak);
  Future<ApiResponse> editKolam(Kolam newKolam);
}