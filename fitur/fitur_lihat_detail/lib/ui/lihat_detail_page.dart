import 'package:common/routes/routes.dart';
import 'package:common/themes.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_lihat_detail/ui/pages/kualitas_air/kualitas_air_page.dart';
import 'package:fitur_lihat_detail/ui/pages/panen/panen_page.dart';
import 'package:fitur_lihat_detail/ui/pages/sampling/sampling_page.dart';
import 'package:fitur_lihat_detail/ui/provider/fake_lihat_detail_repository.dart';
import 'package:fitur_lihat_detail/ui/provider/lihat_detail_provider.dart';
import 'package:flutter/material.dart';

class LihatDetailPage extends StatefulWidget {
  const LihatDetailPage({super.key});

  @override
  State<LihatDetailPage> createState() => _LihatDetailPageState();
}

class _LihatDetailPageState extends State<LihatDetailPage> {
  int? idKolam;

  @override
  Widget build(BuildContext context) {
    idKolam ??= ModalRoute.of(context)?.settings.arguments as int;

    return ChangeNotifierProvider(
      create: (context) => LihatDetailProvider(
        repository: FakeLihatDetailRepository(),
        idKolam: idKolam!,
      ),
      child: DefaultTabController(
        length: 4,
        child: Builder(builder: (context) {
          final provider =
              Provider.of<LihatDetailProvider>(context, listen: false);
          final tabController = DefaultTabController.of(context);

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Kolam A1",
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                  color: whiteColor,
                ),
              ),
              backgroundColor: greenColor,
              bottom: const TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
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
            body: const TabBarView(children: [
              KualitasAirPage(),
              PanenPage(),
              SamplingPage(),
              SizedBox(),
            ]),
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(24.0),
              child: FloatingActionButton(
                  backgroundColor: greenColor,
                  child: const Icon(Icons.add),
                  onPressed: () {
                    if (!tabController.indexIsChanging) {
                      final currentIndex = tabController.index;
                      String? nextRoute;
                      if (currentIndex == Routes.detailKualitasAirPageIndex) {
                        nextRoute = Routes.inputKualitasAirRoute;
                      } else if (currentIndex == Routes.detailPanenPageIndex) {
                        nextRoute = Routes.inputPanenRoute;
                      } else if (currentIndex ==
                          Routes.detailSamplingPageIndex) {
                        nextRoute = Routes.inputSamplingRoute;
                      }

                      if (nextRoute != null) {
                        Navigator.of(context)
                            .pushNamed(nextRoute)
                            .then((result) {
                          if (result != null) {
                            provider.refreshData();
                          }
                        });
                      }
                    }
                  }),
            ),
          );
        }),
      ),
    );
  }
}
