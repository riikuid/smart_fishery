import 'package:common/domain/model/panen.dart';
import 'package:flutter/material.dart';

class PanenTable extends StatelessWidget{
  final List<Panen> listPanen;
  const PanenTable({
    super.key,
    required this.listPanen,
  });

  @override
  Widget build(BuildContext context){
    return Table(
      children: [
        _header,
        ..._body,
      ],
      columnWidths: const {
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
        3: FlexColumnWidth(),
      },
    );
  }

  final _header = const TableRow(
      children: [
        Text('Tanggal'),
        Text('Berat'),
        Text('Size'),
        Text('Jenis'),
      ],
      decoration: BoxDecoration(
        color: Colors.black12
      )
  );

  List<TableRow> get _body =>
    listPanen.map((Panen data){
      return TableRow(
        children: [
          Text(data.tanggal),
          Text(data.totalBerat.toString()),
          Text(data.sizeUdang.toString()),
          Text(data.jenisPanen.toString()),
        ]
      );
    }).toList();
}