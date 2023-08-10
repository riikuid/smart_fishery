import 'package:common/domain/model/tambak.dart';
import 'package:common/domain/use_case/empty_validation_use_case.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_buat_tambak/domain/repository/i_buat_tambak_repository.dart';
import 'package:flutter/material.dart';

class BuatTambakProvider extends ChangeNotifier {
  final IBuatTambakRepository _repository;
  BuatTambakProvider({
    required IBuatTambakRepository repository,
  }) : _repository = repository;

  final textEditingController = TextEditingController();

  final emptyValidator = EmptyValidationUseCase();

  String? textFieldError;

  ApiResponse submitResponse = ApiResponseFailed();
  // var _isSubmitting = false;
  void submitData() async {
    if (submitResponse is! ApiResponseLoading) {
      submitResponse = ApiResponseLoading();
      notifyListeners();

      final namaTambak = textEditingController.text;

      textFieldError =
          emptyValidator.validate(namaTambak, fieldName: "Nama Tambak");
      notifyListeners();

      if (_noError) {
        debugPrint("No Error dari form");
        submitResponse = await _repository.buatTambak(
            data: Tambak(
          id: "",
          name: namaTambak,
          createdAt: DateTime.now(),
        ));

        debugPrint(
            "Masuk sini, submitresponse sukses : ${submitResponse is ApiResponseFailed ? (submitResponse as ApiResponseFailed).errorMessage : "ya"}");

        notifyListeners();
      } else {
        debugPrint("no Error ga jalan bro");
        submitResponse = ApiResponseFailed();
        notifyListeners();
      }
    }
  }

  bool get _noError => textFieldError == null;

  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
