import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/l10n/dynamic_app_localizations.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/l10n/app_localizations.dart';
import 'package:javier_website/router/router.dart';
import 'package:javier_website/view/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeNotifierProvider);
    LocalizationManager.updateLocale(context); // Update localizations

    return MaterialApp.router(
      key: ValueKey(locale),
      routerConfig: AppRouter.router,
      locale: locale,
      localizationsDelegates: [...AppLocalizations.localizationsDelegates, DynamicAppLocalizationsDelegate()],
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
