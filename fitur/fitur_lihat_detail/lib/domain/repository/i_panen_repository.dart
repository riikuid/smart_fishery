import 'package:common/response/response.dart';

abstract class IPanenRepository{
  Future<Response> getKolam(int id);
}