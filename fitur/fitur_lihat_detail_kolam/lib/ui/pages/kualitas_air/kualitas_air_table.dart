import 'package:common/domain/model/kualitas_air.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_lihat_detail_kolam/ui/provider/lihat_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:common/themes.dart';

class KualitasAirTable extends StatelessWidget {
  final List<KualitasAir> listKualitasAir;
  KualitasAirTable({
    super.key,
    required this.listKualitasAir,
  });

  late LihatDetailProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context, listen: false);
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
          style: titleTableTextStyle.copyWith(
            fontSize: 11,
          ),
        ),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Text(
          "Sal",
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
          "DO",
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
          "pH",
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
          "Kecerahan",
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
          "",
          textAlign: TextAlign.center,
          style: titleTableTextStyle.copyWith(
            fontSize: 11,
          ),
        ),
      )),
    ],
    decoration: const BoxDecoration(
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
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "${kualitasAir.tanggalPengukuran} - ${kualitasAir.jamPengukuran}",
                  textAlign: TextAlign.left,
                  style: primaryTextStyle.copyWith(
                    letterSpacing: 1.5,
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ])
        ],
        // columnWidths: const {0: FlexColumnWidth()},
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
                color: greenColor,
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
                color: greenColor,
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
                color: greenColor,
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
                color: greenColor,
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
                color: greenColor,
                letterSpacing: 1.5,
                fontSize: 14,
                fontWeight: semibold,
              ),
              textAlign: TextAlign.center,
            )),
            TableCell(
                child: InkWell(
              onTap: () {
                provider.deleteKualitasAir(kualitasAir.id);
              },
              child: Icon(
                Icons.delete,
                color: alertColor,
                size: 20,
              ),
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

      tableBody.add(const Divider());
    }

    return tableBody;
  }
}
