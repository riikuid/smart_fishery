import 'package:common/themes.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/model/tambak.dart';

class SearchTambakCard extends StatelessWidget {
  final List<Tambak> listOfTambak;
  final Tambak choosenTambak;
  const SearchTambakCard({
    super.key,
    required this.choosenTambak,
    required this.listOfTambak,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      color: const Color(0xFF1B9C85),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/pilih-tambak',
                arguments: listOfTambak,
              );
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Tambak",
                        style: secondaryTextStyle.copyWith(
                          fontSize: 11,
                          fontWeight: medium,
                        ),
                      ),
                      Text(
                        choosenTambak.name,
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semibold,
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30.0,
                    color: Color(0xff999999),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
