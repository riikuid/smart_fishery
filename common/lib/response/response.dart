class Response{}

class ApiResponseSuccess<T> implements Response{
  T? data;
  ApiResponseSuccess({
    this.data,
  });
}

class ApiResponseFailed implements Response{
  String? errorMessage;
  int? errorCode;
  ApiResponseFailed({
    this.errorMessage,
    this.errorCode
  });
}