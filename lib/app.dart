import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/pages/country_screen.dart';
import 'presentation/pages/homescreen.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set your initial route
      routes: {
        '/': (context) => const CountryScreen(),
        '/homescreen': (context) => const HomeScreen(),
      },
    );
  }
}
