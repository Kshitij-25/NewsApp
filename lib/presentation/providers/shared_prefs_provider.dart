import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String selectedCountryCodeKey = 'selectedCountryCode';

  static Future<void> saveSelectedCountryCode(String countryCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(selectedCountryCodeKey, countryCode);
  }

  static Future<String> getSelectedCountryCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(selectedCountryCodeKey) ??
        ""; // Provide a default value if null
  }
}
