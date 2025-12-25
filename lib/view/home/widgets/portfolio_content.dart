import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/assets.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/utils.dart';
import 'package:javier_website/view/widgets/unfolding.dart';

class PortfolioContent extends StatelessWidget {
  PortfolioContent(
      {super.key,
      this.initialDelay = 0,
      this.duration = 500,
      this.unfold = true});

  final int initialDelay;
  final int duration;
  final bool unfold;

  final List<Map<String, String>> projects = [
    {
      'icon': Assets.githubIcon,
      'name': localizations.my_website,
      'url': 'https://github.com/jpdata/javier_website',
      'description': localizations.my_website_description,
    },
    {
      'icon': Assets.githubIcon,
      'name': localizations.svg_style_cleaner,
      'url': 'https://github.com/jpdata/SvgStyleCleaner',
      'description': localizations.svg_style_cleaner_description,
    },
    {
      'icon': Assets.githubIcon,
      'name': localizations.api_open_builder,
      'url': 'https://github.com/jpdata/api_open_builder',
      'description': localizations.api_open_builder_description,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var textStyle = DefaultTextStyle.of(context).style;
    return unfold
        ? Unfolding.unfold(
            duration: Duration(
                milliseconds: duration * (initialDelay + projects.length)),
            child: _unfoldContent(textStyle),
          )
        : Unfolding.fold(
            duration: Duration(
                milliseconds: duration * (initialDelay + projects.length)),
            child: _unfoldContent(textStyle),
          );
  }

  Column _unfoldContent(TextStyle textStyle) {
    int index = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DelayedDisplay(
          delay: Duration(milliseconds: initialDelay),
          child: Text(
            localizations.some_of_my_projects,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        ...projects.map((item) {
          index++;
          return DelayedDisplay(
            delay: Duration(milliseconds: initialDelay + index * duration),
            child: ListTile(
              leading: Image(image: Svg(item['icon']!)),
              title: Text(item['name']!, style: textStyle),
              subtitle: Text(item['description']!, style: textStyle),
              onTap: () => Utils.launchURL(item['url']!),
            ),
          );
        }),
      ],
    );
  }
}
