import 'package:common/domain/model/penyakit_kolam.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_lihat_detail_kolam/ui/component/lihat_detail_page_loader.dart';
import 'package:fitur_lihat_detail_kolam/ui/pages/penyakit_kolam/penyakit_kolam_table.dart';
import 'package:fitur_lihat_detail_kolam/ui/provider/lihat_detail_provider.dart';
import 'package:flutter/material.dart';

class PenyakitKolamPage extends StatelessWidget {
  const PenyakitKolamPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<LihatDetailProvider>(builder: (context, provider, child) {
      return LihatDetailPageLoader<List<PenyakitKolam>>(
          buildBody: (listPenyakitKolam) {
            return PenyakitKolamTable(listPenyakitKolam: listPenyakitKolam);
          },
          futureResponse: provider.listOfPenyakitKolam);
    });
  }
}
