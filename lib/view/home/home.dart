import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/utilities.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';
import 'package:javier_website/view/Themes/app_theme.dart';
import 'package:javier_website/view/home/widgets/indexed_content.dart';
import 'package:javier_website/view/widgets/fading_edges_image.dart';
import 'package:javier_website/view/widgets/main_drawer.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart' as rive;
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    LocalizationManager.updateLocale(context); // Update localizations
    return _scaffoldThenBackground();
  }

  Widget _scaffoldThenBackground() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.lightTheme.colorScheme.primary,
      ),
      backgroundColor: Colors.transparent,
      drawer: const MainDrawer(),
      body: Container(
        decoration: BoxDecoration(
          color: AppTheme.lightTheme.colorScheme.primary,
          image: DecorationImage(
            image: const Image(
              image: Svg('assets/images/bg-tile-part-c.svg'),
            ).image,
            repeat: ImageRepeat.repeat,
            scale: 1.5,
            colorFilter:
                ColorFilter.mode(Colors.black.withAlpha(38), BlendMode.dstATop),
          ),
        ),
        child: _scaffoldBody(),
      ),
    );
  }

  Widget _scaffoldBody() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min, // Add this line
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * .0, 0, screenWidth * .4, 0),
                child: SizedBox(
                  width: screenWidth * .30,
                  height: screenWidth / 1.48 * .30,
                  child: const rive.RiveAnimation.asset(
                    'assets/animations/javier.riv',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * .05, 0, screenWidth * .05, 0),
                child: Wrap(
                  children: [
                    const FadingEdgesImage(
                      imagePath: 'assets/images/javi.jpg',
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(width: screenWidth * .05),
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
                padding: EdgeInsets.fromLTRB(screenWidth * .05, 0, 0, 0),
                child: IndexedContent(index: _index),
              ),
              const SizedBox(height: 32.0), // Replace Flexible with SizedBox
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(width: 20), // Replace Flexible with SizedBox
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _index = 1;
                          });
                        },
                        child: const Image(
                          image: Svg("assets/images/portfolio.svg"),
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _index = 2;
                          });
                        },
                        child: const Image(
                          image: Svg("assets/images/credits.svg"),
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: const Image(
                          image: Svg("assets/images/hiberus-logo.svg"),
                          width: 50,
                          height: 50,
                        ),
                        onTap: () {
                          _launchURL('https://www.hiberus.com/');
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Utilities.launchMailto(context);
                        },
                        child: const Image(
                          image: Svg("assets/images/email.svg"),
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _typeWriterText(
      {required List<String> text, void Function()? onFinished}) {
    var locale = Provider.of<LocaleNotifier>(context).locale;
    return SizedBox(
      width: MediaQuery.of(context).size.width * .6,
      //height: MediaQuery.of(context).size.height * .3,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 60.0 * Utilities.screenHzRelation(context),
          fontFamily: 'GalaxyBt',
          color: Colors.white,
        ),
        child: AnimatedTextKit(
          key: ValueKey(locale),
          pause: const Duration(milliseconds: 1000),
          totalRepeatCount: 1,
          isRepeatingAnimation: false,
          animatedTexts: [
            ...text.map(
              (text) => TypewriterAnimatedText(text,
                  speed: const Duration(milliseconds: 90)),
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

  Future<void> _launchURL(String url) async {
    final uri = Uri.tryParse(url) ?? Uri();
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
