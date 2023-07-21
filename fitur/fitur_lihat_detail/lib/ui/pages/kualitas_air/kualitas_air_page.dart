import 'package:common/domain/model/kualitas_air.dart';
import 'package:common/presentation/provider/detail_provider.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_lihat_detail/ui/component/lihat_detail_page_loader.dart';
import 'package:fitur_lihat_detail/ui/pages/kualitas_air/kualitas_air_table.dart';
import 'package:flutter/material.dart';

class KualitasAirPage extends StatelessWidget{
  const KualitasAirPage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProvider>(
      builder: (context , provider , child) {
        return LihatDetailPageLoader(
            onRefresh: (){
              provider.refreshData(
                ModalRoute.of(context)?.settings.arguments as int
              );
            },
            buildBody: (List<KualitasAir> listKualitasAir) =>
              KualitasAirTable(listKualitasAir: listKualitasAir),
            futureResponse: provider.listOfKualitasAir,
        );
      }
    );
  }
}