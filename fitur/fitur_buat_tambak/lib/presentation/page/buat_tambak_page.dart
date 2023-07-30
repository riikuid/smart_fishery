import 'package:common/themes.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_buat_tambak/presentation/provider/buat_tambak_provider.dart';
import 'package:flutter/material.dart';

class BuatTambakPage extends StatefulWidget {
  const BuatTambakPage({super.key});

  @override
  State<BuatTambakPage> createState() => _BuatTambakPageState();
}

class _BuatTambakPageState extends State<BuatTambakPage> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BuatTambakProvider(),
      child: Consumer<BuatTambakProvider>(
        builder: (context , provider , child) {
          return Scaffold(
            // backgroundColor: Color(0xFFECE1E1),
            backgroundColor: whiteColor,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Buat Tambak Baru",
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
                        "Nama Tambak",
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semibold,
                        ),
                      ),
                      Text(
                        " *",
                        style: primaryTextStyle.copyWith(
                          color: alertColor,
                          fontSize: 14,
                          fontWeight: semibold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: textEditingController,
                    style: primaryTextStyle.copyWith(),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.blueGrey.withOpacity(0.5),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: greenColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: InkWell(
              onTap: () async {

              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Text(
                  "Buat Tambak",
                  textAlign: TextAlign.center,
                  style: primaryTextStyle.copyWith(
                    color: whiteColor,
                    fontWeight: semibold,
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
