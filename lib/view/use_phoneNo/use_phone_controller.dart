import 'package:get/get.dart';
import 'package:soldiers_friends/model/country_code.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';

class CountryCodeController extends GetxController {
  // List of available country codes
  final List<CountryCode> _countryCodes = [
    CountryCode(code: 'Select\nCode'),
    CountryCode(code: '+1'),
    CountryCode(code: '+44'),
    CountryCode(code: '+33'),
    CountryCode(code: '+92'),
    CountryCode(code: '+67'),
    CountryCode(code: '+71'),
    // Add more country codes as needed
  ];

  // Private selected country code
  CountryCode? _selectedCountryCode;

  // Getter for country codes
  List<CountryCode> get countryCodes => _countryCodes;

  // Getter for the selected country code
  CountryCode? get selectedCountryCode => _selectedCountryCode;

  @override
  void onReady() {
    super.onReady();
    navigate();
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAndToNamed(RoutesName.usephonepage);
    });
  }

  // Method to update the selected country code
  void selectCountryCode(CountryCode? countryCode) {
    _selectedCountryCode = countryCode;
    update(); // Notify listeners to rebuild
  }
}
