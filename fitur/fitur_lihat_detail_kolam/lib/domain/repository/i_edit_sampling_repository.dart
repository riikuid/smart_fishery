import 'package:common/response/api_response.dart';

abstract class IEditSamplingRepository {
  Future<ApiResponse> deleteSampling(String id);
}
