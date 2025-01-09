import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:javier_website/core/providers/notifiers/locale_notifier.dart';

class LocaleListenerWidget extends StatelessWidget {
  final Widget? child;
  const LocaleListenerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleNotifier>(
      builder: (context, localeNotifier, wchild) {
        return child!;
      },
    );
  }
}