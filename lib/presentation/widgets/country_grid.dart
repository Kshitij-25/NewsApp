import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app2/presentation/providers/top_headlines_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/country_provider.dart';
import '../providers/everything_provider.dart';

class CountryGrid extends StatelessWidget {
  const CountryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final countriesMap = ref.watch(countriesMapProvider);

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: countriesMap.length,
          itemBuilder: (context, index) {
            final countryCode = countriesMap.keys.elementAt(index);
            final countryData = countriesMap[countryCode];

            return GestureDetector(
              onTap: () async {
                // Save selected country code to shared preferences
                final sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.setString('selectedCountryCode', countryCode);

                ref
                    .read(selectedCountryCodeProvider.notifier)
                    .setSelectedCountryCode(countryCode);

                // Save selected country code to shared preferences
                // await SharedPreferencesHelper.saveSelectedCountryCode(
                //     countryCode);

                ref.refresh(topHeadlinesProvider);
                ref.refresh(everythingProvider);
                Navigator.of(context).pushReplacementNamed('/homescreen');
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      countryData!['flag']!,
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      countryData['name']!,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
