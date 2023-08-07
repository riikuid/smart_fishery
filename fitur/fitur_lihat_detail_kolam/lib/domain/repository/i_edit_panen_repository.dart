import 'package:common/response/api_response.dart';

abstract class IEditPanenRepository {
  Future<ApiResponse> deletePanen(String id);
}