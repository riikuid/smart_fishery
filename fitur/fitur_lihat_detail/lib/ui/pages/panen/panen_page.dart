import 'package:common/domain/model/panen.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_lihat_detail/ui/component/lihat_detail_page_loader.dart';
import 'package:fitur_lihat_detail/ui/pages/panen/panen_table.dart';
import 'package:fitur_lihat_detail/ui/provider/lihat_detail_provider.dart';
import 'package:flutter/material.dart';

class PanenPage extends StatelessWidget{
  const PanenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LihatDetailProvider>(
      builder: (context , provider , child) {
        return LihatDetailPageLoader<List<Panen>>(
            buildBody: (listPanen) =>
              PanenTable(listPanen: listPanen),
            futureResponse: provider.listOfPanen,
        );
      }
    );
  }

}