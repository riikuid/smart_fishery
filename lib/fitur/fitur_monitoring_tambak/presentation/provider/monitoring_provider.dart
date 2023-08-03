import 'package:common/response/api_response.dart';
import 'package:dependencies/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:common/domain/model/kolam.dart';
import 'package:common/domain/model/tambak.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/repository/i_kolam_repository.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/repository/i_monitoring_repository.dart';

class MonitoringProvider extends ChangeNotifier{
  final IMonitoringRepository _repository;
  final IKolamRepository kolamRepository;
  MonitoringProvider({
    required IMonitoringRepository repository,
    required this.kolamRepository,
  }) : _repository = repository ,
      tambakResponse = repository.getTambak();

  Future<ApiResponse> tambakResponse;
  void onRefreshTambak(){
    tambakResponse = _repository.getTambak();
    onRefreshKolam();
    notifyListeners();
  }

  Tambak? _choosenTambak;
  Tambak? get choosenTambak => _choosenTambak;
  void setChoosenTambak(Tambak newChoosenTambak){
    _choosenTambak = newChoosenTambak;
    onRefreshKolam();
    notifyListeners();
  }

  Future<ApiResponse>? _kolamResponse;
  Future<ApiResponse> get kolamResponse async {
    if (_kolamResponse == null) {
      await onRefreshKolam();
    }
    return _kolamResponse!;
  }

  Future<void> onRefreshKolam() async {
    final finishedTambakResponse = await tambakResponse;
    if (finishedTambakResponse is ApiResponseSuccess){
      if (finishedTambakResponse.data.isNotEmpty) {
        _choosenTambak ??= finishedTambakResponse.data.first;
        debugPrint('choosen tambak id : ${choosenTambak!.id}');
        _kolamResponse = _repository.getKolam(
            choosenTambak!.id
        );
      }
      else{
        _kolamResponse = Future.value(
          ApiResponseSuccess(data: <Kolam>[])
        );
      }
      notifyListeners();
    }
    else {
      throw Exception("Unknown Exception");
    }
  }

  ApiResponse deleteKolamResponse = ApiResponseFailed();
  void deleteKolam(String idKolam) async {
    if (deleteKolamResponse is! ApiResponseLoading){
      deleteKolamResponse = ApiResponseLoading();

      deleteKolamResponse = await kolamRepository.deleteKolam(
        idKolam: idKolam
      ).then((value){
        if (value is ApiResponseFailed)
          Fluttertoast.showToast(msg: "Gagal menghapus kolam, periksa internet anda!");
        return value;
      });
      onRefreshKolam();
    }
  }
}