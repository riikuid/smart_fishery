class IntegerValidationUseCase {
  String? validate(String value, {required String fieldName}) {
    try {
      int.parse(value);
      return null;
    } catch (e) {
      return "$fieldName tidak valid";
    }
  }
}
