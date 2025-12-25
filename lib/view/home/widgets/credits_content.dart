import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/providers/localized_content_provider.dart';
import 'package:javier_website/core/utils.dart';
import 'package:javier_website/view/widgets/unfolding.dart';

class CreditsContent extends ConsumerWidget {
  final int initialDelay;
  final int duration;
  final bool unfold;

  const CreditsContent({
    super.key,
    this.initialDelay = 0,
    this.duration = 500,
    this.unfold = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collaborators = ref.watch(collaboratorsProvider);
    final collaborations = ref.watch(collaborationsProvider);
    final credits = ref.watch(creditsProvider);
    
    var textStyle = DefaultTextStyle.of(context).style;
    final totalItems = collaborators.length + collaborations.length + credits.length + 3;

    return unfold
        ? Unfolding.unfold(
            duration: Duration(milliseconds: duration * (initialDelay + totalItems)),
            child: _unfoldContent(textStyle, collaborators, collaborations, credits),
          )
        : Unfolding.fold(
            duration: Duration(milliseconds: duration * (initialDelay + totalItems)),
            child: _unfoldContent(textStyle, collaborators, collaborations, credits),
          );
  }

  Column _unfoldContent(
    TextStyle textStyle,
    List<Map<String, String>> collaborators,
    List<Map<String, String>> collaborations,
    List<Map<String, String>> credits,
  ) {
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
        (credits.isNotEmpty
            ? DelayedDisplay(
                delay: Duration(milliseconds: initialDelay),
                child: Text(
                  localizations.credits_i_must_give,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              )
            : Container()),
        ...credits.map((item) {
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
