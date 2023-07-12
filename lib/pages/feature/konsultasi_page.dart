import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/core.dart';

class KonsultasiPage extends StatelessWidget {
  const KonsultasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget phoneCard() {
      return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0x19000000),
                blurRadius: 5,
                offset: Offset(0, 2),
                spreadRadius: 2),
          ],
        ),
        // height: MediaQuery.of(context).size.width * 0.3,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                color: Color(0xFFFBF4F4),
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
              ),
              child: Icon(
                Icons.phone,
                size: MediaQuery.of(context).size.width * 0.08,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Phone Number",
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    color: bannerTextColor,
                  ),
                ),
                Text(
                  "+62 876-456-999",
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    color: bannerTextColor,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget emailCard() {
      return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0x19000000),
                blurRadius: 5,
                offset: Offset(0, 2),
                spreadRadius: 2),
          ],
        ),
        // height: MediaQuery.of(context).size.width * 0.3,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                color: Color(0xFFFBF4F4),
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
              ),
              child: Icon(
                Icons.email_outlined,
                size: MediaQuery.of(context).size.width * 0.08,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "E-mail Address",
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    color: bannerTextColor,
                  ),
                ),
                Text(
                  "abaditambak@outlook.com",
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    color: bannerTextColor,
                  ),
                )
              ],
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
          "Get Help",
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
      body: SingleChildScrollView(
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
              phoneCard(),
              SizedBox(
                height: 10,
              ),
              emailCard(),
            ],
          ),
        ),
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
