import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/countries_map.dart';

final selectedCountryCodeProvider = StateProvider<String?>((ref) => null);

final selectedCategoryProvider =
    StateProvider<String>((ref) => "entertainment");

final countriesMapProvider = Provider<Map<String, Map<String, dynamic>>>((ref) {
  // Assuming you have a function to fetch countriesMap
  // Replace it with your actual implementation
  return fetchCountriesMap.cast<String, Map<String, dynamic>>();
});
