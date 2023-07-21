import 'package:common/domain/model/kualitas_air.dart';
import 'package:flutter/material.dart';

class KualitasAirTable extends StatelessWidget{
  final List<KualitasAir> listKualitasAir;
  const KualitasAirTable({
    super.key,
    required this.listKualitasAir,
  });


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Table(
          children: [
            _header,
          ],
          columnWidths: const {
            0: FlexColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: FlexColumnWidth(),
            4: FlexColumnWidth(),
          },
        ),

        ...tableBody,
      ],
    );
  }

  final _header = const TableRow(
    children: [
      TableCell(child: Text("Suhu" , textAlign: TextAlign.center,)),
      TableCell(child: Text("Sal" , textAlign: TextAlign.center,)),
      TableCell(child: Text("Do" , textAlign: TextAlign.center,)),
      TableCell(child: Text("Ph" , textAlign: TextAlign.center,)),
      TableCell(child: Text("Orp" , textAlign: TextAlign.center,)),
    ],
    decoration: BoxDecoration(
        color: Colors.black12
    ),
  );

  List<Widget> get tableBody{
    List<Widget> tableBody = [];
    for (var kualitasAir in listKualitasAir){
      tableBody.add(
          Table(
            children: [
              TableRow(
                  children: [
                    TableCell(
                      child: Text(kualitasAir.tanggal),
                    )
                  ]
              )
            ],
            columnWidths: const {
              0 : FlexColumnWidth()
            },
          )
      );

      tableBody.add(
          Table(
            children: [
              TableRow(
                  children: [
                    TableCell(
                        child: Text(
                            kualitasAir.suhu.toStringAsFixed(1),
                            textAlign: TextAlign.center,
                        )
                    ),
                    TableCell(
                        child: Text(
                            kualitasAir.dO.toStringAsFixed(1),
                            textAlign: TextAlign.center,
                        )
                    ),
                    TableCell(
                        child: Text(
                            kualitasAir.sal.toStringAsFixed(1),
                            textAlign: TextAlign.center,
                        )
                    ),
                    TableCell(
                        child: Text(
                            kualitasAir.ph.toStringAsFixed(1),
                            textAlign: TextAlign.center,
                        )
                    ),
                    TableCell(
                        child: Text(
                            kualitasAir.orp.toStringAsFixed(1),
                            textAlign: TextAlign.center,
                        )
                    ),

                  ]
              )
            ],
            columnWidths: const {
              0: FlexColumnWidth(),
              1: FlexColumnWidth(),
              2: FlexColumnWidth(),
              3: FlexColumnWidth(),
              4: FlexColumnWidth(),
            },
          )
      );
    }

    return tableBody;
  }
}