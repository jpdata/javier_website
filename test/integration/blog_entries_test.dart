import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:javier_website/view/blog/entry_detail_page.dart';
import 'package:javier_website/view/blog/resumed_entries.dart';

void main() {
  group('Blog Entry Integration Tests', () {
    testWidgets('resumed entries widget renders', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ResumedEntries(entries: []),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // ResumedEntries widget should be visible
      expect(find.byType(ResumedEntries), findsOneWidget);
    });

    testWidgets('entry detail page renders with id', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: EntryDetailPage(id: 'test-id'),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Entry detail page should be visible
      expect(find.byType(EntryDetailPage), findsOneWidget);
    });
  });
}
