import 'package:common/domain/model/tambak.dart';
import 'package:common/response/api_response.dart';

abstract class IBuatTambakRepository {
  Future<ApiResponse> buatTambak({required Tambak data});
}
