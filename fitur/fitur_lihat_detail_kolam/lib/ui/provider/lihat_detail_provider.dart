import 'package:common/response/api_response.dart';
import 'package:fitur_lihat_detail_kolam/domain/model/detail_kolam.dart';
import 'package:fitur_lihat_detail_kolam/domain/repository/i_edit_kualitas_air_repository.dart';
import 'package:fitur_lihat_detail_kolam/domain/repository/i_lihat_detail_kolam_repository.dart';
import 'package:flutter/material.dart';

class LihatDetailProvider extends ChangeNotifier{
  final ILihatDetailKolamRepository getDetailKolamRepository;
  final IEditKualitasAirRepository editKualitasAirRepository;
  final String idKolam;

  LihatDetailProvider({
    required this.getDetailKolamRepository,
    required this.editKualitasAirRepository,
    required this.idKolam
  }) : detailResponse = getDetailKolamRepository.getKolam(idKolam);

  Future<ApiResponse> detailResponse;

  void refreshData(){
    detailResponse = getDetailKolamRepository.getKolam(idKolam);
    notifyListeners();
  }

  Future<ApiResponse> get listOfPanen async {
    final apiResponse = await detailResponse;
    if (apiResponse is ApiResponseSuccess<DetailKolam>){
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
    if (apiResponse is ApiResponseSuccess<DetailKolam>){
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
    if (apiResponse is ApiResponseSuccess<DetailKolam>){
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
    if (apiResponse is ApiResponseSuccess<DetailKolam>){
      return ApiResponseSuccess(
        data: apiResponse.data!.listSampling,
      );
    }
    else{
      return apiResponse;
    }
  }

  ApiResponse _deleteKualitasAirResponse = ApiResponseFailed();
  void deleteKualitasAir(String idKualitasAir) async {
    if (_deleteKualitasAirResponse is! ApiResponseLoading){
      _deleteKualitasAirResponse = ApiResponseLoading();

      _deleteKualitasAirResponse = await editKualitasAirRepository
          .deleteKualitasAir(idKualitasAir).then((value){
        if (value is ApiResponseSuccess){
          refreshData();
        }
        return value;
      });
    }
  }
}