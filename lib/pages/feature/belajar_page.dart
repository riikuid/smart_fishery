import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class BelajarPage extends StatelessWidget {
  const BelajarPage({super.key});

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
                  hintText: "What are you craving?",
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Belajar Budidaya",
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
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Image.asset('assets/image_get_help.png'),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "We Here to help so please in touch with us.",
                    style: primaryTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        height: 100,
        width: double.infinity,
        color: Color(0xFFFDFAFA),
        child: Row(
          children: [
            Image.asset(
              'assets/image_whatsapp.png',
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Live Chat',
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Siap menerima saran anda',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 18,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
