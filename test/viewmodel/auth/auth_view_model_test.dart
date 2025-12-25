import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:javier_website/viewmodel/auth/auth_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {
  @override
  final String uid;
  @override
  final String? displayName;
  @override
  final String? email;
  @override
  final String? photoURL;

  MockUser({
    required this.uid,
    this.displayName,
    this.email,
    this.photoURL,
  });
}

void main() {
  group('AuthViewModel', () {
    late ProviderContainer container;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is unauthenticated when no cached data exists', () async {
      // Create fresh container with no cached auth
      final authState = container.read(authViewModelProvider);

      expect(authState, isA<AsyncValue<AuthState>>());

      // Wait for async computation
      final result = await container.read(authViewModelProvider.future);
      expect(result.isLoggedIn, isFalse);
      expect(result.id, isEmpty);
    });

    test('AuthState can be converted to/from JSON', () {
      const authState = AuthState(
        id: 'test-uid',
        name: 'Test User',
        email: 'test@example.com',
        photoUrl: 'https://example.com/photo.jpg',
        isLoggedIn: true,
      );

      // Convert to JSON
      final json = authState.toJson();
      expect(json['id'], equals('test-uid'));
      expect(json['name'], equals('Test User'));
      expect(json['email'], equals('test@example.com'));
      expect(json['isLoggedIn'], isTrue);

      // Convert from JSON
      final restored = AuthState.fromJson(json);
      expect(restored, equals(authState));
    });

    test('isLoggedIn returns correct boolean value', () {
      const loggedInState = AuthState(
        id: 'test-uid',
        name: 'Test',
        email: 'test@example.com',
        photoUrl: '',
        isLoggedIn: true,
      );

      const loggedOutState = AuthState(
        id: '',
        name: '',
        email: '',
        photoUrl: '',
        isLoggedIn: false,
      );

      expect(loggedInState.isLoggedIn, isTrue);
      expect(loggedOutState.isLoggedIn, isFalse);
    });

    test('AuthState with empty id indicates not logged in', () {
      const authState = AuthState(
        id: '',
        name: '',
        email: '',
        photoUrl: '',
        isLoggedIn: false,
      );

      expect(authState.id.isEmpty, isTrue);
      expect(authState.isLoggedIn, isFalse);
    });
  });
}
