import 'package:common/domain/model/kualitas_air.dart';
import 'package:flutter/material.dart';
import 'package:common/themes.dart';

class KualitasAirTable extends StatelessWidget {
  final List<KualitasAir> listKualitasAir;
  KualitasAirTable({
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

  final _header = TableRow(
    children: [
      TableCell(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Text(
          "Suhu",
          textAlign: TextAlign.center,
          style: titleTableTextStyle,
        ),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Text(
          "Sal",
          textAlign: TextAlign.center,
          style: titleTableTextStyle,
        ),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Text(
          "DO",
          textAlign: TextAlign.center,
          style: titleTableTextStyle,
        ),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Text(
          "pH",
          textAlign: TextAlign.center,
          style: titleTableTextStyle,
        ),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Text(
          "Kecerahan",
          textAlign: TextAlign.center,
          style: titleTableTextStyle,
        ),
      )),
    ],
    decoration: BoxDecoration(
      color: Colors.black12,
    ),
  );

  List<Widget> get tableBody {
    List<Widget> tableBody = [];
    tableBody.add(const SizedBox(
      height: 5,
    ));
    for (var kualitasAir in listKualitasAir) {
      tableBody.add(Table(
        children: [
          TableRow(children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  kualitasAir.tanggal,
                  style: secondaryTextStyle.copyWith(
                    letterSpacing: 1.5,
                    fontSize: 14,
                    fontWeight: semibold,
                  ),
                ),
              ),
            )
          ])
        ],
        columnWidths: const {0: FlexColumnWidth()},
      ));

      tableBody.add(const SizedBox(
        height: 5,
      ));

      tableBody.add(Table(
        children: [
          TableRow(children: [
            TableCell(
                child: Text(
              kualitasAir.suhu.toStringAsFixed(1),
              style: primaryTextStyle.copyWith(
                // color: greenColor,
                letterSpacing: 1.5,
                fontSize: 14,
                fontWeight: semibold,
              ),
              textAlign: TextAlign.center,
            )),
            TableCell(
                child: Text(
              kualitasAir.dO.toStringAsFixed(1),
              style: primaryTextStyle.copyWith(
                // color: greenColor,
                letterSpacing: 1.5,
                fontSize: 14,
                fontWeight: semibold,
              ),
              textAlign: TextAlign.center,
            )),
            TableCell(
                child: Text(
              kualitasAir.sal.toStringAsFixed(1),
              style: primaryTextStyle.copyWith(
                // color: greenColor,
                letterSpacing: 1.5,
                fontSize: 14,
                fontWeight: semibold,
              ),
              textAlign: TextAlign.center,
            )),
            TableCell(
                child: Text(
              kualitasAir.ph.toStringAsFixed(1),
              style: primaryTextStyle.copyWith(
                // color: greenColor,
                letterSpacing: 1.5,
                fontSize: 14,
                fontWeight: semibold,
              ),
              textAlign: TextAlign.center,
            )),
            TableCell(
                child: Text(
              kualitasAir.kecerahan.toStringAsFixed(1),
              style: primaryTextStyle.copyWith(
                // color: greenColor,
                letterSpacing: 1.5,
                fontSize: 14,
                fontWeight: semibold,
              ),
              textAlign: TextAlign.center,
            )),
          ])
        ],
        columnWidths: const {
          0: FlexColumnWidth(),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
          3: FlexColumnWidth(),
          4: FlexColumnWidth(),
        },
      ));

      tableBody.add(Divider());
    }

    return tableBody;
  }
}
