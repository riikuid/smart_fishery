import 'package:common/response/response.dart';

abstract class IMonitoringRepository{
  Future<Response> getTambak(
    String token,
  );
}