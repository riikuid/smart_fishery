import 'package:common/domain/model/panen.dart';
import 'package:common/presentation/provider/detail_provider.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_lihat_detail/ui/component/lihat_detail_page_loader.dart';
import 'package:fitur_lihat_detail/ui/pages/panen/panen_table.dart';
import 'package:flutter/material.dart';

class PanenPage extends StatelessWidget{
  const PanenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProvider>(
      builder: (context , provider , child) {
        return LihatDetailPageLoader<List<Panen>>(
            onRefresh: (){
              provider.refreshData(
                ModalRoute.of(context)?.settings.arguments as int
              );
            },
            buildBody: (listPanen) =>
              PanenTable(listPanen: listPanen),
            futureResponse: provider.listOfPanen,
        );
      }
    );
  }

}