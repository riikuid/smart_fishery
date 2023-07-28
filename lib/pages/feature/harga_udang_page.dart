import 'package:flutter/material.dart';
import 'package:smart_fishery/widget/harga_udang_card.dart';

import '../../theme.dart';

class HargaUdangPage extends StatefulWidget {
  const HargaUdangPage({super.key});

  @override
  State<HargaUdangPage> createState() => _HargaUdangPageState();
}

class _HargaUdangPageState extends State<HargaUdangPage> {
  @override
  Widget build(BuildContext context) {
    Widget searchbar() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 12.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFF1F2F6),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Colors.grey[500],
              ),
            ),
            Expanded(
              child: TextFormField(
                initialValue: null,
                decoration: InputDecoration.collapsed(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: "Cari lokasi yang ingin kamu ketahui",
                  hintStyle: primaryTextStyle.copyWith(
                    color: Colors.grey[500],
                  ),
                  hoverColor: Colors.transparent,
                ),
                onFieldSubmitted: (value) {},
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      // backgroundColor: Color(0xFFECE1E1),
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Harga Udang",
          style: primaryTextStyle.copyWith(fontWeight: bold),
        ),
        backgroundColor: whiteColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xFF1B9C85),
          ),
        ),
      ),
      body: Column(
        children: [
          searchbar(),
          Expanded(
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: 15,
                  itemBuilder: (context, index) => HargaUdangCard(),
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
