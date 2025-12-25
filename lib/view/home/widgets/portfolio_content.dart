import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/providers/localized_content_provider.dart';
import 'package:javier_website/core/utils.dart';
import 'package:javier_website/view/widgets/unfolding.dart';

class PortfolioContent extends ConsumerWidget {
  final int initialDelay;
  final int duration;
  final bool unfold;

  const PortfolioContent({
    super.key,
    this.initialDelay = 0,
    this.duration = 500,
    this.unfold = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);
    var textStyle = DefaultTextStyle.of(context).style;

    return unfold
        ? Unfolding.unfold(
            duration: Duration(milliseconds: duration * (initialDelay + projects.length)),
            child: _unfoldContent(textStyle, projects),
          )
        : Unfolding.fold(
            duration: Duration(milliseconds: duration * (initialDelay + projects.length)),
            child: _unfoldContent(textStyle, projects),
          );
  }

  Column _unfoldContent(TextStyle textStyle, List<Map<String, String>> projects) {
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
