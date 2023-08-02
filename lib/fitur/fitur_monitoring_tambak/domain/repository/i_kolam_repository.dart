import 'package:common/response/api_response.dart';

abstract class IKolamRepository {
  Future<ApiResponse> deleteKolam({required String idKolam});
}