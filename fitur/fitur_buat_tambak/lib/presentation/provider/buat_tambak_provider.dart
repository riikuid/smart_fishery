import 'package:common/domain/use_case/empty_validation_use_case.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_buat_tambak/domain/repository/i_buat_tambak_repository.dart';
import 'package:flutter/material.dart';

class BuatTambakProvider extends ChangeNotifier{
  final IBuatTambakRepository _repository;
  BuatTambakProvider({
    required IBuatTambakRepository repository,
  }) : _repository = repository;


  final emptyValidator = EmptyValidationUseCase();
  String? textFieldError;

  Future<ApiResponse> submitResponse = Future.value(ApiResponseFailed());
  var _isSubmitting = false;
  void submitData(String namaTambak){
    if (!_isSubmitting){
      _isSubmitting = true;
      submitResponse = _submitDataProcess(namaTambak);
      notifyListeners();

      submitResponse.whenComplete((){
        _isSubmitting = false;
        notifyListeners();
      });
    }
  }
  Future<ApiResponse> _submitDataProcess(String namaTambak) async {
    textFieldError = emptyValidator.validate(namaTambak, fieldName: "Nama tambak");
    if (textFieldError == null){
      return await _repository.buatTambak(namaTambak);
    }
    else {
      return ApiResponseFailed();
    }
  }
}