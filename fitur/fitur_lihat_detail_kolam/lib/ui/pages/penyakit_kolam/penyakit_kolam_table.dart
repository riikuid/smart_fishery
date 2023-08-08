import 'package:common/domain/model/penyakit_kolam.dart';
import 'package:common/themes.dart';
import 'package:dependencies/intl.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_lihat_detail_kolam/ui/provider/lihat_detail_provider.dart';
import 'package:flutter/material.dart';

class PenyakitKolamTable extends StatelessWidget {
  final List<PenyakitKolam> listPenyakitKolam;
  PenyakitKolamTable({
    super.key,
    required this.listPenyakitKolam,
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
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(1),
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
        padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
        child: Text(
          "Nama Penyakit",
          textAlign: TextAlign.left,
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
    for (var penyakitKolam in listPenyakitKolam) {
      tableBody.add(Table(
        children: [
          TableRow(children: [
            TableCell(
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                DateFormat('dd MMMM yyyy', "id_ID")
                    .format(penyakitKolam.tanggal),
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
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                penyakitKolam.namaPenyakit,
                style: primaryTextStyle.copyWith(
                  color: greenColor,
                  letterSpacing: 1.5,
                  fontSize: 14,
                  fontWeight: semibold,
                ),
                textAlign: TextAlign.left,
              ),
            )),
            TableCell(
                child: InkWell(
              onTap: () {
                provider.deletePenyakitKolam(penyakitKolam.id);
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
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(),
        },
      ));

      tableBody.add(const Divider());
    }

    return tableBody;
  }
}
