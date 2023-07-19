import 'package:fitur_lihat_detail/ui/pages/kualitas_air/kualitas_air_page.dart';
import 'package:fitur_lihat_detail/ui/pages/panen/panen_page.dart';
import 'package:flutter/material.dart';

class LihatDetailTabBar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Kualitas Air",
              ),
              Tab(
                text: "Panen",
              ),
              Tab(
                text: "Sampling",
              ),
              Tab(
                text: "Panen",
              )
            ],
          ),
        ),
        body: TabBarView(
            children: [
              PanenPage(),
              KualitasAirPage(),
              PanenPage(),
              KualitasAirPage(),
            ]
        ),
      ),
    );
  }
}