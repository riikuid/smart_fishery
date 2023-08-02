
import 'package:common/data/repository/token_repository_impl.dart';
import 'package:common/domain/use_case/format_bearer_use_case.dart';
import 'package:common/response/api_response.dart';
import 'package:dependencies/http.dart';

class ApiRequestProcessor {
  static final _tokenManager = TokenRepositoryImpl();
  static final _bearerFormatter = FormatBearerUseCase();

  static Future<ApiResponse> proceed({
    required Future<Response> Function(Map<String , String>) getResponse,
    dynamic Function(Response)? getDataFromResponse,
    required int preferredStatusCode,
  }) async {
    try{
      final response = await getResponse(
        _bearerFormatter.format((await _tokenManager.getToken())!)
      );
      if (response.statusCode == preferredStatusCode){
        if (getDataFromResponse == null){
          return ApiResponseSuccess();
        }
        else {
          return ApiResponseSuccess(
            data: getDataFromResponse(response),
          );
        }
      }
      else {
        return ApiResponseFailed(
          errorMessage: response.body,
          errorCode: response.statusCode,
        );
      }
    } catch (e){
      return ApiResponseFailed(
        errorMessage: e.toString()
      );
    }
  }

}