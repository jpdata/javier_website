import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';
import 'package:javier_website/core/utils.dart';
import 'package:javier_website/router/rout_names.dart';
import 'package:rive/rive.dart' as rive;

class MainDrawer extends ConsumerStatefulWidget {
  const MainDrawer({super.key});

  @override
  ConsumerState<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends ConsumerState<MainDrawer> {
  late ImageProvider<Object> _backgroundImage;
  late DecorationImage _backgroundDecoration;

  _MainDrawerState() {
    _backgroundImage = Image.asset('assets/images/circuit-3.png').image;
    _backgroundDecoration = DecorationImage(
      image: _backgroundImage, // 🖼️ Ruta de la imagen
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        Colors.black.withAlpha(33), // 🎨 Color de filtro
        BlendMode.dstATop,
      ),
      // 🎨 Filtro
    );
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await precacheImage(_backgroundImage, context);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(localeProvider);
    double screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          image: _backgroundDecoration,
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              DrawerHeader(
                                decoration: const BoxDecoration(
                                  color:
                                      Colors.transparent, // Fondo transparente
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      localizations.more_options,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: screenWidth * .15,
                                      height: screenWidth / 1.48 * .10,
                                      child: const rive.RiveAnimation.asset(
                                        'assets/animations/javier.riv',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ListTile(
                            leading: const Image(
                              image: Svg('assets/images/email.svg'),
                              width: 24,
                              height: 24,
                              color: Colors.white,
                            ),
                            title: Text(localizations.contact_me_by_email,
                                style: const TextStyle(color: Colors.white)),
                            onTap: () {
                              Utils.launchMailto(context);
                            },
                          ),
                          ListTile(
                            title: Text(localizations.blog,
                                style: const TextStyle(color: Colors.white)),
                            onTap: () {
                              Scaffold.of(context).closeDrawer();
                              context.pushNamed(RoutNames.blogEntries);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: CountryFlag.fromCountryCode(
                            'GB',
                            shape: const RoundedRectangle(5),
                            height: 32,
                            width: 48,
                          ),
                          onPressed: () {
                            ref.read(localeProvider.notifier).setLocale(
                                locale: const Locale('en'), context: context);
                            context.go('/');
                          },
                          tooltip: localizations.english,
                        ),
                        IconButton(
                          icon: CountryFlag.fromCountryCode(
                            'ES',
                            shape: const RoundedRectangle(5),
                            height: 32,
                            width: 48,
                          ),
                          onPressed: () {
                            ref.read(localeProvider.notifier).setLocale(
                                locale: const Locale('es'), context: context);
                            context.go('/');
                          },
                          tooltip: localizations.spanish_spain,
                        ),
                        IconButton(
                          icon: CountryFlag.fromCountryCode(
                            'VE',
                            shape: const RoundedRectangle(5),
                            height: 32,
                            width: 48,
                          ),
                          onPressed: () {
                            ref.read(localeProvider.notifier).setLocale(
                                locale: const Locale('es', 'VE'),
                                context: context);
                            context.go('/');
                          },
                          tooltip: localizations.spanish_venezuela,
                        ),
                        IconButton(
                          icon: CountryFlag.fromCountryCode(
                            'ES',
                            shape: const RoundedRectangle(5),
                            height: 32,
                            width: 48,
                          ),
                          onPressed: () {
                            ref.read(localeProvider.notifier).setLocale(
                                locale: const Locale('ca'), context: context);
                            context.go('/');
                          },
                          tooltip: localizations.catalan,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
