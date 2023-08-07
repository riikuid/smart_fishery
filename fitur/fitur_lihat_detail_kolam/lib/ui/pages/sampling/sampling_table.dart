import 'package:common/domain/model/sampling.dart';
import 'package:common/themes.dart';
import 'package:dependencies/intl.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_lihat_detail_kolam/ui/provider/lihat_detail_provider.dart';
import 'package:flutter/material.dart';

class SamplingTable extends StatelessWidget {
  final List<Sampling> listSampling;
  SamplingTable({
    super.key,
    required this.listSampling,
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
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(),
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
          "MBW",
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
          "FR",
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
          "Kondisi Udang",
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
    for (var sampling in listSampling) {
      tableBody.add(Table(
        children: [
          TableRow(children: [
            TableCell(
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                DateFormat('dd MMMM yyyy', "id_ID").format(sampling.tanggal),
                textAlign: TextAlign.left,
                style: primaryTextStyle.copyWith(
                  letterSpacing: 1.5,
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            )),
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
              "${sampling.mbw.toStringAsFixed(1)} g",
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
              "${sampling.fr.toStringAsFixed(1)}%",
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
              sampling.kondisiUdang,
              style: primaryTextStyle.copyWith(
                color: greenColor,
                letterSpacing: 1.5,
                fontSize: 14,
                fontWeight: semibold,
              ),
              textAlign: TextAlign.center,
            )),
            TableCell(
                //   child: InkWell(
                // onTap: () {
                //   provider.deleteKualitasAir(kualitasAir.id);
                // },
                child: Icon(
              Icons.delete,
              color: alertColor,
              size: 20,
            )),
          ])
        ],
        columnWidths: const {
          0: FlexColumnWidth(),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(),
        },
      ));

      tableBody.add(const Divider());
    }

    return tableBody;
  }
}
