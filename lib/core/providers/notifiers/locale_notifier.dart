import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:javier_website/core/l10n/app_locale.dart';

class LocaleNotifier extends ChangeNotifier {
  late Locale _locale; // Idioma predeterminado

  LocaleNotifier() {
    // Inicializar con el idioma del dispositivo
    _locale = PlatformDispatcher.instance.locale;
  }

  Locale get locale => _locale;

  void setLocale({required Locale locale, BuildContext? context}) {
    _locale = locale;
    if(context !=null) LocalizationManager.updateLocale(context);

    notifyListeners();
  }
}
