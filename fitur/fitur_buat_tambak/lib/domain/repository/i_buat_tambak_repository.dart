import 'package:common/response/api_response.dart';

abstract class IBuatTambakRepository {
  Future<ApiResponse> buatTambak(String namaTambak);
}