import 'package:common/domain/use_case/double_validation_use_case.dart';
import 'package:common/domain/use_case/empty_validation_use_case.dart';
import 'package:flutter/material.dart';

class InputSamplingProvider extends ChangeNotifier{
  final emptyValidator = EmptyValidationUseCase();
  final doubleValidator = DoubleValidationUseCase();


  String tanggal = "";
  void changeTanggal(String newValue) => tanggal = newValue;
  final mbwController = TextEditingController();

  String? tanggalError;
  String? mbwError;

  void submit(){
    tanggalError = emptyValidator.validate(tanggal, fieldName: "Tanggal");
    mbwError = doubleValidator.validate(mbwController.text, fieldName: "MBW");
    notifyListeners();
  }

}