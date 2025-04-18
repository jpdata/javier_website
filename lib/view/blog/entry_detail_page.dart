import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/view/blog/entry_detail_widget.dart';
import 'package:javier_website/viewmodel/auth/auth_view_model.dart';
import 'package:javier_website/viewmodel/blog/entries_view_model.dart';

class EntryDetailPage extends ConsumerStatefulWidget {
  final String id;

  const EntryDetailPage({super.key, required this.id});

  @override
  ConsumerState<EntryDetailPage> createState() => _EntryDetailPageState();
}

class _EntryDetailPageState extends ConsumerState<EntryDetailPage> {
  @override
  Widget build(BuildContext context) {
    final entry = ref.watch(entryViewModelProvider(widget.id));
    final auth = ref.watch(authViewModelProvider.notifier);

    return entry.when(
      data: (data) => EntryDetailWidget(entry: data, showEditEntryButton: auth.isLoggedIn()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
