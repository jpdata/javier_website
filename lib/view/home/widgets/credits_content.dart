import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/utils.dart';
import 'package:javier_website/view/widgets/unfolding.dart';

class CreditsContent extends StatelessWidget {
  CreditsContent(
      {super.key,
      this.initialDelay = 0,
      this.duration = 500,
      this.unfold = true});

  final int initialDelay;
  final int duration;
  final bool unfold;

  final List<Map<String, String>> collaborators = [
    {
      'icon': 'assets/images/linkedin.svg',
      'name': 'John Gonzalez Vicent',
      'url': 'https://www.linkedin.com/in/johngonzalezvicent/',
      'description': localizations.design_colors_and_images,
    },
  ];

  final List<Map<String, String>> collaborations = [
    {
      'icon': 'assets/images/Linkedin.svg',
      'name': 'John Gonzalez Vicent',
      'url': 'https://www.linkedin.com/in/johngonzalezvicent/',
      'description': localizations.design_colors_and_images,
    },
  ];

  final List<Map<String, String>> creditsIMustGive = [
    // {
    //   'icon': 'assets/images/portfolio.svg',
    //   'name': 'Icono Portfolio',
    //   'url': 'https://iconscout.com/contributors/fullratio',
    //   'description': localizations.portfolio,
    // },
    // {
    //   'icon': 'assets/images/email.svg',
    //   'name': 'Icono email',
    //   'url': 'https://iconscout.com/contributors/eva-icons',
    //   'description': localizations.contact_me_by_email,
    // },
  ];

  @override
  Widget build(BuildContext context) {
    var textStyle = DefaultTextStyle.of(context).style;

    return unfold
        ? Unfolding.unfold(
            duration: Duration(
                milliseconds: duration *
                    (initialDelay +
                        3 +
                        collaborators.length +
                        collaborations.length +
                        creditsIMustGive.length)),
            child: _unfoldContent(textStyle),
          )
        : Unfolding.fold(
            duration: Duration(
                milliseconds: duration *
                    (initialDelay +
                        3 +
                        collaborators.length +
                        collaborations.length +
                        creditsIMustGive.length)),
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
            localizations.collaborators,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        ...collaborators.map((item) {
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
        //Collaborations
        // DelayedDisplay(
        //   delay: Duration(milliseconds: initialDelay),
        //   child: Text(
        //     localizations.my_collaborations,
        //     style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        //   ),
        // ),
        // ...collaborations.map((project) {
        //   index++;
        //   return DelayedDisplay(
        //     delay: Duration(milliseconds: initialDelay + index * duration),
        //     child: ListTile(
        //       leading: Image(image: Svg(project['icon']!)),
        //       title: Text(project['name']!, style: textStyle),
        //       subtitle: Text(project['description']!, style: textStyle),
        //       onTap: () => _launchURL(project['url']!),
        //     ),
        //   );
        // }),
        //Credits I must give
        (creditsIMustGive.isNotEmpty
            ? DelayedDisplay(
                delay: Duration(milliseconds: initialDelay),
                child: Text(
                  localizations.credits_i_must_give,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              )
            : Container()),
        ...creditsIMustGive.map((item) {
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
