import 'package:common/domain/use_case/double_validation_use_case.dart';
import 'package:common/domain/use_case/empty_validation_use_case.dart';
import 'package:flutter/material.dart';

class InputKualitasAirProvider extends ChangeNotifier{
  String _choosenDate = "";
  String get choosenDate => _choosenDate;
  void setChoosenDate(String value) {
    _choosenDate = value;
    notifyListeners();
  }

  final doController = TextEditingController();
  final suhuController = TextEditingController();
  final salController = TextEditingController();
  final phController = TextEditingController();
  final orpController = TextEditingController();

  String? choosenDateError;
  String? suhuError;
  String? doError;
  String? salError;
  String? phError;
  String? orpError;

  final emptyValidator = EmptyValidationUseCase();
  final doubleValidator = DoubleValidationUseCase();

  void submitData(){
    choosenDateError = emptyValidator.validate(choosenDate , fieldName: "Tanggal");
    suhuError = doubleValidator.validate(suhuController.text, fieldName: "Suhu");
    doError = doubleValidator.validate(doController.text , fieldName: "DO");
    salError = doubleValidator.validate(salController.text, fieldName: "Sal");
    phError = doubleValidator.validate(phController.text, fieldName: "PH");
    orpError = doubleValidator.validate(orpController.text, fieldName: "ORP");
    notifyListeners();
  }

  void disposeResource(){
    doController.dispose();
    salController.dispose();
    phController.dispose();
    orpController.dispose();
    suhuController.dispose();
  }

}