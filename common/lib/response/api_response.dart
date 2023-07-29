class ApiResponse{}

class ApiResponseSuccess<T> implements ApiResponse{
  T? data;
  ApiResponseSuccess({
    this.data,
  });
}

class ApiResponseFailed implements ApiResponse{
  String? errorMessage;
  int? errorCode;
  ApiResponseFailed({
    this.errorMessage,
    this.errorCode
  });
}