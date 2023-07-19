import 'package:common/response/response.dart';
import 'package:fitur_lihat_detail_panen/domain/model/kolam.dart';
import 'package:fitur_lihat_detail_panen/domain/repository/i_panen_repository.dart';
import 'package:flutter/material.dart';

class DetailProvider extends ChangeNotifier{
  final IPanenRepository repository;
  DetailProvider({
    required this.repository
  });

  late Future<Response> detailResponse;

  void refreshData(int idKolam){
    detailResponse = repository.getKolam(idKolam);
    notifyListeners();
  }

  Future<Response> get listOfPanen async {
    final apiResponse = await detailResponse;
    if (apiResponse is ApiResponseSuccess<Kolam>){
      return ApiResponseSuccess(
        data: apiResponse.data!.listPanen,
      );
    }
    else{
      return apiResponse;
    }
  }
    Future<Response> get listOfKualitasAir async {
    final apiResponse = await detailResponse;
    if (apiResponse is ApiResponseSuccess<Kolam>){
      return ApiResponseSuccess(
        data: apiResponse.data!.listKualitasAir,
      );
    }
    else{
      return apiResponse;
    }
  }
    Future<Response> get listOfPenyakit async {
    final apiResponse = await detailResponse;
    if (apiResponse is ApiResponseSuccess<Kolam>){
      return ApiResponseSuccess(
        data: apiResponse.data!.listPenyakit,
      );
    }
    else{
      return apiResponse;
    }
  }
    Future<Response> get listOfSampling async {
    final apiResponse = await detailResponse;
    if (apiResponse is ApiResponseSuccess<Kolam>){
      return ApiResponseSuccess(
        data: apiResponse.data!.listSampling,
      );
    }
    else{
      return apiResponse;
    }
  }

}