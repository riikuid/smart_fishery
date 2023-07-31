import 'package:common/domain/use_case/double_validation_use_case.dart';
import 'package:common/domain/use_case/empty_validation_use_case.dart';
import 'package:common/domain/use_case/integer_validation_use_case.dart';
import 'package:common/domain/use_case/null_validation_use_case.dart';
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
  final nullValidator = NullValidationUseCase();

  String? namaKolamError;
  String? panjangKolamError;
  String? lebarKolamError;
  String? kedalamanKolamError;
  String? totalTebarError;
  String? tanggalTebarError;
  String? umurAwalError;
  String? lamaPersiapanError;
  String? tipeTotalTebarError;

  ApiResponse submitResponse = ApiResponseFailed();

  void submitData(
    String idTambak,
    String namaKolam,
    String panjangKolam,
    String lebarKolam,
    String kedalamanKolam,
    String tanggalTebar,
    String totalTebar,
    String? tipeTotalTebar,
    String umurAwal,
    String lamaPersiapan,
  ) async {
    if (submitResponse is! ApiResponseLoading) {
      submitResponse = ApiResponseLoading();
      notifyListeners();

      namaKolamError =
          emptyValidator.validate(namaKolam, fieldName: "Nama Kolam");
      panjangKolamError =
          doubleValidator.validate(panjangKolam, fieldName: "Panjang Kolam");
      lebarKolamError =
          doubleValidator.validate(lebarKolam, fieldName: "Lebar Kolam");
      kedalamanKolamError =
          doubleValidator.validate(kedalamanKolam, fieldName: "Kedalaman Kolam");
      tanggalTebarError =
          emptyValidator.validate(tanggalTebar, fieldName: "Tanggal Tebar");
      totalTebarError =
          integerValidator.validate(totalTebar, fieldName: "Total Tebar");
      tipeTotalTebarError =
          nullValidator.validate(tipeTotalTebar, fieldName: "Tipe Tebaran");
      umurAwalError =
          integerValidator.validate(umurAwal, fieldName: "Umur Awal");
      lamaPersiapanError =
          integerValidator.validate(lamaPersiapan, fieldName: "Lama Persiapan");
      notifyListeners();
      debugPrint("SEBELUM MASUK IF");
      if (_noError) {
        debugPrint("TIDAK ADA ERROR");
        submitResponse = await _repository.buatKolam(
          idTambak,
          namaKolam,
          panjangKolam,
          lebarKolam,
          kedalamanKolam,
          tanggalTebar,
          totalTebar,
          tipeTotalTebar!,
          umurAwal,
          lamaPersiapan,
        );
        notifyListeners();
      }
      else {
        submitResponse = ApiResponseFailed();
        notifyListeners();
      }
      debugPrint("BAGIAN AKHIR");
    }
  }

  bool get _noError =>
    namaKolamError == null &&
    panjangKolamError == null &&
    lebarKolamError == null &&
    kedalamanKolamError == null &&
    totalTebarError == null &&
    tanggalTebarError == null &&
    umurAwalError == null &&
    lamaPersiapanError == null &&
    tipeTotalTebarError == null;
}
