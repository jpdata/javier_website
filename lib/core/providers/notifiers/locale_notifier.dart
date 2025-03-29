import 'dart:developer' as developer show log;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/l10n/app_locale.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(PlatformDispatcher.instance.locale);

  void setLocale({required Locale locale, BuildContext? context}) {
    developer.log("🔹 Cambiando idioma a: ${locale.languageCode}");

    state = locale;
    if (context != null) LocalizationManager.updateLocale(context);
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});
