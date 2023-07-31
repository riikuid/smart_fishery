import 'dart:async';

import 'package:common/data/repository/token_repository_impl.dart';
import 'package:dependencies/provider.dart';
import 'package:dependencies/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:smart_fishery/provider/auth_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final tokenManager = TokenRepositoryImpl();
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    getInit() async {
      if (await tokenManager.getToken() != null) {
        if (await authProvider.getProfile(
          token: (await tokenManager.getToken())!,
        )) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (route) => false
          );
        }
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign-in', (route) => false);
      }
    }

    getInit();
    // setState(() {
    //   getInit();
    // });

    return Scaffold(
      backgroundColor: Color(0xFFC5F0FF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            "assets/splash_logo.png",
            height: MediaQuery.of(context).size.height * 0.35,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Image.asset(
            "assets/splash_bottom.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
