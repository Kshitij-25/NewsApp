import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newsapp/controllers/home_controller.dart';

import 'package:newsapp/routes/app_routes.dart';

import '../constants/countries_map.dart';
import '../constants/globals.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Country'),
      ),
      body: CountryGrid(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CountryGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Adjust the number of columns as needed
      ),
      itemCount: countriesMap.length,
      itemBuilder: (context, index) {
        final countryCode = countriesMap.keys.elementAt(index);
        final countryData = countriesMap[countryCode];

        return GestureDetector(
          onTap: () {
            // Assign the selected country code to a variable
            selectedCountryCode.value = countryCode;
            hiveBox.value!.put('selectedCountry', selectedCountryCode.value);
            HomeController().topHeadlines();
            selectedCategory.value = "entertainment";
            HomeController().getEverything();
            Get.offAndToNamed(
                AppRoutes.HOMESCREEN); // Close the CountrySelectionScreen
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  countryData!['flag'],
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 10),
                Text(
                  countryData['name'],
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
