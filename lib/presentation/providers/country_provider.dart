import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/countries_map.dart';

final countriesMapProvider = Provider<Map<String, Map<String, dynamic>>>((ref) {
  // Assuming you have a function to fetch countriesMap
  // Replace it with your actual implementation
  return fetchCountriesMap.cast<String, Map<String, dynamic>>();
});

final selectedCountryCodeProvider =
    StateNotifierProvider<SelectedCountryCodeNotifier, String>((ref) {
  return SelectedCountryCodeNotifier();
});

class SelectedCountryCodeNotifier extends StateNotifier<String> {
  SelectedCountryCodeNotifier() : super('');

  void setSelectedCountryCode(String code) {
    state = code;
  }
}
