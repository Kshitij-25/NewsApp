import 'package:flutter/material.dart';
import 'package:news_app2/presentation/pages/categories_screen.dart';
import 'package:news_app2/presentation/pages/trending_news_screen.dart';

import 'presentation/pages/country_screen.dart';
import 'presentation/pages/homescreen.dart';
import 'presentation/pages/splash_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash', // Set your initial route
      title: "NewsNest",
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const CountryScreen(),
        '/homescreen': (context) => const HomeScreen(),
        '/trendingScreen': (context) => const TrendingScreen(),
        '/categoryScreen': (context) => const CategoriesScreen()
      },
    );
  }
}
