import 'package:common/domain/model/penyakit_kolam.dart';
import 'package:common/response/api_response.dart';

abstract class IInputPenyakitRepository {
  Future<ApiResponse> submitPenyakit({
    required PenyakitKolam data,
    required String idKolam,
  });
  Future<ApiResponse> getPenyakit();
}
