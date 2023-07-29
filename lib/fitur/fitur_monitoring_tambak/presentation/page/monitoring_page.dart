import 'package:common/presentation/error_handler/error_warning.dart';
import 'package:common/response/api_response.dart';
import 'package:dependencies/provider.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/core.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/data/repository/monitoring_repository_impl.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/component/search_tambak_card.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/provider/monitoring_provider.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/component/monitoring_kolam_card.dart';

class MonitoringPage extends StatelessWidget {
  const MonitoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MonitoringProvider(
        repository: MonitoringRepositoryImpl(),
      ),
      child: Consumer<MonitoringProvider>(
        builder: (context , provider , child) {
          return Scaffold(
            backgroundColor: backgroundColor2,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Monitoring",
                style: primaryTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: whiteColor,
                ),
              ),
              backgroundColor: const Color(0xFF1B9C85),
              leading: const BackButton(),
            ),
            body : FutureBuilder(
              future: provider.getTambak(),
              builder: (context , snapshot) {
                if (snapshot.hasData) {
                  final apiResponse = snapshot.data!;
                  if (apiResponse is ApiResponseSuccess) {
                    return Column(
                        children: [
                          SearchTambakCard(
                            choosenTambak: apiResponse.data[
                              provider.choosenTambakIndex
                            ],
                            listOfTambak: apiResponse.data,
                          ),
                          Expanded(
                            child: ListView.separated(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                itemCount: 15,
                                itemBuilder: (context,
                                    index) => const MonitoringKolamCard(),
                                separatorBuilder: (BuildContext context,
                                    int index) =>
                                const SizedBox(
                                  height: 15,
                                )),
                          )
                        ],
                      );
                  }
                  else if (apiResponse is ApiResponseFailed){
                    return Center(
                      child: ErrorWarning(
                        onRefresh: provider.onRefresh,
                        errorMessage: apiResponse.errorMessage,
                      ),
                    );
                  }
                  else {
                    throw Exception("Unknown Exception Occurs");
                  }
                }
                else {
                  return const Center(
                      child: CircularProgressIndicator(),
                  );
                }
              }
            ),
          );
        }
      ),
    );
  }
}
