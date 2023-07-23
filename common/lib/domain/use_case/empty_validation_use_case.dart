class EmptyValidationUseCase{
  String? validate(String value , {required String fieldName}){
    return value.isEmpty ? "$fieldName tidak boleh kosong" : null;
  }
}