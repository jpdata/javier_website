import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/analytics_service.dart';
import 'package:javier_website/core/error_handler.dart';
import 'package:javier_website/view/blog/entry_detail_widget.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';
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
  void initState() {
    super.initState();
    AnalyticsService.logPageView(pageName: 'blog_entry_detail', pageClass: 'BlogEntryDetail');
  }

  @override
  Widget build(BuildContext context) {
    final entry = ref.watch(entryViewModelProvider(widget.id));
    final auth = ref.watch(authViewModelProvider.notifier);
    double screenWidth = MediaQuery.of(context).size.width;

    return CommonScaffold(
      showBackButton: true,
      title: 'Artículo',
      showTitle: true,
      child: entry.when(
        data: (data) => Padding(
          padding: EdgeInsets.fromLTRB(screenWidth * .10, 8, screenWidth * .10, 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: EntryDetailWidget(entry: data, showEditEntryButton: auth.isLoggedIn()),
          ),
        ),
        error: (error, stackTrace) => Center(child: ErrorHandler.errorWidget(error)),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
