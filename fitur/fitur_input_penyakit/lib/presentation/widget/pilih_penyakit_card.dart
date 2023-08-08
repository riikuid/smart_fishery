import 'package:common/themes.dart';
import 'package:dependencies/intl.dart';
import 'package:fitur_input_penyakit/domain/model/penyakit_udang.dart';
import 'package:flutter/material.dart';
import 'package:common/domain/model/tambak.dart';

class PilihPenyakitCard extends StatelessWidget {
  final PenyakitUdang penyakitUdang;
  final void Function() onTap;
  const PilihPenyakitCard({
    super.key,
    required this.penyakitUdang,
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
                      penyakitUdang.namaPendek,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      penyakitUdang.namaPanjang,
                      style: secondaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
