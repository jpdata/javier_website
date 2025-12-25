import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';

class LocaleListenerWidget extends ConsumerWidget {
  final Widget? child;
  const LocaleListenerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the locale notifier to trigger rebuilds when locale changes
    ref.watch(localeNotifierProvider);
    return child ?? const SizedBox.shrink();
  }
}