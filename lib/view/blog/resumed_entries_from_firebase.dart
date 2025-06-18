import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/view/blog/resumed_entries.dart';
import 'package:javier_website/view/widgets/fade_in_out_text.dart';
import 'package:javier_website/viewmodel/blog/entries_view_model.dart';

class ResumedEntriesFromFirebase extends ConsumerStatefulWidget {
  final int listLength;
  final int page;
  final bool showLoggedActions;
  const ResumedEntriesFromFirebase(
      {super.key, this.listLength = 3, this.page = 0, this.showLoggedActions = true});

  @override
  ConsumerState<ResumedEntriesFromFirebase> createState() =>
      _EntriesListWidgetState();
}

class _EntriesListWidgetState
    extends ConsumerState<ResumedEntriesFromFirebase> {
  int expandedIndex = -1;
  int expandedCommentIndex = -1;

  @override
  Widget build(BuildContext context) {
    var entryVm = ref.watch(
        entriesViewModelProvider(limit: widget.listLength, page: widget.page));

    return entryVm.when(
      data: (entries) => _entriesWithNewWidget(entries),
      loading: () => FadeInOutText(text: localizations.loadind_data),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }

  _entriesWithNewWidget(List<Entry> entries) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: SingleChildScrollView(
        child: ResumedEntries(
          entries: entries,
          showLoggedActions: widget.showLoggedActions,
        ),
      ),
    );
  }
}
