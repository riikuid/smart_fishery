import 'package:common/response/response.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_lihat_detail/domain/model/panen.dart';
import 'package:fitur_lihat_detail/ui/provider/detail_provider.dart';
import 'package:flutter/material.dart';

class TablePanen extends StatelessWidget{
  const TablePanen({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    return Consumer<DetailProvider>(
      builder: (context , provider , child) {
        return FutureBuilder(
          future: provider.listOfPanen,
          builder: (context , snapshot) {
            if (snapshot.hasData) {
              final apiResponse = snapshot.data!;
              if (apiResponse is ApiResponseSuccess) {
                return Table(
                  children: [
                    _header,
                    ..._buildDataCells(apiResponse.data!),
                  ],
                  columnWidths: const {
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                    2: FlexColumnWidth(),
                    3: FlexColumnWidth(),
                  },
                );
              }
              else{
                return const Center(
                  child: Column(
                    children: [
                      Text("Gagal tersambung"),
                    ],
                  ),
                );
              }
            }
            else{
              return const Center(child : CircularProgressIndicator());
            }
          }
        );
      }
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

  List<TableRow> _buildDataCells(List<Panen> listPanen) =>
    listPanen.map((Panen data){
      return TableRow(
        children: [
          Text(data.tanggal),
          Text(data.berat.toString()),
          Text(data.size.toString()),
          Text(data.jenis.toString()),
        ]
      );
    }).toList();
}