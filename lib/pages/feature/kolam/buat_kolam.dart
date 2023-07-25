import 'package:flutter/material.dart';
import 'package:smart_fishery/theme.dart';
import 'package:smart_fishery/widget/normal_form.dart';

class BuatKolam extends StatelessWidget {
  const BuatKolam({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namaKolamController = TextEditingController(text: '');
    TextEditingController panjangKolamController =
        TextEditingController(text: '');
    TextEditingController lebarKolamController =
        TextEditingController(text: '');
    TextEditingController kedalamanKolamController =
        TextEditingController(text: '');

    return Scaffold(
      // backgroundColor: Color(0xFFECE1E1),
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Buat Kolam Baru",
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

      body: Container(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Buat Kolam untuk tambak",
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semibold,
                  ),
                ),
                Text(
                  " *",
                  style: primaryTextStyle.copyWith(
                    color: alertColor,
                    fontSize: 12,
                    fontWeight: semibold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: true,
              style: primaryTextStyle.copyWith(
                fontSize: 12,
              ),
              decoration: InputDecoration(
                hintText: "Tambak Sidoarjo",
                hintStyle: secondaryTextStyle.copyWith(
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blueGrey.withOpacity(0.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blueGrey.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            NormalForm(
              "Nama Kolam",
              namaKolamController,
              TextInputType.name,
              true,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: NormalForm(
                    "Panjang Kolam (m)",
                    panjangKolamController,
                    TextInputType.number,
                    true,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: NormalForm(
                    "Lebar Kolam (m)",
                    lebarKolamController,
                    TextInputType.number,
                    true,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: NormalForm(
                "Kedalaman Kolam (m)",
                kedalamanKolamController,
                TextInputType.number,
                true,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Text(
          "Buat Kolam",
          textAlign: TextAlign.center,
          style: primaryTextStyle.copyWith(
            color: whiteColor,
            fontWeight: semibold,
          ),
        ),
      ),
    );
  }
}
