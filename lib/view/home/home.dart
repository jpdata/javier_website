import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/error_handler.dart';
import 'package:javier_website/core/utils.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:javier_website/core/assets.dart';
import 'package:javier_website/view/home/widgets/icon_menu_item.dart';
import 'package:javier_website/view/home/widgets/indexed_content.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';
import 'package:javier_website/view/widgets/fade_in_out_text.dart';
import 'package:javier_website/viewmodel/auth/auth_view_model.dart';

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
    ref.watch(localeNotifierProvider);

    var authVm = ref.watch(authViewModelProvider);

    return authVm.when(
      data: (data) {
        return CommonScaffold(child: _scaffoldBody());
      },
      error: (error, stackTrace) => CommonScaffold(child: ErrorHandler.errorWidget(error)),
      loading: () {
        return CommonScaffold(actions: _socialActions(context), child: _scaffoldBody(isLoading: true));
      },
    );
  }

  Widget _scaffoldBody({bool isLoading = false}) {
    double screenWidth = MediaQuery.of(context).size.width > 600 ? 600 : MediaQuery.of(context).size.width;
    double lateralPadding = screenWidth < 600 ? 30 : screenWidth * .25;
    return Column(
      children: [
        Expanded(
          child: Center(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(lateralPadding, 10, lateralPadding, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _profileSection(screenWidth),
                      if (!isLoading) IndexedContent(index: _index),
                      if (isLoading) Center(child: FadeInOutText(text: localizations.loadind_data)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        _footerSection(),
      ],
    );
  }

  Widget _profileSection(double screenWidth) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: _index == 0 ? screenWidth * .45 : screenWidth / 2 * .45,
          height: _index == 0 ? screenWidth * .45 : screenWidth / 2 * .45,
          child: Image(
            image: const Svg(Assets.javiWireframe),
            width: screenWidth * .45,
            color: AppTheme.lightTheme.colorScheme.secondary,
          ),
        ),
        Expanded(
          child: AnimatedOpacity(
            opacity: [0, 4].contains(_index) ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: _typeWriterText(
              text: <String>[
                '${localizations.cogito_ergo_sum}\n${localizations.doing_cool_stuf_with_porgramming_languages}',
              ],
              onFinished: () {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _footerSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
      child: Column(
        children: [
          _socialNetworkFooter(),
          const SizedBox(height: 2),
          _footer(),
        ],
      ),
    );
  }

  SingleChildScrollView _socialNetworkFooter() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppTheme.lightTheme.colorScheme.primary.withAlpha(128),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < _socialActions(context).length; i++) ...[
                _socialActions(context)[i],
                if (i < _socialActions(context).length - 1) const SizedBox(width: 10),
              ],
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _footer() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppTheme.lightTheme.colorScheme.secondary.withAlpha(128),
        padding: const EdgeInsets.all(8.0),
        child: _functionalIGroup(),
      ),
    );
  }

  // Widget _socialNetworkGroup() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       for (var i = 0; i < _socialActions(context).length; i++) ...[
  //         _socialActions(context)[i],
  //         if (i < _socialActions(context).length - 1) const SizedBox(height: 10),
  //       ],
  //     ],
  //   );
  // }

  List<Widget> _socialActions(BuildContext context, {double size = 32}) => [
        IconMenuItem.iconMenuItem(
          onTap: () {
            Utils.launchURL('https://www.linkedin.com/in/jeprato/');
          },
          imagePath: Assets.linkedin,
          imagePathMouseOver: Assets.linkedinNegative,
          tooltipTextMouseOver: localizations.linkedin,
          color: AppTheme.lightTheme.colorScheme.secondary,
          height: size,
          width: size,
        ),
        IconMenuItem.iconMenuItem(
          onTap: () {
            Utils.launchURL('https://www.hiberus.com');
          },
          imagePath: Assets.hiberus,
          imagePathMouseOver: Assets.hiberusNegative,
          tooltipTextMouseOver: localizations.hiberus,
          color: AppTheme.lightTheme.colorScheme.secondary,
          height: size,
          width: size,
        ),
        IconMenuItem.iconMenuItem(
          onTap: () {
            Utils.launchMailto(context);
          },
          imagePath: Assets.mail,
          imagePathMouseOver: Assets.mailNegative,
          tooltipTextMouseOver: localizations.contact_me,
          color: AppTheme.lightTheme.colorScheme.secondary,
          height: size,
          width: size,
        ),
        IconMenuItem.iconMenuItem(
          onTap: () {
            Utils.launchURL('https://www.instagram.com/jeprato');
          },
          imagePath: Assets.instagram,
          imagePathMouseOver: Assets.instagramNegative,
          tooltipTextMouseOver: localizations.instagram,
          color: AppTheme.lightTheme.colorScheme.secondary,
          height: size,
          width: size,
        ),
        IconMenuItem.iconMenuItem(
          onTap: () {
            Utils.launchURL('https://www.github.com/jpdata');
          },
          imagePath: Assets.github,
          imagePathMouseOver: Assets.githubNegative,
          tooltipTextMouseOver: localizations.github,
          color: AppTheme.lightTheme.colorScheme.secondary,
          height: size,
          width: size,
        ),
      ];

  Row _functionalIGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _navigationButtons(),
    );
  }

  List<Widget> _navigationButtons() {
    return [
      _navButton(0, Assets.home, Assets.homeNegative, localizations.home),
      const SizedBox(width: 10),
      _navButton(4, Assets.aboutMe, Assets.aboutMeNegative, localizations.about_me),
      const SizedBox(width: 10),
      _navButton(3, Assets.blog, Assets.blogNegative, localizations.blog),
      const SizedBox(width: 10),
      _navButton(1, Assets.portfolio, Assets.portfolioNegative, localizations.portfolio),
      const SizedBox(width: 10),
      _navButton(2, Assets.collaborators, Assets.collaboratorsNegative, localizations.collaborators),
    ];
  }

  Widget _navButton(int index, String imagePath, String hoverPath, String tooltip) {
    return IconMenuItem.iconMenuItem(
      onTap: () => setState(() => _index = index),
      imagePath: imagePath,
      imagePathMouseOver: hoverPath,
      tooltipTextMouseOver: tooltip,
    );
  }

  Widget _typeWriterText({required List<String> text, void Function()? onFinished}) {
    var locale = ref.read(localeNotifierProvider);
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
