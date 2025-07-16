import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app2/core/common/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Image? image;

  @override
  void initState() {
    super.initState();
    image = Image.asset('assets/logo/N-logo.png');
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
    precacheImage(image!.image, context);
    return Scaffold(
      body: SizedBox(
        width: ScreenSize.width(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image!,
            const Text(
              "NewsNest",
              style: TextStyle(fontWeight: FontWeight.w600),
              textScaler: TextScaler.linear(2),
            ),
          ],
        ),
      ),
    );
  }
}
