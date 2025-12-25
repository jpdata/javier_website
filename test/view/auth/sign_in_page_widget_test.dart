import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:javier_website/view/auth/sign_in_page.dart';

void main() {
  group('SignInPage Widget Tests', () {
    testWidgets('renders sign in page', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: SignInPage(),
          ),
        ),
      );

      expect(find.byType(SignInPage), findsOneWidget);
    });

    testWidgets('displays email and password fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: SignInPage(),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsWidgets);
    });

    testWidgets('displays sign in button', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: SignInPage(),
          ),
        ),
      );

      expect(find.byType(ElevatedButton), findsWidgets);
    });
  });
}
