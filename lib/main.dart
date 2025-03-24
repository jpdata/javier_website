import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/l10n/dynamic_app_localizations.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/l10n/app_localizations.dart';
import 'package:javier_website/router/router.dart';
import 'package:javier_website/view/Themes/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as developer;
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Usa las opciones correctas
  );

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
    final locale = ref.watch(localeProvider);
    LocalizationManager.updateLocale(context); // Update localizations
    loginWithEnvVars();

    return MaterialApp.router(
      key: ValueKey(locale),
      routerConfig: AppRouter.router,
      locale: locale,
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
        DynamicAppLocalizationsDelegate()
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Javier Prato - Portfolio',
      onGenerateTitle: (context) {
        LocalizationManager.init(context);
        return localizations.title;
      },
      theme: AppTheme.lightTheme,
    );
  }

  Future<void> loginWithEnvVars() async {
    try {

      final Map<String, dynamic> credentials = jsonDecode(await rootBundle.loadString('assets/strings/credentials.json'));

      String email = credentials['username'];
      String password = credentials['password'];

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      developer.log("Usuario autenticado exitosamente.");
    } catch (e) {
      developer.log("Error al autenticar", error: e);
    }
  }
}
