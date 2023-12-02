import 'package:flutter/material.dart';

import 'presentation/pages/country_screen.dart';
import 'presentation/pages/homescreen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
