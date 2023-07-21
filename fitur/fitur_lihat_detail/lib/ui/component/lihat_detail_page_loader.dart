import 'package:common/response/response.dart';
import 'package:flutter/material.dart';

class LihatDetailPageLoader<T> extends StatelessWidget{
  final void Function() onRefresh;

  // masalahnya kenapa disini gak pake consumer,
  // karena untuk dapetin future response, kita butuh providernya
  // sedangkan method dari providernya beda-beda
  // jadi karena itu consumernya harus ditaruh diluar class ini
  // agar methodnya bisa dibeda-bedain
  final Future<Response> futureResponse;
  final Widget Function(T) buildBody;


  const LihatDetailPageLoader({
    super.key,
    required this.onRefresh,
    required this.buildBody,
    required this.futureResponse,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureResponse,
      builder: (context , snapshot){
        if (snapshot.hasData){
          final apiResponse = snapshot.data!;
          if (apiResponse is ApiResponseSuccess<T>){
            return buildBody(apiResponse.data as T);
          }
          else if (apiResponse is ApiResponseFailed){
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.wifi_off),
                  Text(apiResponse.errorMessage.toString()),
                ],
              ),
            );
          }
          else{
            throw Exception("Unknown exception muncul");
          }
        }
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}