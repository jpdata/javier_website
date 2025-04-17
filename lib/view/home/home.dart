import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/utils.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';
import 'package:javier_website/view/themes/app_theme.dart';
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
        return CommonScaffold(actions: _socialActions(context), child: _scaffoldBody());
      },
      error: (error, stackTrace) {
        return Center(child: Text('Error authenticating service user: $error'));
      },
      loading: () {
        return Center(child: FadeInOutText(text: localizations.loadind_data));
      },
    );
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
                          // Container(
                          //     //color: AppTheme.lightTheme.colorScheme.secondary.withAlpha(128),
                          //     child: _socialNetworkGroup()),
                          // const SizedBox(width: 10),
                          Image(
                              image: const Svg("assets/images/javi-wireframe.svg"),
                              width: screenWidth * .45,
                              color: AppTheme.lightTheme.colorScheme.secondary),
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
          child: Column(
            children: [
              _functionalIGroup(),
              //const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialNetworkGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < _socialActions(context).length; i++) ...[
          _socialActions(context)[i],
          if (i < _socialActions(context).length - 1) const SizedBox(height: 10),
        ],
      ],
    );
  }

  List<Widget> _socialActions(BuildContext context) => [
        IconMenuItem.iconMenuItem(
          onTap: () {
            Utils.launchURL('https://www.linkedin.com/in/jeprato/');
          },
          imagePath: 'assets/images/linkedin.svg',
          imagePathMouseOver: 'assets/images/linkedin_negative.svg',
          tooltipTextMouseOver: localizations.linkedin,
          color: AppTheme.lightTheme.colorScheme.secondary,
          height: 28,
          width: 28,
        ),
        IconMenuItem.iconMenuItem(
          onTap: () {
            Utils.launchURL('https://www.hiberus.com');
          },
          imagePath: 'assets/images/hiberus.svg',
          imagePathMouseOver: 'assets/images/hiberus_negative.svg',
          tooltipTextMouseOver: localizations.hiberus,
          color: AppTheme.lightTheme.colorScheme.secondary,
          height: 28,
          width: 28,
        ),
        IconMenuItem.iconMenuItem(
          onTap: () {
            Utils.launchMailto(context);
          },
          imagePath: 'assets/images/mail.svg',
          imagePathMouseOver: 'assets/images/mail_negative.svg',
          tooltipTextMouseOver: localizations.contact_me,
          color: AppTheme.lightTheme.colorScheme.secondary,
          height: 28,
          width: 28,
        ),
        IconMenuItem.iconMenuItem(
          onTap: () {
            Utils.launchURL('https://www.instagram.com/jeprato');
          },
          imagePath: 'assets/images/instagram.svg',
          imagePathMouseOver: 'assets/images/instagram_negative.svg',
          tooltipTextMouseOver: localizations.instagram,
          color: AppTheme.lightTheme.colorScheme.secondary,
          height: 28,
          width: 28,
        ),
        IconMenuItem.iconMenuItem(
          onTap: () {
            Utils.launchURL('https://www.github.com/jpdata');
          },
          imagePath: 'assets/images/github.svg',
          imagePathMouseOver: 'assets/images/github_negative.svg',
          tooltipTextMouseOver: localizations.github,
          color: AppTheme.lightTheme.colorScheme.secondary,
          height: 28,
          width: 28,
        ),
      ];

  Row _functionalIGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconMenuItem.iconMenuItem(
          onTap: () {
            setState(() {
              _index = 0;
            });
          },
          imagePath: 'assets/images/home.svg',
          imagePathMouseOver: 'assets/images/home_negative.svg',
          tooltipTextMouseOver: localizations.home,
        ),
        const SizedBox(width: 10),
        IconMenuItem.iconMenuItem(
          onTap: () {
            setState(() {
              _index = 4;
            });
          },
          imagePath: 'assets/images/about_me.svg',
          imagePathMouseOver: 'assets/images/about_me_negative.svg',
          tooltipTextMouseOver: localizations.about_me,
        ),
        const SizedBox(width: 10), //
        IconMenuItem.iconMenuItem(
          onTap: () {
            setState(() {
              _index = 3;
            });
          },
          imagePath: 'assets/images/blog.svg',
          imagePathMouseOver: 'assets/images/blog_negative.svg',
          tooltipTextMouseOver: localizations.blog,
        ),
        const SizedBox(width: 10),
        IconMenuItem.iconMenuItem(
          onTap: () {
            setState(() {
              _index = 1;
            });
          },
          imagePath: 'assets/images/portfolio.svg',
          imagePathMouseOver: 'assets/images/portfolio_negative.svg',
          tooltipTextMouseOver: localizations.portfolio,
        ),
        const SizedBox(width: 10), // Replace Flexible with SizedBox
        IconMenuItem.iconMenuItem(
          onTap: () {
            setState(() {
              _index = 2;
            });
          },
          imagePath: 'assets/images/collaborators.svg',
          imagePathMouseOver: 'assets/images/collaborators_negative.svg',
          tooltipTextMouseOver: localizations.collaborators,
        ),
      ],
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
