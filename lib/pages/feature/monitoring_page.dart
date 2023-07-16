import 'package:flutter/material.dart';
import 'package:smart_fishery/core.dart';
import 'package:smart_fishery/widget/monitoring_kolam_card.dart';

class MonitoringPage extends StatelessWidget {
  const MonitoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget pilihTambak() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        color: Color(0xFF1B9C85),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/pilih-tambak');
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          "Tambak Sidoarjo",
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

    return Scaffold(
      // backgroundColor: Color(0xFFECE1E1),
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Monitoring",
          style: primaryTextStyle.copyWith(
            fontWeight: bold,
            color: whiteColor,
          ),
        ),
        backgroundColor: Color(0xFF1B9C85),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
        ),
      ),

      body: Column(
        children: [
          pilihTambak(),
          Expanded(
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: 15,
                  itemBuilder: (context, index) => MonitoringKolamCard(),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                        height: 15,
                      )),
            ),
          )
        ],
      ),
    );
  }
}
