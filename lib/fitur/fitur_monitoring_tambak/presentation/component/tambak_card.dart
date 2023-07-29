import 'package:common/themes.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/model/tambak.dart';

class TambakCard extends StatelessWidget {
  final Tambak tambak;
  final void Function() onTap;
  const TambakCard({
    super.key,
    required this.tambak,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                // width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tambak.name,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      tambak.createdAt,
                      style: secondaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(right: 10),
            //   // color: Colors.yellow,
            //   // width: double.infinity,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //       Text(
            //         "Rp. 16.000",
            //         style: primaryTextStyle.copyWith(
            //           fontWeight: bold,
            //           color: Color(0xFF1B9C85),
            //           fontSize: 16,
            //         ),
            //       ),
            //       Text(
            //         "Size 100",
            //         style: primaryTextStyle.copyWith(
            //           fontWeight: medium,
            //           fontSize: 14,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
