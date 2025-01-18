import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/view/widgets/unfolding.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditsContent extends StatelessWidget {
  CreditsContent({super.key, this.initialDelay = 0, this.duration = 500});

  final int initialDelay;
  final int duration;

  final List<Map<String, String>> collaborators = [
    {
      'icon': 'assets/images/linkedin-icon-3.svg',
      'name': 'John Gonzalez Vicent',
      'url': 'https://www.linkedin.com/in/johngonzalezvicent/',
      'description': localizations.design_colors_and_images,
    },
  ];

  final List<Map<String, String>> collaborations = [
    {
      'icon': 'assets/images/linkedin-icon-3.svg',
      'name': 'John Gonzalez Vicent',
      'url': 'https://www.linkedin.com/in/johngonzalezvicent/',
      'description': localizations.design_colors_and_images,
    },
  ];

  final List<Map<String, String>> creditsImustgive = [
    {
      'icon': 'assets/images/linkedin-icon-3.svg',
      'name': 'John Gonzalez Vicent',
      'url': 'https://www.linkedin.com/in/johngonzalezvicent/',
      'description': localizations.design_colors_and_images,
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
      duration: Duration(
          milliseconds: duration *
              (initialDelay +
                  3 +
                  collaborators.length +
                  collaborations.length +
                  creditsImustgive.length)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DelayedDisplay(
            delay: Duration(milliseconds: initialDelay),
            child: Text(
              localizations.collaborators,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ...collaborators.map((project) {
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
          //Collaborations
          DelayedDisplay(
            delay: Duration(milliseconds: initialDelay),
            child: Text(
              localizations.my_collaborations,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ...collaborations.map((project) {
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
          //Credits I must give
          DelayedDisplay(
            delay: Duration(milliseconds: initialDelay),
            child: Text(
              localizations.credits_i_must_give,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ...creditsImustgive.map((project) {
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
