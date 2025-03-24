import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/utils.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/view/home/widgets/resumed_entries_widget.dart';
import 'package:javier_website/viewmodel/entries_view_model.dart';

class ResumedEntriesFromFirebaseWidget extends ConsumerStatefulWidget {
  const ResumedEntriesFromFirebaseWidget({super.key});

  @override
  ConsumerState<ResumedEntriesFromFirebaseWidget> createState() =>
      _EntriesListWidgetState();
}

class _EntriesListWidgetState
    extends ConsumerState<ResumedEntriesFromFirebaseWidget> {
  int expandedIndex = -1;
  int expandedCommentIndex = -1;

  @override
  Widget build(BuildContext context) {
    var entryVm = ref.watch(entriesViewModelProvider);

    return entryVm.when(
      data: (entries) => _entriesWithNewWidget(entries),
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }

  _entriesWithNewWidget(List<Entry> entries) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        0,
        0,
        0,
        //Utils.mediaWidthPercent(context, 25),
        0,
      ),
      child: SingleChildScrollView(
        child: ResumedEntriesWidget(
          entries: entries,
        ),
      ),
    );
  }
}
