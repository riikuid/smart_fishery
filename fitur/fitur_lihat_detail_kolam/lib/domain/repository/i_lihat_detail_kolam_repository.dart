import 'package:common/response/api_response.dart';

abstract class ILihatDetailKolamRepository{
  Future<ApiResponse> getKolam(String idKolam);
}