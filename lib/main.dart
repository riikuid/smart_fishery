import 'package:smart_fishery/pages/feature/belajar_page.dart';
import 'package:smart_fishery/pages/home/home_page.dart';
import 'package:smart_fishery/pages/feature/konsultasi_page.dart';
import 'package:smart_fishery/pages/sign_in_page.dart';
import 'package:smart_fishery/state_util.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/pages/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SplashPage(),
        '/sign-in': (context) => const SignInPage(),
        '/home': (context) => const HomePage(),
        '/konsultasi': (context) => const KonsultasiPage(),
        '/belajar': (context) => const BelajarPage(),
      },
    );
  }
}
