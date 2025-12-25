import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/view/blog/resumed_entries.dart';
import 'package:javier_website/view/widgets/reusable_entries_list.dart';
import 'package:javier_website/viewmodel/blog/entries_view_model.dart';

class ResumedEntriesFromFirebase extends ConsumerWidget {
  final int listLength;
  final int page;
  final bool showLoggedActions;

  const ResumedEntriesFromFirebase({
    super.key,
    this.listLength = 3,
    this.page = 0,
    this.showLoggedActions = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entriesAsync =
        ref.watch(entriesViewModelProvider(limit: listLength, page: page));

    return ReusableEntriesList<Entry>(
      data: entriesAsync,
      builder: (entries) => ResumedEntries(
        entries: entries,
        showLoggedActions: showLoggedActions,
      ),
    );
  }
}
