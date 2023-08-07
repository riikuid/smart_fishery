import 'package:common/domain/model/sampling.dart';
import 'package:common/domain/use_case/double_validation_use_case.dart';
import 'package:common/domain/use_case/empty_validation_use_case.dart';
import 'package:common/domain/use_case/null_validation_use_case.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_input_sampling/repository/i_input_panen_repository.dart';
import 'package:flutter/material.dart';

class InputSamplingProvider extends ChangeNotifier {
  final IInputSamplingRepository _repository;
  final String _idKolam;
  InputSamplingProvider({
    required IInputSamplingRepository repository,
    required String idKolam,
  })  : _repository = repository,
        _idKolam = idKolam;
  final emptyValidator = EmptyValidationUseCase();
  final doubleValidator = DoubleValidationUseCase();
  final nullValidator = NullValidationUseCase();

  ApiResponse submitResponse = ApiResponseFailed();

  String? _kondisiUdang;
  String? get kondisiUdang => _kondisiUdang;

  void setKondisiUdang(String? value) {
    if (value != null) {
      _kondisiUdang = value;
    }
  }

  final List<String> allKondisiUdang = [
    "Sehat",
    "Tidak Sehat",
  ];

  final mbwController = TextEditingController();
  final frController = TextEditingController();

  String? mbwError;
  String? frError;
  String? kondisiUdangError;

  void submitData() async {
    debugPrint("Masuk submit data");
    if (submitResponse is! ApiResponseLoading) {
      debugPrint("Masuk if-nya submit");
      submitResponse = ApiResponseLoading();
      notifyListeners();

      mbwError = doubleValidator.validate(mbwController.text, fieldName: "MBW");
      frError = doubleValidator.validate(frController.text, fieldName: "FR");
      kondisiUdangError =
          nullValidator.validate(kondisiUdang, fieldName: "Kondisi Udang");
      notifyListeners();

      if (noError) {
        submitResponse = await _repository.submitSampling(
            data: Sampling(
              id: "",
              tanggal: DateTime.now(),
              kondisiUdang: kondisiUdang!,
              mbw: double.parse(mbwController.text),
              fr: double.parse(mbwController.text),
            ),
            idKolam: _idKolam);
        debugPrint(
            "Masuk sini, submitresponse sukses : ${submitResponse is ApiResponseFailed ? (submitResponse as ApiResponseFailed).errorMessage : "ya"}");
        notifyListeners();
      } else {
        submitResponse = ApiResponseFailed();
        debugPrint("no Error ga jalan bro");
        notifyListeners();
      }
    }
  }

  bool get noError {
    return mbwError == null && frError == null && kondisiUdangError == null;
  }
}
