import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/model/news_entry.dart';
import 'package:javier_website/view/home/widgets/news_entries.dart';
import 'package:javier_website/view/widgets/fade_in_out_text.dart';
import 'package:javier_website/viewmodel/news/news_entries_view_model.dart';
import 'package:javier_website/view/widgets/unfolding.dart';

class NewsEntriesFromFirebase extends ConsumerStatefulWidget {
  final int initialDelay;
  final int duration;
  final bool unfold;

  const NewsEntriesFromFirebase({
    super.key,
    this.initialDelay = 0,
    this.duration = 500,
    this.unfold = true,
  });

  @override
  ConsumerState<NewsEntriesFromFirebase> createState() => _EntriesListWidgetState();
}

class _EntriesListWidgetState extends ConsumerState<NewsEntriesFromFirebase> {
  int expandedIndex = -1;
  int expandedCommentIndex = -1;

  @override
  Widget build(BuildContext context) {
    var entryVm = ref.watch(newsEntriesViewModelProvider());

    return entryVm.when(
      data: (entries) =>  widget.unfold
        ? Unfolding.unfold(
            duration: Duration(
                milliseconds: widget.duration * (widget.initialDelay + entries.length)),
            child: _unfoldContent(entries),
          )
        : Unfolding.fold(
            duration: Duration(
                milliseconds: widget.duration * (widget.initialDelay + entries.length)),
            child: _unfoldContent(entries),
          ),
      loading: () {
        return FadeInOutText(text: localizations.loadind_data);
      },
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }

  Padding _unfoldContent(List<NewsEntry> entries) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: NewsEntries(
        entries: entries,
      ),
    );
  }
}
