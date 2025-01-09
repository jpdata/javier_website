import 'package:flutter/material.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';
import 'package:provider/provider.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/l10n/app_localizations.dart';
import 'package:javier_website/router/router.dart';
import 'package:javier_website/view/Themes/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocaleNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LocaleNotifier>(context).locale;
    LocalizationManager.updateLocale(context); // Update localizations

    return MaterialApp.router(
      key: ValueKey(locale),
      routerConfig: AppRouter.router,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Javier Prato - Portfolio',
      onGenerateTitle: (context) {
        LocalizationManager.init(context);
        return localizations.title;
      },
      theme: AppTheme.lightTheme,
    );
  }
}
