import 'package:dependencies/provider.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/models/harga_udang_model.dart';
import 'package:smart_fishery/models/user_model.dart';
import 'package:smart_fishery/provider/auth_provider.dart';
import 'package:smart_fishery/provider/harga_udang_provider.dart';
import 'package:smart_fishery/widget/harga_udang_card.dart';

import '../../theme.dart';

class HargaUdangPage extends StatefulWidget {
  const HargaUdangPage({super.key});

  @override
  State<HargaUdangPage> createState() => _HargaUdangPageState();
}

class _HargaUdangPageState extends State<HargaUdangPage> {
  String searchKeyword = '';
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    loadHargaUdang() async {
      await Provider.of<HargaUdangProvider>(context, listen: false)
          .getListHargaUdangs(user.token);
      setState(() {});
    }

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
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchKeyword = value;
                  });
                },
                decoration: InputDecoration.collapsed(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: "Cari lokasi yang ingin kamu ketahui",
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

    return Scaffold(
      // backgroundColor: Color(0xFFECE1E1),
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Harga Udang",
          style: primaryTextStyle.copyWith(
            fontWeight: semibold,
            fontSize: 16,
          ),
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
          FutureBuilder(
            future: Provider.of<HargaUdangProvider>(context, listen: false)
                .getListHargaUdangs(user.token),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Expanded(
                  child: Center(
                    child: Text('Failed to load transaction list'),
                  ),
                );
              } else {
                return Consumer<HargaUdangProvider>(
                    builder: (context, hargaUdangProvider, _) {
                  if (hargaUdangProvider.hargaUdangs.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Text('No Service List Found'),
                      ),
                    );
                  } else {
                    List<HargaUdangModel> filteredHargaUdang =
                        hargaUdangProvider.hargaUdangs.reversed
                            .where((hargaUdang) =>
                                hargaUdang.kota.toLowerCase().contains(
                                      searchKeyword.toLowerCase(),
                                    ) ||
                                hargaUdang.provinsi.toLowerCase().contains(
                                      searchKeyword.toLowerCase(),
                                    ))
                            .toList();
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () {
                          return Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              loadHargaUdang();
                            });
                          });
                        },
                        color: primaryColor,
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 1),
                          physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          itemCount: filteredHargaUdang.length,
                          itemBuilder: (context, index) {
                            return HargaUdangCard(filteredHargaUdang[index]);
                          },
                        ),
                      ),
                    );
                  }
                });
              }
            },
          )
        ],
      ),
    );
  }
}
