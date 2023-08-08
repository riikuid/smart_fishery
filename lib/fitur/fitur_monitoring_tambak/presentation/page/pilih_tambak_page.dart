import 'package:common/presentation/error_handler/error_warning.dart';
import 'package:common/response/api_response.dart';
import 'package:common/routes/routes.dart';
import 'package:dependencies/provider.dart';
import 'package:flutter/material.dart';
import 'package:common/domain/model/tambak.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/provider/monitoring_provider.dart';
import 'package:smart_fishery/theme.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/component/tambak_card.dart';

class PilihTambakPage extends StatefulWidget {
  const PilihTambakPage({super.key});

  @override
  State<PilihTambakPage> createState() => _PilihTambakPageState();
}

class _PilihTambakPageState extends State<PilihTambakPage> {
  String searchKeyword = '';

  @override
  Widget build(BuildContext context) {
    final provider =
        ModalRoute.of(context)?.settings.arguments as MonitoringProvider;

    return ChangeNotifierProvider.value(
      value: provider,
      child: Scaffold(
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
          onPressed: () async {
            final isCreatingTambakSuccess = await Navigator.pushNamed(
              context,
              Routes.buatTambakRoute,
            );

            if (isCreatingTambakSuccess != null) {
              provider.onRefreshTambak();
            }
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
              child: Consumer<MonitoringProvider>(
                  builder: (context, provider, child) {
                return FutureBuilder(
                    future: provider.tambakResponse,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final apiResponse = snapshot.data!;

                        if (apiResponse is ApiResponseSuccess) {
                          final List<Tambak> listOfTambak =
                              (apiResponse.data as List<Tambak>)
                                  .where((tambak) => tambak.name
                                      .toLowerCase()
                                      .contains(searchKeyword.toLowerCase()))
                                  .toList();

                          return listOfTambak.isNotEmpty
                              ? ListView.separated(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  itemCount: listOfTambak.length,
                                  itemBuilder: (context, index) => TambakCard(
                                    tambak: listOfTambak[index],
                                    onTap: () {
                                      provider.setChoosenTambak(
                                          listOfTambak[index]);
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
                                  child: Text("Belum ada tambak"),
                                );
                        } else {
                          return ErrorWarning(
                              onRefresh: provider.onRefreshTambak);
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.grey[500],
              size: 18,
            ),
          ),
          Expanded(
            child: TextField(
              style: primaryTextStyle.copyWith(
                fontSize: 14,
              ),
              onChanged: (value) {
                setState(() {
                  searchKeyword = value;
                });
              },
              decoration: InputDecoration.collapsed(
                filled: true,
                fillColor: Colors.transparent,
                hintText: "Cari nama tambak anda",
                hintStyle: primaryTextStyle.copyWith(
                  color: Colors.grey[500],
                  fontSize: 14,
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
