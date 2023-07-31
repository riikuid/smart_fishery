import 'package:flutter/material.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/model/kolam.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/component/fitur_kolam_card.dart';

class ListViewFiturKolam extends StatelessWidget{
  final List<Kolam> listKolam;
  const ListViewFiturKolam({
    super.key,
    required this.listKolam,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: listKolam.length,
        itemBuilder: (context, index) =>
          FiturKolamCard(
            kolam: listKolam[index],
          ),
        separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(
            height: 15,
          )
    );
  }
}