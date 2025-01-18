import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/view/widgets/unfolding.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioContent extends StatelessWidget {
  PortfolioContent({super.key, this.initialDelay = 0, this.duration = 500});

  final int initialDelay;
  final int duration;

  final List<Map<String, String>> projects = [
    {
      'icon': 'assets/images/github-icon-2.svg',
      'name': localizations.my_website,
      'url': 'https://github.com/jpdata/javier_website',
      'description': localizations.my_website_description,
    },
    {
      'icon': 'assets/images/github-icon-2.svg',
      'name': localizations.svg_style_cleaner,
      'url': 'https://github.com/jpdata/SvgStyleCleaner',
      'description': localizations.svg_style_cleaner_description,
    },
    {
      'icon': 'assets/images/github-icon-2.svg',
      'name': localizations.api_open_builder,
      'url': 'https://github.com/jpdata/api_open_builder',
      'description': localizations.api_open_builder_description,
    },
  ];

  Future<void> _launchURL(String url) async {
    final uri = Uri.tryParse(url) ?? Uri();
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = DefaultTextStyle.of(context).style;
    int index = 0;

    return Unfolding(
      duration:
          Duration(milliseconds: duration * (initialDelay + projects.length)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DelayedDisplay(
            delay: Duration(milliseconds: initialDelay),
            child: Text(
              localizations.some_of_my_projects,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ...projects.map((project) {
            index++;
            return DelayedDisplay(
              delay: Duration(milliseconds: initialDelay + index * duration),
              child: ListTile(
                leading: Image(image: Svg(project['icon']!)),
                title: Text(project['name']!, style: textStyle),
                subtitle: Text(project['description']!, style: textStyle),
                onTap: () => _launchURL(project['url']!),
              ),
            );
          }),
        ],
      ),
    );
  }
}
