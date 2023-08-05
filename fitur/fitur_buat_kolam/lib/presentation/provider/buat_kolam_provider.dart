import 'package:common/domain/model/kolam.dart';
import 'package:common/domain/model/tambak.dart';
import 'package:common/domain/use_case/double_validation_use_case.dart';
import 'package:common/domain/use_case/empty_validation_use_case.dart';
import 'package:common/domain/use_case/integer_validation_use_case.dart';
import 'package:common/domain/use_case/null_validation_use_case.dart';
import 'package:common/response/api_response.dart';
import 'package:common/routes/argument/input_kolam_argument.dart';
import 'package:fitur_buat_kolam/domain/repository/i_buat_kolam_repository.dart';
import 'package:flutter/material.dart';

class BuatKolamProvider extends ChangeNotifier {
  final IBuatKolamRepository _repository;
  final Tambak tambak;
  final String? idKolam;
  BuatKolamProvider({
    required InputKolamArgument argument,
    required IBuatKolamRepository repository,
  }) : _repository = repository,
       tambak = argument.tambak,
        namaKolamController = TextEditingController(
          text: argument.initialKolam?.namaKolam ?? ""
        ),
        panjangKolamController = TextEditingController(
          text: argument.initialKolam?.panjangKolam.toString() ?? ""
        ),
        lebarKolamController = TextEditingController(
          text: argument.initialKolam?.lebarKolam.toString() ?? ""
        ),
        kedalamanKolamController = TextEditingController(
          text: argument.initialKolam?.kedalamanKolam.toString() ?? ""
        ),
        totalTebarController = TextEditingController(
          text: argument.initialKolam?.totalTebar.toString() ?? ""
        ),
        tanggalTebarController = TextEditingController(
          text: argument.initialKolam?.tanggalTebar ?? ""
        ),
        umurAwalController = TextEditingController(
          text: argument.initialKolam?.umurAwal.toString() ?? ""
        ),
        lamaPersiapanController = TextEditingController(
          text: argument.initialKolam?.lamaPersiapan.toString() ?? ""
        ),
        _tipeTotalTebar = argument.initialKolam?.tipeTotalTebar,
        idKolam = argument.initialKolam?.id;


  final emptyValidator = EmptyValidationUseCase();
  final doubleValidator = DoubleValidationUseCase();
  final integerValidator = IntegerValidationUseCase();
  final nullValidator = NullValidationUseCase();

  final TextEditingController namaKolamController;
  final TextEditingController panjangKolamController;
  final TextEditingController lebarKolamController;
  final TextEditingController kedalamanKolamController;
  final TextEditingController totalTebarController;
  final TextEditingController tanggalTebarController;
  final TextEditingController umurAwalController;
  final TextEditingController lamaPersiapanController;
  String? _tipeTotalTebar;
  String? get tipeTotalTebar => _tipeTotalTebar;
  void setTipeTotalTebar(String? value) {
    if (value != null) {
      _tipeTotalTebar = value;
    }
  }
  final List<String> allTipeTotalTebar = [
    "Netto",
    "Bruto",
    "Aktual",
  ];

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

  void submitData() async {
    if (submitResponse is! ApiResponseLoading) {
      submitResponse = ApiResponseLoading();
      notifyListeners();

      final namaKolam = namaKolamController.text;
      final panjangKolam = panjangKolamController.text;
      final lebarKolam = lebarKolamController.text;
      final kedalamanKolam = kedalamanKolamController.text;
      final tanggalTebar = tanggalTebarController.text;
      final totalTebar = totalTebarController.text;
      final umurAwal = umurAwalController.text;
      final lamaPersiapan = lamaPersiapanController.text;
      namaKolamError = emptyValidator
          .validate(namaKolam, fieldName: "Nama Kolam");
      panjangKolamError = doubleValidator
          .validate(panjangKolam, fieldName: "Panjang Kolam");
      lebarKolamError = doubleValidator
          .validate(lebarKolam, fieldName: "Lebar Kolam");
      kedalamanKolamError = doubleValidator
          .validate(kedalamanKolam, fieldName: "Kedalaman Kolam");
      tanggalTebarError = emptyValidator
          .validate(tanggalTebar, fieldName: "Tanggal Tebar");
      totalTebarError = integerValidator
          .validate(totalTebar, fieldName: "Total Tebar");
      tipeTotalTebarError = nullValidator
          .validate(tipeTotalTebar, fieldName: "Tipe Tebaran");
      umurAwalError = integerValidator
          .validate(umurAwal, fieldName: "Umur Awal");
      lamaPersiapanError = integerValidator
          .validate(lamaPersiapan, fieldName: "Lama Persiapan");
      notifyListeners();

      if (_noError) {
        debugPrint("No Error dari form");
        final submittedKolam = Kolam(
          id: idKolam ?? "",
          namaKolam: namaKolam,
          lebarKolam: double.parse(lebarKolam),
          panjangKolam: double.parse(panjangKolam),
          kedalamanKolam: double.parse(kedalamanKolam),
          totalTebar: int.parse(totalTebar),
          tanggalTebar: tanggalTebar,
          umurAwal: int.parse(umurAwal),
          lamaPersiapan: int.parse(lamaPersiapan),
          tipeTotalTebar: tipeTotalTebar!,
          updateTerakhir: DateTime.now(),
          lastKualitasAir: null,
        );

        if (idKolam == null) {
          submitResponse = await _repository.buatKolam(
              idTambak: tambak.id,
              kolam: submittedKolam
          );
        }
        else {
          debugPrint("Mulai edit submit kolam");
          submitResponse = await _repository.editKolam(kolam: submittedKolam);
          if (submitResponse is ApiResponseFailed){
            debugPrint("${(submitResponse as ApiResponseFailed).errorMessage}");
          }
        }
        notifyListeners();
      }
      else {
        submitResponse = ApiResponseFailed();
        notifyListeners();
      }
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

  @override
  void dispose() {
    namaKolamController.dispose();
    panjangKolamController.dispose();
    lebarKolamController.dispose();
    kedalamanKolamController.dispose();
    totalTebarController.dispose();
    tanggalTebarController.dispose();
    umurAwalController.dispose();
    lamaPersiapanController.dispose();
    super.dispose();
  }
}
