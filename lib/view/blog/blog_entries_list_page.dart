import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';
import 'package:javier_website/viewmodel/entries_view_model.dart';
import 'package:javier_website/router/rout_names.dart';

class BlogEntriesListPage extends ConsumerWidget {
  const BlogEntriesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var entryVm = ref.watch(entriesViewModelProvider);

    return CommonScaffold(
      showBackButton: true,
      child: entryVm.when(
        data: (entries) => ListView.builder(
          itemCount: entries.length,
          itemBuilder: (context, index) {
            final entry = entries[index];
            return ListTile(
              title: Text(entry.title),
              subtitle: Text(entry.subtitle),
              onTap: () {
                context.pushNamed(RoutNames.blogEntry, extra: entry);
              },
            );
          },
        ),
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: $error'),
      ),
    );
  }
}
