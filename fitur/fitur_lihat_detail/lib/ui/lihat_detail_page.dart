import 'package:common/presentation/provider/lihat_detail_provider.dart';
import 'package:common/routes/routes.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_lihat_detail/ui/pages/kualitas_air/kualitas_air_page.dart';
import 'package:fitur_lihat_detail/ui/pages/panen/panen_page.dart';
import 'package:fitur_lihat_detail/ui/pages/sampling/sampling_page.dart';
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
    final provider = Provider.of<LihatDetailProvider>(context , listen: false);
    final idKolam = ModalRoute.of(context)?.settings.arguments as int;

    return DefaultTabController(
      length: 4,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging){
              _currentIndex = tabController.index;
            }
            else {
              _currentIndex = -1;
            }
          });

          return Scaffold(
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
                    text: "Penyakit",
                  )
                ],
              ),
            ),
            body: const TabBarView(
                children: [
                  KualitasAirPage(),
                  PanenPage(),
                  SamplingPage(),
                  KualitasAirPage(),
                ]
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(24.0),
              child: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  String? nextRoute;
                  if (_currentIndex == Routes.detailKualitasAirPageIndex){
                    nextRoute = Routes.inputKualitasAirRoute;
                  }
                  else if (_currentIndex == Routes.detailPanenPageIndex){
                    nextRoute = Routes.inputPanenRoute;
                  }

                  if (nextRoute != null){
                    Navigator.of(context).pushNamed(
                      nextRoute
                    ).then((result){
                      if (result != null){
                        provider.refreshData(idKolam);
                      }
                    });
                  }
                }
              ),
            ),
          );
        }
      ),
    );
  }
}