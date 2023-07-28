// ignore_for_file: unused_import

import 'package:dependencies/intl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/models/harga_udang_model.dart';

import '../theme.dart';

class HargaUdangCard extends StatelessWidget {
  final HargaUdangModel hargaUdang;
  const HargaUdangCard(this.hargaUdang);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
        boxShadow: [
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage('assets/image_udang.png'),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(100.0),
              ),
            ),
          ),
          Expanded(
            child: Container(
              // width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hargaUdang.kota,
                    style: primaryTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    hargaUdang.provinsi,
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            // color: Colors.yellow,
            // width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  NumberFormat.currency(
                    locale: 'id', // sesuaikan dengan locale yang diinginkan
                    symbol: 'Rp. ',
                    decimalDigits: 0, // jumlah digit dibelakang koma
                  ).format(hargaUdang.harga),
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    color: Color(0xFF1B9C85),
                    fontSize: 16,
                  ),
                ),
                Text(
                  hargaUdang.size.toString(),
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
