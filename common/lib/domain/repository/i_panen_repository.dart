import 'package:common/response/response.dart';

abstract class ILihatDetailRepository{
  Future<Response> getKolam(int id);
}