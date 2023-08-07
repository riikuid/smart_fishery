import 'package:common/domain/model/panen.dart';
import 'package:common/themes.dart';
import 'package:dependencies/intl.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_lihat_detail_kolam/ui/provider/lihat_detail_provider.dart';
import 'package:flutter/material.dart';

class PanenTable extends StatelessWidget {
  final List<Panen> listPanen;
  PanenTable({
    super.key,
    required this.listPanen,
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
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
            3: FlexColumnWidth(2),
            4: FlexColumnWidth(1),
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
      TableCell(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Text(
          "Harga/kg",
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
    decoration: BoxDecoration(
      color: Colors.black12,
    ),
  );

  List<Widget> get tableBody {
    List<Widget> tableBody = [];
    tableBody.add(const SizedBox(
      height: 7,
    ));
    for (var panen in listPanen) {
      tableBody.add(Table(
        children: [
          TableRow(children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  DateFormat('dd MMMM yyyy', "id_ID").format(panen.tanggal),
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
              panen.totalBerat.toStringAsFixed(2),
              style: primaryTextStyle.copyWith(
                color: greenColor,
                letterSpacing: 1.5,
                fontSize: 12,
                fontWeight: semibold,
              ),
              textAlign: TextAlign.center,
            )),
            TableCell(
                child: Text(
              panen.sizeUdang.toString(),
              style: primaryTextStyle.copyWith(
                color: greenColor,
                letterSpacing: 1.5,
                fontSize: 12,
                fontWeight: semibold,
              ),
              textAlign: TextAlign.center,
            )),
            TableCell(
                child: Text(
              panen.jenisPanen,
              style: primaryTextStyle.copyWith(
                color: greenColor,
                letterSpacing: 1.5,
                fontSize: 12,
                fontWeight: semibold,
              ),
              textAlign: TextAlign.center,
            )),
            TableCell(
                child: Text(
              NumberFormat("#,###").format(panen.hargaPerKilo),
              style: primaryTextStyle.copyWith(
                color: greenColor,
                letterSpacing: 1.5,
                fontSize: 12,
                fontWeight: semibold,
              ),
              textAlign: TextAlign.center,
            )),
            TableCell(
              child: InkWell(
                onTap: () {
                  provider.deletePanen(panen.id);
                },
                child: Icon(
                  Icons.delete,
                  color: alertColor,
                  size: 20,
                ),
              ),
            )
          ])
        ],
        columnWidths: const {
          0: FlexColumnWidth(),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
          3: FlexColumnWidth(2),
          4: FlexColumnWidth(1),
        },
      ));

      // tableBody.add(const SizedBox(
      //   height: 5,
      // ));

      tableBody.add(const Divider());
      tableBody.add(Table(
        children: [
          TableRow(
              // decoration: BoxDecoration(
              //   color: secondaryTextColor,
              // ),
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Total Panen: Rp. ${NumberFormat("#,###").format(panen.totalHarga)}",
                      textAlign: TextAlign.left,
                      style: primaryTextStyle.copyWith(
                        // color: greenColor,
                        letterSpacing: 1,
                        fontSize: 12,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                ),
              ])
        ],
      ));

      tableBody.add(const Divider());
    }

    return tableBody;
  }
}
