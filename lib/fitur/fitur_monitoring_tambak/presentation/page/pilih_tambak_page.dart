import 'package:flutter/material.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/domain/model/tambak.dart';
import 'package:smart_fishery/pages/feature/tambak/buat_tambak_page.dart';
import 'package:smart_fishery/theme.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/component/tambak_card.dart';

class PilihTambakPage extends StatelessWidget {
  const PilihTambakPage({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfTambak = ModalRoute.of(context)?.settings.arguments as List<Tambak>;

    return Scaffold(
      // backgroundColor: Color(0xFFECE1E1),
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Pilih Tambak",
          style: primaryTextStyle.copyWith(fontWeight: bold),
        ),
        backgroundColor: whiteColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1B9C85),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BuatTambakPage()),
          );
        },
        backgroundColor: const Color(0xFF1B9C85),
        child: const Icon(
          Icons.add,
          size: 24.0,
        ),
      ),
      body: Column(
        children: [
          searchbar(),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: listOfTambak.length,
                itemBuilder: (context, index) => TambakCard(
                  tambak: listOfTambak[index],
                ),
                separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    height: 15,
                  ),
            ),
          )
        ],
      ),
    );
  }

  Widget searchbar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 12.0,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFF1F2F6),
        borderRadius: BorderRadius.all(
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
                hintText: "Cari nama tambak anda",
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
}
