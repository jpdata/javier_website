import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// class LocaleNotifier extends StateNotifier<Locale> {
//   LocaleNotifier() : super(PlatformDispatcher.instance.locale);

//   void setLocale({required Locale locale, BuildContext? context}) {
//     developer.log("🔹 Cambiando idioma a: ${locale.languageCode}");

//     state = locale;
//     if (context != null) LocalizationManager.updateLocale(context);
//   }

//   String get currentLocale => state.languageCode;
// }

// final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
//   return LocaleNotifier();
// });

part 'locale_notifier.g.dart';

@Riverpod()
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale build() {
    return PlatformDispatcher.instance.locale;
  }

  // ignore: avoid_build_context_in_providers
  void setLocale({required Locale locale, BuildContext? context}) {
    state = locale;
    if (context != null) LocalizationManager.updateLocale(context);
  }
}
