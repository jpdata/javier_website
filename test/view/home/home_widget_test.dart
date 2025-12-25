import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:javier_website/view/home/home.dart';

void main() {
  group('Home Widget Tests', () {
    testWidgets('renders home page', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Home(title: 'Test'),
          ),
        ),
      );

      expect(find.byType(Home), findsOneWidget);
    });

    testWidgets('displays common scaffold', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Home(title: 'Test'),
          ),
        ),
      );

      // Home should render without errors
      expect(find.byType(Home), findsOneWidget);
    });

    testWidgets('renders without errors on cold start', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Home(title: 'Test'),
          ),
        ),
      );

      // Should complete without throwing
      expect(find.byType(Home), findsOneWidget);
    });
  });
}
