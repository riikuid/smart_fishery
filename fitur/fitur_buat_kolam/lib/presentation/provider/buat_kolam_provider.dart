import 'package:common/domain/use_case/empty_validation_use_case.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_buat_kolam/domain/repository/i_buat_kolam_repository.dart';
import 'package:flutter/material.dart';

class BuatKolamProvider extends ChangeNotifier {
  final IBuatKolamRepository _repository;
  BuatKolamProvider({
    required IBuatKolamRepository repository,
  }) : _repository = repository;

  final emptyValidator = EmptyValidationUseCase();
  String? textFieldError;

  Future<ApiResponse> submitResponse = Future.value(ApiResponseFailed());
  var _isSubmitting = false;
  void submitData(String namaTambak) {
    if (!_isSubmitting) {
      _isSubmitting = true;
      submitResponse = _submitDataProcess(namaTambak);
      notifyListeners();

      submitResponse.whenComplete(() {
        _isSubmitting = false;
        notifyListeners();
      });
    }
  }

  Future<ApiResponse> _submitDataProcess(String namaTambak) async {
    textFieldError =
        emptyValidator.validate(namaTambak, fieldName: "Nama tambak");
    if (textFieldError == null) {
      return await _repository.buatKolam(namaTambak);
    } else {
      return ApiResponseFailed();
    }
  }
}
