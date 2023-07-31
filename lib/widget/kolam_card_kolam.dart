import 'package:common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/core.dart';

class KolamCard extends StatelessWidget {
  const KolamCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                "19 Hari",
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
                "10 ekor",
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
                "20 m\u00B2",
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
        const idKolam = -1;
        Navigator.of(context)
            .pushNamed(Routes.lihatDetailKolamRoute, arguments: idKolam);
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
            Text(
              "Kolam A1",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            Text(
              "Tanggal Tebar - 27 Jan 2023",
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
            // nothing(),
          ],
        ),
      ),
    );
  }
}
