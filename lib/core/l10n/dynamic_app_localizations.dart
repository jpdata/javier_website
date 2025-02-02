import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DynamicAppLocalizations {
  final Map<String, String> _localizedStrings;

  DynamicAppLocalizations(this._localizedStrings);

  String translate(String key) {
    return _localizedStrings[key] ?? '[$key not found]';
  }

  static DynamicAppLocalizations of(BuildContext context) {
    return Localizations.of<DynamicAppLocalizations>(
        context, DynamicAppLocalizations)!;
  }
}

class DynamicAppLocalizationsDelegate
    extends LocalizationsDelegate<DynamicAppLocalizations> {
  @override
  Future<DynamicAppLocalizations> load(Locale locale) async {
    String jsonContent = await rootBundle
        .loadString('assets/l10n/app_${locale.languageCode}.arb');
    Map<String, dynamic> jsonMap = json.decode(jsonContent);

    Map<String, String> localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return DynamicAppLocalizations(localizedStrings);
  }

  @override
  bool isSupported(Locale locale) =>
      true; //['en', 'es', 'ca'].contains(locale.languageCode);

  @override
  bool shouldReload(
          covariant LocalizationsDelegate<DynamicAppLocalizations> old) =>
      false;
}
