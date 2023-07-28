import 'package:common/routes/routes.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_input_kualitas_air/presentation/input_kualitas_air_page.dart';
import 'package:fitur_input_panen/presentation/input_panen_page.dart';
import 'package:fitur_input_sampling/presentation/input_sampling_page.dart';
import 'package:fitur_lihat_detail/ui/lihat_detail_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:smart_fishery/pages/auth/sign_in_page.dart';
import 'package:smart_fishery/pages/feature/belajar_page.dart';
import 'package:smart_fishery/pages/feature/harga_udang_page.dart';
import 'package:smart_fishery/pages/feature/kolam_page.dart';
import 'package:smart_fishery/pages/feature/monitoring_page.dart';
import 'package:smart_fishery/pages/feature/tambak/pilih_tambak_page.dart';
import 'package:smart_fishery/pages/home/home_page.dart';
import 'package:smart_fishery/pages/feature/konsultasi_page.dart';
import 'package:smart_fishery/pages/auth/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/pages/splash_page.dart';
import 'package:smart_fishery/provider/auth_provider.dart';

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
        )
      ],
      child: MaterialApp(
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
          Routes.lihatDetailKolamRoute: (context) => const LihatDetailPage(),
          Routes.inputKualitasAirRoute: (context) =>
              const InputKualitasAirPage(),
          Routes.inputPanenRoute: (context) => InputPanenPage(),
          Routes.inputSamplingRoute: (context) => InputSamplingPage(),
        },
      ),
    );
  }
}
