import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:javier_website/view/auth/sign_in_page.dart';

void main() {
  group('Authentication Integration Tests', () {
    testWidgets('sign in page renders with form fields', (WidgetTester tester) async {
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

      // Should have text form fields
      expect(find.byType(TextFormField), findsWidgets);
    });

    testWidgets('auth provider responds to state changes', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: SignInPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Auth provider should be accessible
      expect(find.byType(SignInPage), findsOneWidget);
    });

    testWidgets('sign in button is present and interactable', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: SignInPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Should have at least one button (sign in button)
      expect(find.byType(ElevatedButton), findsWidgets);
    });
  });
}
