import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {



  final String _languageCodeKey = 'languageCode';
  final String _countryCodeKey = 'countryCode';

  final RxString languageCode = ''.obs;
  final RxString countryCode = ''.obs;
  final RxString selectedLanguage = ''.obs;

  final List<String> languageList = ['English', 'বাংলা'];


  @override
  void onInit() {
    super.onInit();
    initializeLanguage();
  }

  Future<void> initializeLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final storedLanguageCode = prefs.getString(_languageCodeKey);
    final storedCountryCode = prefs.getString(_countryCodeKey);

    if (storedLanguageCode != null && storedCountryCode != null) {
      languageCode.value = storedLanguageCode;
      countryCode.value = storedCountryCode;
      selectedLanguage.value = getLanguageDisplayName(storedLanguageCode);
      setLocale(Locale(storedLanguageCode, storedCountryCode));
    } else {
      changeLanguage('en', 'US');
    }
  }

  Future<void> changeLanguage(String languageCode, String countryCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageCodeKey, languageCode);
    await prefs.setString(_countryCodeKey, countryCode);

    this.languageCode.value = languageCode;
    this.countryCode.value = countryCode;
    selectedLanguage.value = getLanguageDisplayName(languageCode);
    setLocale(Locale(languageCode, countryCode));
  }

  String getLanguageDisplayName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'bn':
        return 'বাংলা';
      default:
        return '';
    }
  }

  String getLanguageCode(String languageName) {
    switch (languageName) {
      case 'English':
        return 'en';
      case 'বাংলা':
        return 'bn';
      default:
        return '';
    }
  }

  void setLocale(Locale locale) {
    Get.updateLocale(locale);
  }




  void darkTheme() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('isDarkMode', true);
    Get.changeTheme(ThemeData.dark());
  }

void lightTheme() async {
  final SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setBool('isDarkMode', false);
  Get.changeTheme(ThemeData.light());
}


  void changeTheme()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isDarkMode = sp.getBool('isDarkMode');

    if(isDarkMode !=null && isDarkMode){
      Get.changeTheme(ThemeData.dark());
    }else{
      Get.changeTheme(ThemeData.light());
    }
  }



}
