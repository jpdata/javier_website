import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:javier_website/view/drawer/main_drawer.dart';

void main() {
  group('MainDrawer Widget Tests', () {
    testWidgets('renders drawer without errors', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              drawer: MainDrawer(),
              body: SizedBox.expand(),
            ),
          ),
        ),
      );

      expect(find.byType(MainDrawer), findsOneWidget);
    });

    testWidgets('drawer opens when menu tapped', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              drawer: MainDrawer(),
              body: SizedBox.expand(),
            ),
          ),
        ),
      );

      // Open drawer
      await tester.tap(find.byType(Scaffold));
      await tester.pumpAndSettle();

      // Drawer should be present
      expect(find.byType(MainDrawer), findsOneWidget);
    });
  });
}
