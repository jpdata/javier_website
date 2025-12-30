import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/assets.dart';
import 'package:javier_website/core/l10n/dynamic_app_localizations.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/l10n/app_localizations.dart';
import 'package:javier_website/firebase_options.dart';
import 'package:javier_website/router/router.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:javier_website/viewmodel/news/news_entries_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase and SharedPreferences in parallel to speed up startup
  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    SharedPreferences.getInstance(),
  ]);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    // Remove splash screen after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pre-cache critical assets to avoid flickering and speed up rendering
    precacheImage(const Svg(Assets.bgTile), context);
    precacheImage(const Svg(Assets.javiWireframe), context);
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    
    // Pre-fetch news entries so they are ready when Home is shown
    ref.listen(newsEntriesViewModelProvider(), (_, __) {});

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
