import 'package:common/domain/model/sampling.dart';
import 'package:common/response/api_response.dart';

abstract class IInputSamplingRepository {
  Future<ApiResponse> submitSampling({
    required Sampling data,
    required String idKolam,
  });
}
