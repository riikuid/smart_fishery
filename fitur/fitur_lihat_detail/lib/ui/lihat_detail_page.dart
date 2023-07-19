import 'package:fitur_lihat_detail/ui/pages/kualitas_air/kualitas_air_page.dart';
import 'package:fitur_lihat_detail/ui/pages/panen/panen_page.dart';
import 'package:flutter/material.dart';

class LihatDetailPage extends StatefulWidget{
  const LihatDetailPage({super.key});


  @override
  State<LihatDetailPage> createState() => _LihatDetailPageState();
}

class _LihatDetailPageState extends State<LihatDetailPage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (int index){
              setState(() {
                _currentIndex = index;
              });
            },
            tabs: const [
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
              const PanenPage(),
              KualitasAirPage(),
              const PanenPage(),
              KualitasAirPage(),
            ]
        ),
      ),
    );
  }
}