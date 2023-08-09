import 'package:common/presentation/error_handler/error_warning.dart';
import 'package:common/response/api_response.dart';
import 'package:common/routes/argument/input_kolam_argument.dart';
import 'package:common/routes/routes.dart';
import 'package:dependencies/loader_overlay.dart';
import 'package:dependencies/provider.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/core.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/data/repository/monitoring_repository_impl.dart';
import 'package:common/domain/model/kolam.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/component/list_view_fitur_kolam.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/component/search_tambak_card.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/provider/monitoring_provider.dart';

class KolamPage extends StatelessWidget {
  const KolamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: ChangeNotifierProvider(
        create: (context) => MonitoringProvider(
          repository: MonitoringRepositoryImpl(),
        ),
        child:
            Consumer<MonitoringProvider>(builder: (context, provider, child) {
          if (provider.deleteKolamResponse is ApiResponseLoading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
          return Scaffold(
            backgroundColor: backgroundColor2,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Kolam",
                style: primaryTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: whiteColor,
                ),
              ),
              backgroundColor: const Color(0xFF1B9C85),
              leading: const BackButton(),
            ),
            floatingActionButton: Visibility(
              visible: provider.choosenTambak != null,
              child: FloatingActionButton(
                backgroundColor: const Color(0xFF1B9C85),
                child: const Icon(
                  Icons.add,
                  size: 24.0,
                ),
                onPressed: () async {
                  final result = await Navigator.of(context).pushNamed(
                    Routes.buatKolamRoute,
                    arguments: InputKolamArgument(
                      tambak: provider.choosenTambak!,
                    ),
                  );
                  if (result != null) {
                    provider.onRefreshKolam();
                  }
                },
              ),
            ),
            body: FutureBuilder(
                future: provider.tambakResponse,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final apiResponse = snapshot.data!;
                    if (apiResponse is ApiResponseSuccess) {
                      return Column(
                        children: [
                          SearchTambakCard(
                            choosenTambak: provider.choosenTambak,
                            listOfTambak: apiResponse.data,
                          ),
                          Expanded(
                            child: FutureBuilder(
                                future: provider.kolamResponse,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final apiResponse = snapshot.data!;
                                    if (apiResponse is ApiResponseSuccess) {
                                      final List<Kolam> listKolam =
                                          apiResponse.data;
                                      if (listKolam.isNotEmpty) {
                                        return ListViewFiturKolam(
                                          listKolam: listKolam,
                                        );
                                      } else {
                                        return const Center(
                                          child: Text("Tidak ada data"),
                                        );
                                      }
                                    } else if (apiResponse
                                        is ApiResponseFailed) {
                                      return Center(
                                        child: ErrorWarning(
                                          onRefresh: provider.onRefreshKolam,
                                          errorMessage:
                                              apiResponse.errorMessage,
                                        ),
                                      );
                                    } else {
                                      throw Exception("Enggak Mungkin!! T_T");
                                    }
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }),
                          )
                        ],
                      );
                    } else if (apiResponse is ApiResponseFailed) {
                      return Center(
                        child: ErrorWarning(
                          onRefresh: provider.onRefreshTambak,
                          errorMessage: apiResponse.errorMessage,
                        ),
                      );
                    } else {
                      throw Exception("Unknown Exception Occurs");
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          );
        }),
      ),
    );
  }
}
