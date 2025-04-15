import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';
import 'package:javier_website/core/utils.dart';
import 'package:javier_website/router/rout_names.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:javier_website/view/widgets/fade_in_out_text.dart';
import 'package:javier_website/viewmodel/auth/auth_view_model.dart';
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
    );
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await precacheImage(_backgroundImage, context);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(localeNotifierProvider);
    var authVm = ref.watch(authViewModelProvider);
    double screenWidth = MediaQuery.of(context).size.width > 400 ? 400 : MediaQuery.of(context).size.width;
    return authVm.when(
        data: (data) => _content(screenWidth, data),
        error: (error, stack) => _content(
            screenWidth,
            AuthState(
              id: 'error',
              name: error.toString(),
              email: '',
              photoUrl: '',
              isLoggedIn: false,
            )),
        loading: () => _content(screenWidth, null));
  }

  Drawer _content(double screenWidth, AuthState? data) {
    return Drawer(
      backgroundColor: AppTheme.lightTheme.colorScheme.secondary,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DrawerHeader(
                                decoration: const BoxDecoration(
                                  color: Colors.transparent, // Fondo transparente
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: screenWidth * .40,
                                      height: screenWidth / 1.48 * .40,
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
                            tileColor: Colors.black.withAlpha(128),
                            leading: Image(
                              image: const Svg('assets/images/Mail.svg'),
                              width: 24,
                              height: 24,
                              color: AppTheme.lightTheme.colorScheme.primary,
                            ),
                            title: Text(localizations.contact_me_by_email,
                                style: TextStyle(
                                  color: AppTheme.lightTheme.colorScheme.primary,
                                )),
                            onTap: () {
                              Utils.launchMailto(context);
                            },
                          ),
                          const SizedBox(height: 2),
                          if (data != null && data.isLoggedIn)
                            ListTile(
                              tileColor: Colors.black.withAlpha(128),
                              leading: Image(
                                image: const Svg('assets/images/Blog.svg'),
                                width: 24,
                                height: 24,
                                color: AppTheme.lightTheme.colorScheme.primary,
                              ),
                              title: Text(localizations.blog,
                                  style: TextStyle(
                                    color: AppTheme.lightTheme.colorScheme.primary,
                                  )),
                              onTap: () {
                                Scaffold.of(context).closeDrawer();
                                context.pushNamed(RoutNames.blogEntries);
                              },
                            ),
                          const SizedBox(height: 2),
                          if (data != null && data.isLoggedIn)
                            ListTile(
                              tileColor: Colors.black.withAlpha(128),
                              leading: Image(
                                image: const Svg('assets/images/Blog-negativo.svg'),
                                width: 24,
                                height: 24,
                                color: AppTheme.lightTheme.colorScheme.primary,
                              ),
                              title: Text(localizations.news,
                                  style: TextStyle(
                                    color: AppTheme.lightTheme.colorScheme.primary,
                                  )),
                              onTap: () {
                                Scaffold.of(context).closeDrawer();
                                context.pushNamed(RoutNames.newsEntries);
                              },
                            ),
                          const SizedBox(height: 2),
                          ListTile(
                            tileColor: Colors.black.withAlpha(128),
                            leading: Image(
                              image: const Svg('assets/images/Instagram.svg'),
                              width: 24,
                              height: 24,
                              color: AppTheme.lightTheme.colorScheme.primary,
                            ),
                            title: Text('Instagram',
                                style: TextStyle(
                                  color: AppTheme.lightTheme.colorScheme.primary,
                                )),
                            onTap: () {
                              Utils.launchURL('https://www.instagram.com/jeprato');
                            },
                          ),
                          const SizedBox(height: 2),
                          ListTile(
                            tileColor: Colors.black.withAlpha(128),
                            leading: Image(
                              image: const Svg('assets/images/Linkedin.svg'),
                              width: 24,
                              height: 24,
                              color: AppTheme.lightTheme.colorScheme.primary,
                            ),
                            title: Text('Linkedin',
                                style: TextStyle(
                                  color: AppTheme.lightTheme.colorScheme.primary,
                                )),
                            onTap: () {
                              Utils.launchURL('https://www.linkedin.com/in/jeprato/');
                            },
                          ),
                          const SizedBox(height: 2),
                          ListTile(
                            tileColor: Colors.black.withAlpha(128),
                            leading: Image(
                              image: const Svg('assets/images/Hiberus.svg'),
                              width: 24,
                              height: 24,
                              color: AppTheme.lightTheme.colorScheme.primary,
                            ),
                            title: Text('hiberus',
                                style: TextStyle(
                                  color: AppTheme.lightTheme.colorScheme.primary,
                                )),
                            onTap: () {
                              Utils.launchURL('https://www.hiberus.com');
                            },
                          ),
                          const SizedBox(height: 20),
                          if (data != null && !data.isLoggedIn)
                            ListTile(
                              tileColor: Colors.black.withAlpha(128),
                              leading:
                                  Icon(Icons.login_outlined, color: AppTheme.lightTheme.colorScheme.primary, size: 24),
                              title: Text(localizations.signIn,
                                  style: TextStyle(
                                    color: AppTheme.lightTheme.colorScheme.primary,
                                  )),
                              onTap: () {
                                // Scaffold.of(context).closeDrawer();
                                _showLoginDialog(context);
                              },
                            ),
                          if (data != null && data.id == "error")
                            Text(data.name, style: TextStyle(color: AppTheme.lightTheme.colorScheme.primary)),
                          if (data != null && data.isLoggedIn)
                            ListTile(
                              tileColor: Colors.black.withAlpha(128),
                              leading:
                                  Icon(Icons.logout_outlined, color: AppTheme.lightTheme.colorScheme.primary, size: 24),
                              title: Text(localizations.signOut,
                                  style: TextStyle(
                                    color: AppTheme.lightTheme.colorScheme.primary,
                                  )),
                              onTap: () {
                                //Scaffold.of(context).closeDrawer();
                                ref.read(authViewModelProvider.notifier).signOut();
                              },
                            ),
                          if (data == null) FadeInOutText(text: localizations.signIn)
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
                            ref
                                .read(localeNotifierProvider.notifier)
                                .setLocale(locale: const Locale('en'), context: context);
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
                            ref
                                .read(localeNotifierProvider.notifier)
                                .setLocale(locale: const Locale('es'), context: context);
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
                            ref
                                .read(localeNotifierProvider.notifier)
                                .setLocale(locale: const Locale('es', 'VE'), context: context);
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
                            ref
                                .read(localeNotifierProvider.notifier)
                                .setLocale(locale: const Locale('ca'), context: context);
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

  void _showLoginDialog(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false, // Evita cerrar tocando fuera del diálogo
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Iniciar sesión'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppTheme.lightTheme.colorScheme.primary,
                foregroundColor: AppTheme.lightTheme.colorScheme.secondary,
                textStyle: TextStyle(
                  color: AppTheme.lightTheme.colorScheme.secondary,
                ),
              ),
              child: Text(
                localizations.cancel,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text(localizations.signIn),
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;

                // Aquí puedes hacer tu lógica de autenticación
                ref.read(authViewModelProvider.notifier).sigIn(email, password);

                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
          ],
        );
      },
    );
  }
}
