import 'package:common/routes/routes.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_lihat_detail/ui/lihat_detail_page.dart';
import 'package:fitur_lihat_detail/ui/provider/detail_provider.dart';
import 'package:fitur_lihat_detail/ui/provider/fake_detail_repository.dart';
import 'package:smart_fishery/pages/auth/verification_page.dart';
import 'package:smart_fishery/pages/feature/belajar_page.dart';
import 'package:smart_fishery/pages/feature/harga_udang_page.dart';
import 'package:smart_fishery/pages/feature/monitoring_page.dart';
import 'package:smart_fishery/pages/home/home_page.dart';
import 'package:smart_fishery/pages/feature/konsultasi_page.dart';
import 'package:smart_fishery/pages/feature/monitoring/pilih_tambak_page.dart';
import 'package:smart_fishery/pages/auth/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/pages/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => DetailProvider(
                repository: FakeDetailRepository()
            )
        )
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/verif': (context) => const VerificationPage(),
          '/home': (context) => const HomePage(),
          '/konsultasi': (context) => const KonsultasiPage(),
          '/belajar': (context) => BelajarPage(),
          '/harga-udang': (context) => const HargaUdangPage(),
          '/monitoring': (context) => const MonitoringPage(),
          '/pilih-tambak': (context) => const PilihTambakPage(),
          Routes.lihatDetailRoute : (context){
            Provider.of<DetailProvider>(context , listen: false)
                .refreshData(
                  ModalRoute.of(context)!.settings.arguments as int
                );
            return LihatDetailPage();
          }
        },
      ),
    );
  }
}