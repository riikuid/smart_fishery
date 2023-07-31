import 'package:fitur_lihat_detail_kolam/domain/model/sampling.dart';
import 'package:flutter/material.dart';

class SamplingTable extends StatelessWidget{
  final List<Sampling> listSampling;
  const SamplingTable({
    super.key,
    required this.listSampling,
  });


  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0 : FlexColumnWidth(),
        1 : FlexColumnWidth(),
        2 : FlexColumnWidth(),
      },
      children: [
        _tableHeader,
        ..._buildTableBody,
      ],
    );
  }

  final _tableHeader = const TableRow(
    children : [
      TableCell(child: Text("Tanggal")),
      TableCell(child: Text("MBW")),
    ]
  );

  List<TableRow> get _buildTableBody =>
      listSampling.map(
        (sampling) =>
          TableRow(
            children: [
              TableCell(child: Text(sampling.tanggal)),
              TableCell(child: Text(sampling.mbw.toStringAsFixed(1))),
            ]
          )
      ).toList();
}