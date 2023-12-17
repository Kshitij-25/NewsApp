import 'package:flutter/material.dart';
import 'package:news_app2/presentation/pages/Categories_screen.dart';
import 'package:news_app2/presentation/pages/trending_news_screen.dart';
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
        '/trendingScreen': (context) => const TrendingScreen(),
        '/categoryScreen':(context) => const CategoriesScreen()
      },
    );
  }
}



// class MainApp extends ConsumerWidget {
//   const MainApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return FutureBuilder<String?>(
//       future: SharedPreferences.getInstance()
//           .then((prefs) => prefs.getString('selectedCountryCode')),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           final String? countryCode = snapshot.data;

//           final initialRoute = countryCode != null ? '/' : '/';

//           if (countryCode != null) {
//             // Set the selected country code if available
//             WidgetsBinding.instance!.addPostFrameCallback((_) {
//               ref
//                   .read(selectedCountryCodeProvider.notifier)
//                   .setSelectedCountryCode(countryCode);
//             });
//           }

//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             initialRoute: initialRoute,
//             routes: {
//               '/': (context) => const CountryScreen(),
//               '/homescreen': (context) => const HomeScreen(),
//             },
//           );
//         } else {
//           return const CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }
