import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/view/Themes/app_theme.dart';
import 'package:javier_website/view/widgets/main_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            width: 25,
            height: 25,
          ).image,
          repeat: ImageRepeat.repeat,
          scale: 1.5,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.15), BlendMode.dstATop),
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
        title: Image(
            image: const Svg('assets/images/logo-azul-c.svg'),
            width: screenWidth * .10,
            height: screenHeight * .10,
            fit: BoxFit.fill),
      ),
      backgroundColor: Colors.transparent,
      drawer: const MainDrawer(),
      body: child,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _scaffoldBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          cogitoErgoSum(),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }

  Widget cogitoErgoSum() => SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 30.0,
            fontFamily: 'GalaxyBt',
          ),
          child: AnimatedTextKit(
            totalRepeatCount: 1,
            isRepeatingAnimation: false,
            animatedTexts: [
              TypewriterAnimatedText(localizations.cogito_ergo_sum,
                  speed: const Duration(milliseconds: 200)),
            ],
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      );
}
