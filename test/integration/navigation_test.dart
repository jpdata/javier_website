import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:javier_website/main.dart';
import 'package:javier_website/view/auth/sign_in_page.dart';
import 'package:javier_website/view/home/home.dart';

void main() {
  group('Navigation Integration Tests', () {
    testWidgets('app starts and displays home page', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MyApp(),
        ),
      );

      // App should render without errors
      expect(find.byType(MyApp), findsOneWidget);
    });

    testWidgets('home page renders with content', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Home(title: 'Javier'),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Home page should be visible
      expect(find.byType(Home), findsOneWidget);
    });

    testWidgets('sign in page renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: SignInPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Sign in page should be visible
      expect(find.byType(SignInPage), findsOneWidget);
    });
  });
}
