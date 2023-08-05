import 'package:get/get.dart';
import 'package:newsapp/screens/country_screen.dart';
import 'package:newsapp/screens/homescreen.dart';
import 'package:newsapp/screens/top_headlines_screen.dart';
import 'package:newsapp/screens/webview_screen.dart';

import 'app_routes.dart';

class AppPages {
  static var pages = [
    GetPage(
      name: AppRoutes.COUNTRY_SELECTION_SCREEN,
      page: () => const CountryScreen(),
    ),
    GetPage(
      name: AppRoutes.HOMESCREEN,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.WEBVIEW,
      page: () => WebviewScreen(),
    ),
    GetPage(
      name: AppRoutes.TOP_HEADLINES_SCREEN,
      page: () => const TopHeadlinesScreen(),
    ),
  ];
}
