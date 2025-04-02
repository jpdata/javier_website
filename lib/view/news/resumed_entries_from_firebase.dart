import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/view/home/widgets/resumed_entries_widget.dart';
import 'package:javier_website/viewmodel/entries_view_model.dart';

class ResumedNewsEntriesFromFirebase extends ConsumerStatefulWidget {
  final int listLength;
  final int page;
  const ResumedNewsEntriesFromFirebase(
      {super.key, this.listLength = 3, this.page = 0});

  @override
  ConsumerState<ResumedNewsEntriesFromFirebase> createState() =>
      _EntriesListWidgetState();
}

class _EntriesListWidgetState
    extends ConsumerState<ResumedNewsEntriesFromFirebase> {
  int expandedIndex = -1;
  int expandedCommentIndex = -1;

  @override
  Widget build(BuildContext context) {
    var entryVm = ref.watch(
        entriesViewModelProvider(limit: widget.listLength, page: widget.page));

    return entryVm.when(
      data: (entries) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: ResumedEntriesWidget(
          entries: entries,
        ),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
