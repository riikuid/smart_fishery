import 'package:common/domain/repository/i_panen_repository.dart';
import 'package:common/response/api_response.dart';
import 'package:common/domain/model/kolam.dart';
import 'package:flutter/material.dart';

class LihatDetailProvider extends ChangeNotifier{
  final ILihatDetailRepository repository;
  final int idKolam;

  LihatDetailProvider({
    required this.repository,
    required this.idKolam
  }) : detailResponse = repository.getKolam(idKolam);

  Future<ApiResponse> detailResponse;

  void refreshData(){
    detailResponse = repository.getKolam(idKolam);
    notifyListeners();
  }

  Future<ApiResponse> get listOfPanen async {
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
    Future<ApiResponse> get listOfKualitasAir async {
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
    Future<ApiResponse> get listOfPenyakit async {
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
    Future<ApiResponse> get listOfSampling async {
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