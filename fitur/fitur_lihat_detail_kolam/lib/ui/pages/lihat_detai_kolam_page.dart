import 'package:common/domain/model/kolam.dart';
import 'package:common/routes/routes.dart';
import 'package:common/themes.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_lihat_detail_kolam/data/repository/edit_kualitas_air_repository_impl.dart';
import 'package:fitur_lihat_detail_kolam/data/repository/edit_panen_repository_impl.dart';
import 'package:fitur_lihat_detail_kolam/data/repository/edit_penyakit_kolam_repository_impl.dart';
import 'package:fitur_lihat_detail_kolam/data/repository/edit_sampling_repository_impl.dart';
import 'package:fitur_lihat_detail_kolam/data/repository/lihat_detail_kolam_repository_impl.dart';
import 'package:fitur_lihat_detail_kolam/ui/pages/kualitas_air/kualitas_air_page.dart';
import 'package:fitur_lihat_detail_kolam/ui/pages/panen/panen_page.dart';
import 'package:fitur_lihat_detail_kolam/ui/pages/penyakit_kolam/penyakit_kolam_page.dart';
import 'package:fitur_lihat_detail_kolam/ui/pages/sampling/sampling_page.dart';
import 'package:fitur_lihat_detail_kolam/ui/provider/lihat_detail_provider.dart';
import 'package:flutter/material.dart';

class LihatDetailKolamPage extends StatefulWidget {
  const LihatDetailKolamPage({super.key});

  @override
  State<LihatDetailKolamPage> createState() => _LihatDetailKolamPageState();
}

class _LihatDetailKolamPageState extends State<LihatDetailKolamPage> {
  Kolam? kolam;

  @override
  Widget build(BuildContext context) {
    kolam ??= ModalRoute.of(context)?.settings.arguments as Kolam;

    return ChangeNotifierProvider(
      create: (context) => LihatDetailProvider(
        getDetailKolamRepository: LihatDetailKolamRepositoryImpl(),
        editKualitasAirRepository: EditKualitasAirRepositoryImpl(),
        editPanenRepository: EditPanenRepositoryImpl(),
        editSamplingRepository: EditSamplingRepositoryImpl(),
        editPenyakitKolamRepository: EditPenyakitKolamRepositoryImpl(),
        idKolam: kolam!.id,
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
                kolam!.namaKolam,
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
                    text: "Sampling",
                  ),
                  Tab(
                    text: "Penyakit",
                  ),
                  Tab(
                    text: "Panen",
                  ),
                ],
              ),
            ),
            body: const TabBarView(children: [
              KualitasAirPage(),
              SamplingPage(),
              PenyakitKolamPage(),
              PanenPage(),
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
                      } else if (currentIndex ==
                          Routes.detailPenyakitPageIndex) {
                        nextRoute = Routes.inputPenyakitRoute;
                      }

                      if (nextRoute != null) {
                        Navigator.of(context)
                            .pushNamed(nextRoute, arguments: kolam!.id)
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
