import 'package:common/routes/routes.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:dependencies/intl.dart';
import 'package:dependencies/provider.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/core.dart';
import 'package:common/domain/model/kolam.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/component/build_confirm_dialog.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/provider/monitoring_provider.dart';

class KolamCard extends StatelessWidget {
  final Kolam kolam;
  const KolamCard({
    super.key,
    required this.kolam,
  });

  @override
  Widget build(BuildContext context) {
    final MonitoringProvider provider = Provider.of(context, listen: false);
    content() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                kolam.lastKualitasAir?.suhu.toStringAsFixed(2) ?? "-",
                style: primaryTextStyle.copyWith(
                  color: const Color(0xFF0079FF),
                  fontWeight: semibold,
                ),
              ),
              Text(
                "Suhu",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                kolam.lastKualitasAir?.dO.toStringAsFixed(2) ?? "-",
                style: primaryTextStyle.copyWith(
                  color: const Color(0xFFC82C2C),
                  fontWeight: semibold,
                ),
              ),
              Text(
                "Do",
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                kolam.lastKualitasAir?.sal.toStringAsFixed(2) ?? "-",
                style: primaryTextStyle.copyWith(
                  color: const Color(0xFF0079FF),
                  fontWeight: semibold,
                ),
              ),
              Text(
                "Sal",
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                kolam.lastKualitasAir?.ph.toStringAsFixed(2) ?? "-",
                style: primaryTextStyle.copyWith(
                  color: const Color(0xFFC82C2C),
                  fontWeight: semibold,
                ),
              ),
              Text(
                "pH",
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                kolam.lastKualitasAir?.kecerahan.toStringAsFixed(2) ?? "-",
                style: primaryTextStyle.copyWith(
                  color: const Color(0xFF0079FF),
                  fontWeight: semibold,
                ),
              ),
              Text(
                "Kecerahan",
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      );
    }

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.lihatDetailKolamRoute, arguments: kolam);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 6,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    kolam.namaKolam,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){

                  },
                  child: const Icon(
                                Icons.edit,
                                // color: alertColor,
                                size: 18,
                              ),
                ),
                const SizedBox(width: 10,),
                InkWell(
                  onTap: () async {
                    final willDelete = await buildConfirmDialog(context);
                    if (willDelete){
                      provider.deleteKolam(kolam.id);
                    }
                  },
                  child: Icon(
                                Icons.delete,
                                color: alertColor,
                                size: 18,
                              ),
                ),
                
              ],
            ),
            Text(
              "Update Terakhir - ${DateFormat('dd MMMM yyyy', "id_ID").format(kolam.updateTerakhir)}",
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            // content(),
            content(),
          ],
        ),
      ),
    );
  }
}
