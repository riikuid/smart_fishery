class DoubleValidationUseCase {
  String? validate(String value , {required String fieldName}){
    try {
      double.parse(value);
      return null;
    } catch(e){
      return "$fieldName tidak valid";
    }
  }
}