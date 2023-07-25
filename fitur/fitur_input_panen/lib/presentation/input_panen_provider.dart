import 'package:common/domain/use_case/double_validation_use_case.dart';
import 'package:common/domain/use_case/empty_validation_use_case.dart';
import 'package:flutter/material.dart';

class InputPanenProvider extends ChangeNotifier{
  final emptyValidator = EmptyValidationUseCase();
  final doubleValidator = DoubleValidationUseCase();

  String _tanggal = "";
  String get tanggal => _tanggal;
  void setTanggal(String value) {
    _tanggal = value;
    notifyListeners();
  }

  final beratController = TextEditingController();
  final sizeController = TextEditingController();
  final jenisController = TextEditingController();

  String? tanggalError;
  String? beratError;
  String? sizeError;
  String? jenisError;

  void submitData(){
    tanggalError = emptyValidator.validate(tanggal, fieldName: "Tanggal");
    beratError = doubleValidator.validate(beratController.text , fieldName: "Berat");
    sizeError = doubleValidator.validate(sizeController.text , fieldName: "Size");
    jenisError = emptyValidator.validate(jenisController.text , fieldName: "Jenis");

    notifyListeners();
  }

  void disposeResource(){
    beratController.dispose();
    sizeController.dispose();
    jenisController.dispose();
  }
}