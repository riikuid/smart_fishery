import 'package:common/routes/routes.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:dependencies/intl.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/core.dart';
import 'package:common/domain/model/kolam.dart';

class FiturKolamCard extends StatelessWidget {
  final Kolam kolam;
  const FiturKolamCard({
    super.key,
    required this.kolam,
  });

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("dd MMMM yyyy", "id_ID");

    int hitungUmur(String tanggalTebar) {
      DateTime tanggalTebar = dateFormat.parse(kolam.tanggalTebar);
      int umurTebaran = DateTime.now().difference(tanggalTebar).inDays.abs();
      return umurTebaran;
    }

    String hitungLuas(double panjang, double luas) {
      return (panjang * luas).toStringAsFixed(2);
    }

    content() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Umur",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              Text(
                "${hitungUmur(kolam.tanggalTebar)} Hari",
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tebaran",
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
              Text(
                kolam.totalTebar.toString(),
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Luas",
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
              Text(
                "${hitungLuas(kolam.lebarKolam, kolam.panjangKolam)} m\u00B2",
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                ),
              ),
            ],
          ),
        ],
      );
    }

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.lihatDetailKolamRoute, arguments: kolam);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 6,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    kolam.namaKolam,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: ()async {
                    if (await confirm(
              context,
              title:  Text('CONFIRM', 
              style: primaryTextStyle.copyWith(
                fontWeight: semibold, fontSize: 16,
              ),),
              content:  Text('Would you like to remove?', style: primaryTextStyle.copyWith(
                fontWeight: medium, fontSize: 16,
              ),),
              textOK:  Text('Yes', style: primaryTextStyle.copyWith(
                fontWeight: semibold, fontSize: 16, color: const Color(0xFF0079FF),
              ),),
              textCancel:  Text('No', style: primaryTextStyle.copyWith(
                fontWeight: semibold, fontSize: 16, color: const Color(0xFFC82C2C),
              ),),
              
            )) {
              return print('pressedOK');
            }
            return print('pressedCancel');
                  },
                  child: Icon(
                                Icons.delete,
                                color: alertColor,
                                size: 18,
                              ),
                ),
              ],
            ),
            Text(
              "Tanggal Tebaran - ${kolam.tanggalTebar}",
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            content(),
            // nullHandle(),
          ],
        ),
      ),
    );
  }
}
