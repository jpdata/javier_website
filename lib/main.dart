import 'package:flutter/material.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/l10n/app_localizations.dart';
import 'package:javier_website/router/router.dart';
import 'package:javier_website/view/Themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
      title: 'Flutter Demo',
      onGenerateTitle: (context) {
        LocalizationManager.init(context);
        return localizations.title;
      },
      theme: AppTheme.lightTheme,
    );
  }
}
