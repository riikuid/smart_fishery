import 'package:common/response/api_response.dart';

abstract class IEditPenyakitKolamRepository {
  Future<ApiResponse> deletePenyakitKolam(String id);
}
