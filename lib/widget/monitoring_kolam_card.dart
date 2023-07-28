import 'package:common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/core.dart';

class MonitoringKolamCard extends StatelessWidget {
  const MonitoringKolamCard({super.key});

  @override
  Widget build(BuildContext context) {
    content() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "30.08",
                style: primaryTextStyle.copyWith(
                  color: const Color(0xFF0079FF),
                  fontWeight: semibold,
                ),
              ),
              Text(
                "Suhu",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "2.54",
                style: primaryTextStyle.copyWith(
                  color: const Color(0xFFC82C2C),
                  fontWeight: semibold,
                ),
              ),
              Text(
                "Do",
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "15.25",
                style: primaryTextStyle.copyWith(
                  color: const Color(0xFF0079FF),
                  fontWeight: semibold,
                ),
              ),
              Text(
                "Sal",
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "3.43",
                style: primaryTextStyle.copyWith(
                  color: const Color(0xFFC82C2C),
                  fontWeight: semibold,
                ),
              ),
              Text(
                "pH",
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "30.08",
                style: primaryTextStyle.copyWith(
                  color: const Color(0xFF0079FF),
                  fontWeight: semibold,
                ),
              ),
              Text(
                "Kecerahan",
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      );
    }

    nullHandle() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "-",
                style: primaryTextStyle.copyWith(
                  color: secondaryTextColor,
                  fontWeight: semibold,
                ),
              ),
              Text(
                "Suhu",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "-",
                style: primaryTextStyle.copyWith(
                  color: secondaryTextColor,
                  fontWeight: semibold,
                ),
              ),
              Text(
                "Do",
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "-",
                style: primaryTextStyle.copyWith(
                  color: secondaryTextColor,
                  fontWeight: semibold,
                ),
              ),
              Text(
                "Sal",
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "-",
                style: primaryTextStyle.copyWith(
                  color: secondaryTextColor,
                  fontWeight: semibold,
                ),
              ),
              Text(
                "pH",
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "-",
                style: primaryTextStyle.copyWith(
                  color: secondaryTextColor,
                  fontWeight: semibold,
                ),
              ),
              Text(
                "Kecerahan",
                style: primaryTextStyle.copyWith(fontSize: 12),
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
              "Update Terakhir - 29 Februari (19:24)",
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
            // content(),
            nullHandle(),
          ],
        ),
      ),
    );
  }
}
