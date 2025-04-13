import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/utils.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:javier_website/view/home/widgets/footer_icon_menu_item.dart';
import 'package:javier_website/view/home/widgets/indexed_content.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    ref.watch(localeProvider);
    return CommonScaffold(child: _scaffoldBody());
  }

  Widget _scaffoldBody() {
    double screenWidth = MediaQuery.of(context).size.width > 600 ? 600 : MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(
          child: Center(
            child: ListView(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth * .05, screenWidth * .05, screenWidth * .05, 0),
                      child: Row(
                        children: [
                          Image(
                              image: const Svg("assets/images/javi-wireframe.svg"),
                              width: screenWidth * .45,
                              color: AppTheme.lightTheme.colorScheme.secondary),
                          //SizedBox(width: screenWidth * .05),
                          _typeWriterText(
                            text: <String>[
                              '${localizations.cogito_ergo_sum}\n${localizations.doing_cool_stuf_with_porgramming_languages}',
                            ],
                            onFinished: () {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth * .05, 10, screenWidth * .05, 0),
                      child: IndexedContent(index: _index),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
          child: _footer(),
        ),
      ],
    );
  }

  SingleChildScrollView _footer() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppTheme.lightTheme.colorScheme.secondary.withAlpha(128),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FooterIconMenuItem(
                onTap: () {
                  setState(() {
                    _index = 3;
                  });
                },
                imagePath: 'assets/images/Blog.svg',
                imagePathMouseOver: 'assets/images/Blog-negativo.svg',
              ),
              const SizedBox(width: 10), // Replace Flexible with SizedBox
              FooterIconMenuItem(
                onTap: () {
                  Utils.launchURL('https://www.linkedin.com/in/jeprato/');
                },
                imagePath: 'assets/images/Linkedin.svg',
                imagePathMouseOver: 'assets/images/Linkedin-negativo.svg',
              ),
              const SizedBox(width: 10),
              FooterIconMenuItem(
                onTap: () {
                  setState(() {
                    _index = 1;
                  });
                },
                imagePath: 'assets/images/Portfolio.svg',
                imagePathMouseOver: 'assets/images/Portfolio-negativo.svg',
              ),
              const SizedBox(width: 10),
              FooterIconMenuItem(
                onTap: () {
                  setState(() {
                    _index = 2;
                  });
                },
                imagePath: 'assets/images/Colaboradores.svg',
                imagePathMouseOver: 'assets/images/Colaboradores-negativo.svg',
              ),
              const SizedBox(width: 10),
              FooterIconMenuItem(
                onTap: () {
                  Utils.launchURL('https://www.hiberus.com');
                },
                imagePath: 'assets/images/Hiberus.svg',
                imagePathMouseOver: 'assets/images/Hiberus-negativo.svg',
              ),
              const SizedBox(width: 10),
              FooterIconMenuItem(
                onTap: () {
                  Utils.launchMailto(context);
                },
                imagePath: 'assets/images/Mail.svg',
                imagePathMouseOver: 'assets/images/Mail-negativo.svg',
              ),
              const SizedBox(width: 10),
              FooterIconMenuItem(
                onTap: () {
                  Utils.launchURL('https://www.instagram.com/jeprato');
                },
                imagePath: 'assets/images/Instagram.svg',
                imagePathMouseOver: 'assets/images/Instagram-negativo.svg',
              ),
              const SizedBox(width: 10),
              FooterIconMenuItem(
                onTap: () {
                  Utils.launchURL('https://www.github.com/jpdata');
                },
                imagePath: 'assets/images/Github.svg',
                imagePathMouseOver: 'assets/images/Github-negativo.svg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _typeWriterText({required List<String> text, void Function()? onFinished}) {
    var locale = ref.read(localeProvider);
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * .40,
      //height: MediaQuery.of(context).size.height * .3,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 60.0 * Utils.screenHzRelation(context),
          fontFamily: 'GalaxyBt',
          color: AppTheme.lightTheme.colorScheme.secondary,
        ),
        child: AnimatedTextKit(
          key: ValueKey(locale),
          pause: const Duration(milliseconds: 1000),
          totalRepeatCount: 1,
          isRepeatingAnimation: false,
          animatedTexts: [
            ...text.map(
              (text) => TypewriterAnimatedText(text, speed: const Duration(milliseconds: 90)),
            )
          ],
          onTap: () {
            //print("Tap Event");
          },
          onFinished: () {
            if (onFinished != null) {
              setState(() {
                onFinished();
              });
            }
          },
        ),
      ),
    );
  }
}
