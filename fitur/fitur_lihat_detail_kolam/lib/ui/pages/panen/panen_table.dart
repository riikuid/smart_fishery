import 'package:common/domain/model/panen.dart';
import 'package:common/themes.dart';
import 'package:flutter/material.dart';

class PanenTable extends StatelessWidget{
  final List<Panen> listPanen;
  PanenTable({
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
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
        3: FlexColumnWidth(),
      },
    );
  }

  final _header = TableRow(
    children: [
      TableCell(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Text(
          "Tanggal",
          textAlign: TextAlign.center,
          style: titleTableTextStyle.copyWith(
            fontSize: 11,
          ),
        ),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Text(
          "Berat",
          textAlign: TextAlign.center,
          style: titleTableTextStyle.copyWith(
            fontSize: 11,
          ),
        ),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Text(
          "Size",
          textAlign: TextAlign.center,
          style: titleTableTextStyle.copyWith(
            fontSize: 11,
          ),
        ),
      )),
      TableCell(
        
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Text(
          "Jenis",
          textAlign: TextAlign.center,
          style: titleTableTextStyle.copyWith(
            fontSize: 11,
          ),
        ),
      )),
      
    ],
    decoration: BoxDecoration(
      color: Colors.black12,
    ),
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