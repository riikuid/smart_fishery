import 'package:dependencies/provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/models/user_model.dart';
import 'package:smart_fishery/provider/auth_provider.dart';
import 'package:smart_fishery/provider/belajar_provider.dart';
import 'package:smart_fishery/widget/video_card.dart';

import '../../theme.dart';

class BelajarPage extends StatefulWidget {
  BelajarPage({super.key});

  @override
  State<BelajarPage> createState() => _BelajarPageState();
}

class _BelajarPageState extends State<BelajarPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    // HargaUdangProvider hargaUdangProvider =
    //     Provider.of<HargaUdangProvider>(context);

    loadBelajar() async {
      await Provider.of<BelajarProvider>(context, listen: false)
          .getListBudidayaBelajars(user.token);
      setState(() {});
    }

    return Scaffold(
      // backgroundColor: Color(0xFFECE1E1),
      backgroundColor: whiteColor,
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
          FutureBuilder(
            future: Provider.of<BelajarProvider>(context, listen: false)
                .getListBudidayaBelajars(user.token),
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
                    child: Text('Failed to load event'),
                  ),
                );
              } else {
                return Consumer<BelajarProvider>(
                    builder: (context, belajarProvider, _) {
                  if (belajarProvider.belajars.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Text('No Event List Found'),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () {
                          return Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              loadBelajar();
                            });
                          });
                        },
                        color: primaryColor,
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 1),
                          physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          itemCount: belajarProvider.belajars.length,
                          itemBuilder: (context, index) {
                            final belajar = belajarProvider.belajars.reversed
                                .toList()[index];
                            return BelajarCard(belajar);
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
