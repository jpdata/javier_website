import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/view/blog/entry_widget.dart';
import 'package:javier_website/viewmodel/entries_view_model.dart';

class EntriesListWidget extends ConsumerStatefulWidget {
  const EntriesListWidget({super.key});

  @override
  ConsumerState<EntriesListWidget> createState() => _EntriesListWidgetState();
}

class _EntriesListWidgetState extends ConsumerState<EntriesListWidget> {

  @override
  Widget build(BuildContext context) {
    var entryVm = ref.watch(entriesViewModelProvider);

    return entryVm.when(
      data: (entries) => _entriesContent(entries),
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }

  Widget _entriesContent(List<Entry> entries) {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return ListTile(
          title: Text(entry.title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EntryWidget(entry: entry),
              ),
            );
          },
        );
      },
    );
  }
}
