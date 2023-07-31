import 'package:common/domain/use_case/double_validation_use_case.dart';
import 'package:common/domain/use_case/empty_validation_use_case.dart';
import 'package:common/domain/use_case/integer_validation_use_case.dart';
import 'package:common/response/api_response.dart';
import 'package:fitur_buat_kolam/domain/repository/i_buat_kolam_repository.dart';
import 'package:flutter/material.dart';

class BuatKolamProvider extends ChangeNotifier {
  final IBuatKolamRepository _repository;
  BuatKolamProvider({
    required IBuatKolamRepository repository,
  }) : _repository = repository;

  final emptyValidator = EmptyValidationUseCase();
  final doubleValidator = DoubleValidationUseCase();
  final integerValidator = IntegerValidationUseCase();
  String? textFieldError;

  Future<ApiResponse> submitResponse = Future.value(ApiResponseFailed());
  var _isSubmitting = false;
  void submitData(
    String idTambak,
    String namaKolam,
    String panjangKolam,
    String lebarKolam,
    String kedalamanKolam,
    String tanggalTebar,
    String totalTebar,
    String tipeTotalTebar,
    String umurAwal,
    String lamaPersiapan,
  ) {
    if (!_isSubmitting) {
      _isSubmitting = true;
      submitResponse = _submitDataProcess(
        idTambak,
        namaKolam,
        panjangKolam,
        lebarKolam,
        kedalamanKolam,
        tanggalTebar,
        totalTebar,
        tipeTotalTebar,
        umurAwal,
        lamaPersiapan,
      );

      notifyListeners();

      submitResponse.whenComplete(() {
        _isSubmitting = false;
        notifyListeners();
      });
    }
  }

  Future<ApiResponse> _submitDataProcess(
    String idTambak,
    String namaKolam,
    String panjangKolam,
    String lebarKolam,
    String kedalamanKolam,
    String tanggalTebar,
    String totalTebar,
    String tipeTotalTebar,
    String umurAwal,
    String lamaPersiapan,
  ) async {
    textFieldError =
        emptyValidator.validate(namaKolam, fieldName: "Nama Kolam");
    textFieldError =
        doubleValidator.validate(panjangKolam, fieldName: "Panjang Kolam");
    textFieldError =
        doubleValidator.validate(lebarKolam, fieldName: "Lebar Kolam");
    textFieldError =
        doubleValidator.validate(kedalamanKolam, fieldName: "Kedalaman Kolam");
    textFieldError =
        emptyValidator.validate(tanggalTebar, fieldName: "Tanggal Tebar");
    textFieldError =
        integerValidator.validate(totalTebar, fieldName: "Total Tebar");
    textFieldError =
        emptyValidator.validate(tipeTotalTebar, fieldName: "Tipe Tebaran");
    textFieldError =
        integerValidator.validate(umurAwal, fieldName: "Umur Awal");
    textFieldError =
        integerValidator.validate(lamaPersiapan, fieldName: "Lama Persiapan");

    if (textFieldError == null) {
      return await _repository.buatKolam(
        idTambak,
        namaKolam,
        panjangKolam,
        lebarKolam,
        kedalamanKolam,
        tanggalTebar,
        totalTebar,
        tipeTotalTebar,
        umurAwal,
        lamaPersiapan,
      );
    } else {
      return ApiResponseFailed();
    }
  }
}
