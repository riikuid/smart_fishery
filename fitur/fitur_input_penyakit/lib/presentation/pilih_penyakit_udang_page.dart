import 'package:common/presentation/error_handler/error_warning.dart';
import 'package:common/response/api_response.dart';
import 'package:common/themes.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_input_penyakit/domain/model/penyakit_udang.dart';
import 'package:fitur_input_penyakit/presentation/input_penyakit_provider.dart';
import 'package:fitur_input_penyakit/presentation/widget/pilih_penyakit_card.dart';
import 'package:flutter/material.dart';

class PilihPenyakitPage extends StatefulWidget {
  const PilihPenyakitPage({super.key});

  @override
  State<PilihPenyakitPage> createState() => PilihPenyakitPageState();
}

class PilihPenyakitPageState extends State<PilihPenyakitPage> {
  String searchKeyword = '';

  @override
  Widget build(BuildContext context) {
    final provider =
        ModalRoute.of(context)?.settings.arguments as InputPenyakitProvider;

    return ChangeNotifierProvider.value(
      value: provider,
      child: Scaffold(
        // backgroundColor: Color(0xFFECE1E1),
        backgroundColor: whiteColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Pilih Nama Penyakit",
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

        body: Column(
          children: [
            searchbar(),
            Expanded(
              child: Consumer<InputPenyakitProvider>(
                  builder: (context, provider, child) {
                return FutureBuilder(
                    future: provider.penyakitUdangResponse,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final apiResponse = snapshot.data!;

                        if (apiResponse is ApiResponseSuccess) {
                          final List<PenyakitUdang> listOfPenyakit =
                              (apiResponse.data as List<PenyakitUdang>)
                                  .where((penyakitUdang) => penyakitUdang
                                      .namaPanjang
                                      .toLowerCase()
                                      .contains(searchKeyword.toLowerCase()))
                                  .toList();

                          return listOfPenyakit.isNotEmpty
                              ? ListView.separated(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  itemCount: listOfPenyakit.length,
                                  itemBuilder: (context, index) =>
                                      PilihPenyakitCard(
                                    penyakitUdang: listOfPenyakit[index],
                                    onTap: () {
                                      provider.setChoosenPenyakitUdang(
                                          listOfPenyakit[index]);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(
                                    height: 15,
                                  ),
                                )
                              : const Center(
                                  child: Text("Belum ada list penyakit"),
                                );
                        } else if (apiResponse is ApiResponseFailed) {
                          debugPrint(apiResponse.errorMessage);
                          return ErrorWarning(
                              onRefresh: provider.onRefreshPenyakitUdang);
                        } else {
                          throw Exception("Gabisa banget");
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    });
              }),
            )
          ],
        ),
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
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchKeyword = value;
                });
              },
              decoration: InputDecoration.collapsed(
                filled: true,
                fillColor: Colors.transparent,
                hintText: "Cari nama penyakit",
                hintStyle: primaryTextStyle.copyWith(
                  color: Colors.grey[500],
                ),
                hoverColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
