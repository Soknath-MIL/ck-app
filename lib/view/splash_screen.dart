import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottery/res/images/logo.dart';
import 'package:lottery/view_models/services/splash_screen_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    final marginTop = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: marginTop.height * 0.15,
                ),
                const Image(
                  image: AssetImage(Logo.main),
                  width: 176,
                  height: 176,
                ),
                const SizedBox(
                  height: 45,
                ),
                const Image(
                  image: AssetImage(Logo.ckGroup),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
