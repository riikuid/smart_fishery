import 'package:common/response/api_response.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/model/tambak.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/repository/i_monitoring_repository.dart';

class MonitoringProvider extends ChangeNotifier{
  final IMonitoringRepository _repository;
  MonitoringProvider({
    required IMonitoringRepository repository
  }) : _repository = repository;

  late List<Tambak> listOfTambak;
  Future<ApiResponse> getTambak() async {
    final response = await _repository.getTambak();
    if (response is ApiResponseSuccess){
      listOfTambak = response.data;
    }
    return response;
  }

  void onRefresh(){
    notifyListeners();
  }

  int _choosenTambakIndex = 0;
  int get choosenTambakIndex => _choosenTambakIndex;
  void setChoosenTambakIndex(int newIndex){
    _choosenTambakIndex = newIndex;
  }
}