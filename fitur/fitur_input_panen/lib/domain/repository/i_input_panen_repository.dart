import 'package:common/domain/model/panen.dart';
import 'package:common/response/api_response.dart';

abstract class IInputPanenRepository {
  Future<ApiResponse> submitPanen({
    required Panen data,
    required String idKolam,
  });
}
