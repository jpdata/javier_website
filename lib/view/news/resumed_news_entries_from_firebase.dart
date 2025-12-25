import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/model/news_entry.dart';
import 'package:javier_website/view/news/resumed_news_entries.dart';
import 'package:javier_website/view/widgets/reusable_entries_list.dart';
import 'package:javier_website/viewmodel/news/news_entries_view_model.dart';

class ResumedNewsEntriesFromFirebase extends ConsumerWidget {
  const ResumedNewsEntriesFromFirebase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entriesAsync = ref.watch(newsEntriesViewModelProvider());

    return ReusableEntriesList<NewsEntry>(
      data: entriesAsync,
      builder: (entries) => ResumedNewsEntries(entries: entries),
    );
  }
}
