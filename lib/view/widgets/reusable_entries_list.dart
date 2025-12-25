import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/error_handler.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/view/widgets/fade_in_out_text.dart';

/// Generic widget for displaying lists of entries from Firebase
/// 
/// This widget serves as a reusable container that:
/// - Watches an AsyncValue for data
/// - Handles loading, error, and data states
/// - Delegates rendering to a child widget
/// 
/// Usage:
/// ```dart
/// ReusableEntriesList<Entry>(
///   data: ref.watch(entriesViewModelProvider(...)),
///   builder: (entries) => ResumedEntries(entries: entries),
/// )
/// ```
class ReusableEntriesList<T> extends StatelessWidget {
  /// The AsyncValue containing the list of entries
  final AsyncValue<List<T>> data;

  /// Builder function that creates a widget from the list of entries
  final Widget Function(List<T> entries) builder;

  const ReusableEntriesList({
    required this.data,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return data.when(
      data: (entries) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: builder(entries),
      ),
      loading: () => FadeInOutText(text: localizations.loadind_data),
      error: (error, stackTrace) => ErrorHandler.errorWidget(error),
    );
  }
}
