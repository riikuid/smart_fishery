import 'package:common/domain/model/kualitas_air.dart';
import 'package:common/domain/use_case/double_validation_use_case.dart';
import 'package:common/domain/use_case/empty_validation_use_case.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_input_kualitas_air/domain/repository/i_input_kualitas_air_repository.dart';
import 'package:flutter/material.dart';

class InputKualitasAirProvider extends ChangeNotifier{
  
  final IInputKualitasAirRepository _repository;
  final String _idKolam;
  InputKualitasAirProvider({
    required IInputKualitasAirRepository repository,
    required String idKolam,
  }) : _repository = repository , _idKolam = idKolam;
  
  String _choosenDate = "";
  String get choosenDate => _choosenDate;
  void setChoosenDate(String value) {
    _choosenDate = value;
    notifyListeners();
  }

  String _choosenTime = "";
  String get choosenTime => _choosenTime;
  void setChoosenTime(String value){
    _choosenTime = value;
    notifyListeners();
  }

  final doController = TextEditingController();
  final suhuController = TextEditingController();
  final salController = TextEditingController();
  final phController = TextEditingController();
  final kecerahanController = TextEditingController();

  String? choosenDateError;
  String? choosenTimeError;
  String? suhuError;
  String? doError;
  String? salError;
  String? phError;
  String? kecerahanError;

  final emptyValidator = EmptyValidationUseCase();
  final doubleValidator = DoubleValidationUseCase();

  ApiResponse submitResponse = ApiResponseFailed();

  void submitData() async {
    debugPrint("Masuk submit data");
    if (submitResponse is! ApiResponseLoading){
      debugPrint("Masuk if-nya submit");
      submitResponse = ApiResponseLoading();
      notifyListeners();

      choosenDateError =
          emptyValidator.validate(choosenDate, fieldName: "Tanggal pengecekan");
      choosenTimeError =
          emptyValidator.validate(choosenTime, fieldName: "Waktu pengecekan");
      suhuError =
          doubleValidator.validate(suhuController.text, fieldName: "Suhu");
      doError = doubleValidator.validate(doController.text, fieldName: "DO");
      salError = doubleValidator.validate(salController.text, fieldName: "Sal");
      phError = doubleValidator.validate(phController.text, fieldName: "PH");
      kecerahanError = doubleValidator.validate(kecerahanController.text,
          fieldName: "Kecerahan");
      notifyListeners();

      if (noError) {
        submitResponse = await _repository.submitKualitasAir(
            data: KualitasAir(
              id: "",
              tanggalPengukuran: choosenDate,
              jamPengukuran: choosenTime,
              suhu: double.parse(suhuController.text),
              dO: double.parse(doController.text),
              sal: double.parse(salController.text),
              ph: double.parse(phController.text),
              kecerahan: double.parse(kecerahanController.text),
            ),
            idKolam: _idKolam
        );
        debugPrint("Masuk sini, submitresponse sukses : ${submitResponse is ApiResponseFailed ? (submitResponse as ApiResponseFailed).errorMessage : "ya"}");
        notifyListeners();
      }
      else {
        submitResponse = ApiResponseFailed();
        notifyListeners();
      }
    }
  }
  
  bool get noError {
    return choosenDateError == null &&
      choosenTimeError == null &&
      suhuError == null &&
      doError == null &&
      salError == null &&
      phError == null &&
      kecerahanError == null;
  }

  @override
  void dispose(){
    doController.dispose();
    salController.dispose();
    phController.dispose();
    kecerahanController.dispose();
    suhuController.dispose();
    super.dispose();
  }

}