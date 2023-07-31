class NullValidationUseCase {
  String? validate(Object? data , {required String fieldName}){
    return data == null ? fieldName : null;
  }
}