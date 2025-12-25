import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/error_handler.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/core/utils.dart';
import 'package:javier_website/view/widgets/unfolding.dart';
import 'package:javier_website/viewmodel/about_me/about_me_view_model.dart';

class AboutMeContent extends ConsumerStatefulWidget {
  const AboutMeContent({super.key, this.initialDelay = 0, this.duration = 500, this.unfold = true});

  final int initialDelay;
  final int duration;
  final bool unfold;

  @override
  ConsumerState<AboutMeContent> createState() => _AboutMeContentState();
}

class _AboutMeContentState extends ConsumerState<AboutMeContent> {
  @override
  Widget build(BuildContext context) {
    var textStyle = DefaultTextStyle.of(context).style;
    var aboutVm = ref.watch(aboutMeViewModelProvider);
    return aboutVm.when(
      data: (data) {
        return widget.unfold
            ? Unfolding.unfold(
                duration: Duration(milliseconds: widget.duration * (widget.initialDelay + 3)),
                child: _unfoldContent(textStyle, data.content),
              )
            : Unfolding.fold(
                duration: Duration(milliseconds: widget.duration * (widget.initialDelay + 3)),
                child: _unfoldContent(textStyle, data.content));
      },
      error: (error, stackTrace) => ErrorHandler.errorWidget(error),
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Column _unfoldContent(TextStyle textStyle, String text) {
    int index = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DelayedDisplay(
          delay: Duration(milliseconds: widget.initialDelay),
          child: Text(
            localizations.about_me,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        DelayedDisplay(
          delay: Duration(milliseconds: widget.initialDelay + index * widget.duration),
          child: HtmlWidget(
            text,
            onTapUrl: (url) {
              Utils.launchURL(url);
              return true;
            },
          ),
        ),
      ],
    );
  }
}
