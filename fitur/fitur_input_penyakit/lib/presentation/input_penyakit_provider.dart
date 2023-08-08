import 'package:common/domain/model/penyakit_kolam.dart';
import 'package:common/domain/use_case/empty_validation_use_case.dart';
import 'package:common/domain/use_case/null_validation_use_case.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_input_penyakit/domain/model/penyakit_udang.dart';
import 'package:fitur_input_penyakit/domain/repository/i_input_penyakit_repository.dart';
import 'package:flutter/material.dart';

class InputPenyakitProvider extends ChangeNotifier {
  final IInputPenyakitRepository _repository;
  final String _idKolam;
  InputPenyakitProvider({
    required IInputPenyakitRepository repository,
    required String idKolam,
  })  : penyakitUdangResponse = repository.getPenyakit(),
        _repository = repository,
        _idKolam = idKolam;

  final emptyValidator = EmptyValidationUseCase();
  final nullValidator = NullValidationUseCase();

  ApiResponse submitResponse = ApiResponseFailed();

  final TextEditingController namaPenyakitController = TextEditingController();

  String? _namaPenyakit;
  String? get namaPenyakit => _namaPenyakit;

  String? namaPenyakitError;

  Future<ApiResponse> penyakitUdangResponse;
  void onRefreshPenyakitUdang() {
    debugPrint("manggil on refersh penyakit");
    penyakitUdangResponse = _repository.getPenyakit();
    notifyListeners();
  }

  PenyakitUdang? _choosenPenyakitUdang;
  PenyakitUdang? get choosenPenyakitUdang => _choosenPenyakitUdang;
  void setChoosenPenyakitUdang(PenyakitUdang newChoosenPenyakitUdang) {
    _choosenPenyakitUdang = newChoosenPenyakitUdang;
    namaPenyakitController.text = newChoosenPenyakitUdang.namaPanjang;
    notifyListeners();
  }

  void submitData() async {
    debugPrint("Masuk submit data");
    if (submitResponse is! ApiResponseLoading) {
      debugPrint("Masuk if-nya submit");
      submitResponse = ApiResponseLoading();
      notifyListeners();

      namaPenyakitError =
          nullValidator.validate(namaPenyakit, fieldName: "Nama Penyakit");
      notifyListeners();

      if (noError) {
        submitResponse = await _repository.submitPenyakit(
            data: PenyakitKolam(
              id: "",
              tanggal: DateTime.now(),
              namaPenyakit: namaPenyakit!,
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
    return namaPenyakitError == null;
  }
}
