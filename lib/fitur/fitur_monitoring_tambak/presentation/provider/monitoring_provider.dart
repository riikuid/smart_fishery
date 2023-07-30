import 'package:common/response/api_response.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/model/kolam.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/model/tambak.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/repository/i_monitoring_repository.dart';

class MonitoringProvider extends ChangeNotifier{
  final IMonitoringRepository _repository;
  MonitoringProvider({
    required IMonitoringRepository repository
  }) : _repository = repository , tambakResponse = repository.getTambak();

  Future<ApiResponse> tambakResponse;
  void onRefreshTambak(){
    tambakResponse = _repository.getTambak();
    notifyListeners();
  }

  int _choosenTambakIndex = 0;
  int get choosenTambakIndex => _choosenTambakIndex;
  void setChoosenTambakIndex(int newIndex){
    _choosenTambakIndex = newIndex;
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
        final Tambak choosenTambak = finishedTambakResponse
            .data[_choosenTambakIndex];
        debugPrint('masuk sini : ${choosenTambak.id}');
        _kolamResponse = _repository.getKolam(
            choosenTambak.id
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
}