import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/view/blog/resumed_entries_from_firebase.dart';
import 'package:javier_website/view/widgets/unfolding.dart';

class ResumedEntriesContent extends ConsumerStatefulWidget {
  const ResumedEntriesContent({super.key, this.initialDelay = 0, this.duration = 500, this.unfold = true});

  final int initialDelay;
  final int duration;
  final bool unfold;

  @override
  ConsumerState<ResumedEntriesContent> createState() => _ResumedEntriesContentState();
}

class _ResumedEntriesContentState extends ConsumerState<ResumedEntriesContent> {
  @override
  Widget build(BuildContext context) {
    return widget.unfold
        ? Unfolding.unfold(
            duration: Duration(milliseconds: widget.duration * (widget.initialDelay + 3)),
            child: _unfoldContent(),
          )
        : Unfolding.fold(
            duration: Duration(milliseconds: widget.duration * (widget.initialDelay + 3)), child: _unfoldContent());
  }

  Column _unfoldContent() {
    int index = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DelayedDisplay(
          delay: Duration(milliseconds: widget.initialDelay),
          child: Text(
            localizations.blog_entries,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        DelayedDisplay(
          delay: Duration(milliseconds: widget.initialDelay + index * widget.duration),
          child: const ResumedEntriesFromFirebase(
            page: 0,
            listLength: 3,
            showLoggedActions: false,
          ),
        ),
      ],
    );
  }
}
