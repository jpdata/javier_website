
import 'package:flutter/material.dart';
import 'package:javier_website/core/l10n/app_localizations.dart';


AppLocalizations get localizations => _localizations!;
AppLocalizations? _localizations;

class LocalizationManager {
  static void init(BuildContext context) {
    _localizations ??= AppLocalizations.of(context);
  }
}