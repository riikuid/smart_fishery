import 'package:common/domain/use_case/empty_validation_use_case.dart';
import 'package:common/response/api_response.dart';
import 'package:flutter/material.dart';

class BuatTambakProvider extends ChangeNotifier{

  final emptyValidator = EmptyValidationUseCase();
  String? textFieldError;

  Future<ApiResponse>? submitResponse;
  var isSubmitting = false;
  Future<ApiResponse> _submitDataProcess(String namaTambak) async {
    textFieldError = emptyValidator.validate(namaTambak, fieldName: "Nama tambak");
    return ApiResponseFailed();
  }
}