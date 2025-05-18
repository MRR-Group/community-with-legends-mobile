import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationController with ChangeNotifier {
  Locale get locale => _locale;
  Locale _locale = const Locale('en');

  List<(String, String)> get languages => _languages;
  final _languages = [
    ('Polski', 'pl'),
    ('English', 'en'),
  ];


  Future<void> setLocale(String localeCode) async {
    _locale = Locale(localeCode);
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', _locale.languageCode);
  }

  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString('locale') ?? 'en';

    _locale = Locale(localeCode);
  }
}
