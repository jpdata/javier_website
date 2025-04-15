import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/view/news/resumed_news_entries.dart';
import 'package:javier_website/view/widgets/fade_in_out_text.dart';
import 'package:javier_website/viewmodel/news/news_entries_view_model.dart';

class ResumedNewsEntriesFromFirebase extends ConsumerStatefulWidget {
  const ResumedNewsEntriesFromFirebase({super.key});

  @override
  ConsumerState<ResumedNewsEntriesFromFirebase> createState() => _EntriesListWidgetState();
}

class _EntriesListWidgetState extends ConsumerState<ResumedNewsEntriesFromFirebase> {
  int expandedIndex = -1;
  int expandedCommentIndex = -1;

  @override
  Widget build(BuildContext context) {
    var entryVm = ref.watch(newsEntriesViewModelProvider());

    return entryVm.when(
      data: (entries) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: ResumedNewsEntries(
          entries: entries,
        ),
      ),
      loading: () {
        return FadeInOutText(text: localizations.loadind_data);
      },
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
