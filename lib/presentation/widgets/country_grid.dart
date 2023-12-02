import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app2/presentation/providers/top_headlines_provider.dart';

import '../providers/country_provider.dart';

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
                ref
                    .read(selectedCountryCodeProvider.notifier)
                    .setSelectedCountryCode(countryCode);
                ref.read(topHeadlinesProvider);
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
