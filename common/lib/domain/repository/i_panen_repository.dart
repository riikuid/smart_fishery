import 'package:common/response/api_response.dart';

abstract class ILihatDetailRepository{
  Future<ApiResponse> getKolam(int id);
}