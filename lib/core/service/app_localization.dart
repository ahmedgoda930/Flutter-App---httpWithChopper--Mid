import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  final Locale locale;
  Map<String, String> _localLanguage = {};
  AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) {
    var result = Localizations.of<AppLocalization>(context, AppLocalization);
    if (result != null) return result;
    throw NullThrownError();
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();
  Future<bool> load() async {
    String jString =
        await rootBundle.loadString('assets/trans/${locale.languageCode}.json');

    Map<String, dynamic> jMap = json.decode(jString);
    _localLanguage = jMap.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  String? translate(String key) {
    return _localLanguage[key];
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar', 'tr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = new AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}
