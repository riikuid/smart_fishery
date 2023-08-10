import 'package:common/routes/routes.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_buat_kolam/presentation/page/buat_kolam_page.dart';
import 'package:fitur_buat_tambak/presentation/page/buat_tambak_page.dart';
import 'package:fitur_input_kualitas_air/presentation/input_kualitas_air_page.dart';
import 'package:fitur_input_panen/presentation/input_panen_page.dart';
import 'package:fitur_input_penyakit/presentation/input_penyakit_page.dart';
import 'package:fitur_input_penyakit/presentation/pilih_penyakit_udang_page.dart';
import 'package:fitur_input_sampling/presentation/input_sampling_page.dart';
import 'package:fitur_lihat_detail_kolam/ui/pages/lihat_detai_kolam_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/page/kolam_page.dart';
import 'package:smart_fishery/pages/auth/sign_in_page.dart';
import 'package:smart_fishery/pages/feature/belajar_page.dart';
import 'package:smart_fishery/pages/feature/harga_udang_page.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/page/monitoring_page.dart';
import 'package:smart_fishery/fitur/fitur_monitoring_tambak/presentation/page/pilih_tambak_page.dart';
import 'package:smart_fishery/pages/home/home_page.dart';
import 'package:smart_fishery/pages/feature/konsultasi_page.dart';
import 'package:smart_fishery/pages/auth/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/pages/splash_page.dart';
import 'package:smart_fishery/provider/auth_provider.dart';
import 'package:smart_fishery/provider/belajar_provider.dart';
import 'package:smart_fishery/provider/harga_udang_provider.dart';
import 'package:smart_fishery/provider/konsultasi_provider.dart';
import 'package:smart_fishery/provider/suhu_provider.dart';

// void main() {
//   runApp(const MainApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SuhuProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => KonsultasiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HargaUdangProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BelajarProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-in': (context) => const SignInPage(),
          '/home': (context) => const HomePage(),
          '/konsultasi': (context) => const KonsultasiPage(),
          '/belajar': (context) => BelajarPage(),
          '/harga-udang': (context) => const HargaUdangPage(),
          '/monitoring': (context) => const MonitoringPage(),
          '/kolam': (context) => const KolamPage(),
          '/pilih-tambak': (context) => const PilihTambakPage(),
          '/pilih-penyakit': (context) => const PilihPenyakitPage(),
          Routes.buatTambakRoute: (context) => const BuatTambakPage(),
          Routes.buatKolamRoute: (context) => const BuatKolamPage(),
          Routes.lihatDetailKolamRoute: (context) =>
              const LihatDetailKolamPage(),
          Routes.inputKualitasAirRoute: (context) =>
              const InputKualitasAirPage(),
          Routes.inputPanenRoute: (context) => const InputPanenPage(),
          Routes.inputSamplingRoute: (context) => const InputSamplingPage(),
          Routes.inputPenyakitRoute: (context) => const InputPenyakitPage(),
        },
      ),
    );
  }
}
