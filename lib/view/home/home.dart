import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/utils.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';
import 'package:javier_website/view/Themes/app_theme.dart';
import 'package:javier_website/view/widgets/fading_edges_image.dart';
import 'package:javier_website/view/widgets/main_drawer.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart' as rive;

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    LocalizationManager.updateLocale(context); // Update localizations
    return _scaffoldThenBackground();
  }

  Widget _scaffoldThenBackground() {
    return _scaffoldItem(
        child: Container(
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
    ));
  }

  Scaffold _scaffoldItem({required Widget? child}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.lightTheme.colorScheme.primary,
        title: Image(
            image: const Svg('assets/images/logo-azul-c.svg'),
            width: screenWidth * .10,
            height: screenHeight * .10,
            fit: BoxFit.fill),
      ),
      backgroundColor: Colors.transparent,
      drawer: const MainDrawer(),
      body: child,
    );
  }

  Widget _scaffoldBody() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.fromLTRB(screenWidth * .0, 0, screenWidth * .4, 0),
            child: SizedBox(
              width: screenWidth * .30,
              height: screenWidth / 1.48 * .30,
              child: const rive.RiveAnimation.asset(
                'assets/animations/javier.riv',
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(screenWidth * .05, 0, screenWidth * .05, 0),
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
          const Spacer(),
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
          fontSize: 60.0 * Utils.screenHzRelation(context),
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
}
