import 'package:common/domain/model/panen.dart';
import 'package:common/domain/use_case/double_validation_use_case.dart';
import 'package:common/domain/use_case/empty_validation_use_case.dart';
import 'package:common/domain/use_case/integer_validation_use_case.dart';
import 'package:common/domain/use_case/null_validation_use_case.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_input_panen/domain/repository/i_input_panen_repository.dart';
import 'package:flutter/material.dart';

class InputPanenProvider extends ChangeNotifier {
  final IInputPanenRepository _repository;
  final String _idKolam;
  InputPanenProvider({
    required IInputPanenRepository repository,
    required String idKolam,
  })  : _repository = repository,
        _idKolam = idKolam;

  final emptyValidator = EmptyValidationUseCase();
  final doubleValidator = DoubleValidationUseCase();
  final integerValidator = IntegerValidationUseCase();
  final nullValidator = NullValidationUseCase();

  final beratController = TextEditingController();
  final sizeController = TextEditingController();
  final jenisController = TextEditingController();
  final hargaPerKiloController = TextEditingController();

  ApiResponse submitResponse = ApiResponseFailed();

  String? _jenisPanen;
  String? get jenisPanen => _jenisPanen;

  int? _totalHarga;
  int? get totalHarga => _totalHarga;

  void setTotalHarga() {
    double berat = double.parse(beratController.text);
    double harga = double.parse(hargaPerKiloController.text);
    _totalHarga = (berat * harga).round();
  }

  void setJenisPanen(String? value) {
    if (value != null) {
      _jenisPanen = value;
    }
  }

  final List<String> allJenisPanen = [
    "Total",
    "Parsial",
    "Gagal",
  ];

  String? beratError;
  String? sizeError;
  String? jenisPanenError;
  String? hargaPerKiloError;

  void submitData() async {
    debugPrint("Masuk submit data");
    if (submitResponse is! ApiResponseLoading) {
      debugPrint("Masuk if-nya submit");
      submitResponse = ApiResponseLoading();
      notifyListeners();

      beratError =
          doubleValidator.validate(beratController.text, fieldName: "Berat");
      sizeError =
          doubleValidator.validate(sizeController.text, fieldName: "Size");
      jenisPanenError = nullValidator.validate(jenisPanen, fieldName: "Jenis");

      hargaPerKiloError = emptyValidator.validate(hargaPerKiloController.text,
          fieldName: "Harga");
      notifyListeners();

      if (noError) {
        submitResponse = await _repository.submitPanen(
            data: Panen(
              id: "",
              tanggal: DateTime.now(),
              jenisPanen: jenisPanen!,
              totalBerat: double.parse(beratController.text),
              sizeUdang: int.parse(sizeController.text),
              hargaPerKilo:
                  int.parse(hargaPerKiloController.text.replaceAll(",", "")),
              totalHarga: (double.parse(beratController.text) *
                      int.parse(
                          hargaPerKiloController.text.replaceAll(",", "")))
                  .round(),
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
    return beratError == null &&
        jenisPanenError == null &&
        sizeError == null &&
        hargaPerKiloError == null;
  }

  void disposeResource() {
    beratController.dispose();
    sizeController.dispose();
    jenisController.dispose();
    hargaPerKiloController.dispose();
  }
}
