import 'package:common/domain/model/sampling.dart';
import 'package:common/presentation/provider/lihat_detail_provider.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_lihat_detail/ui/component/lihat_detail_page_loader.dart';
import 'package:fitur_lihat_detail/ui/pages/sampling/sampling_table.dart';
import 'package:flutter/material.dart';

class SamplingPage extends StatelessWidget{
  const SamplingPage({super.key});
  @override

  Widget build(BuildContext context) {
    return Consumer<LihatDetailProvider>(
        builder: (context , provider , child){
          return LihatDetailPageLoader<List<Sampling>>(
            buildBody: (listSampling){
              return SamplingTable(listSampling: listSampling);
            },
            futureResponse: provider.listOfSampling
          );
        }
    );
  }
}