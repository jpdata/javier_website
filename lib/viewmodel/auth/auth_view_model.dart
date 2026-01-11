import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:javier_website/core/analytics_service.dart';
import 'package:javier_website/core/auth_helper.dart';
import 'package:javier_website/core/providers/firebase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_view_model.g.dart';
part 'auth_view_model.freezed.dart';

const String _authStateKey = 'authState';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    required String id,
    required String name,
    required String email,
    required String photoUrl,
    required bool isLoggedIn,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, Object?> json) => _$AuthStateFromJson(json);
}

@Riverpod()
class AuthViewModel extends _$AuthViewModel {
  @override
  Future<AuthState> build() async {
    // Wait for Firebase initialization
    await ref.watch(firebaseProvider.future);

    // Check if user is already logged in Firebase
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return _userToAuthState(currentUser, isLoggedIn: true);
    }

    // Try to restore from local cache
    final cachedAuthState = await _getLocalAuthState();
    if (cachedAuthState != null) {
      return cachedAuthState;
    }

    // Try to login with env vars (service account)
    try {
      await _loginWithEnvVars();
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return _userToAuthState(user, isLoggedIn: false);
      }
    } catch (e) {
      // Silent fail - user can login manually
    }

    return const AuthState(id: '', name: '', email: '', photoUrl: '', isLoggedIn: false);
  }

  /// Sign in with email and password
  Future<void> sigIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user!;
      final authState = _userToAuthState(user, isLoggedIn: true);

      // Persist to local storage
      await _saveLocalAuthState(authState);

      // Track analytics
      await AnalyticsService.logSignIn(method: 'email');
      await AnalyticsService.setUserId(user.uid);
      await CrashlyticsService.setUserId(user.uid);

      return authState;
    });
  }

  /// Sign in with env vars (service account)
  Future<void> sigInAnonymous() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _loginWithEnvVars();
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('Failed to authenticate with service account');
      }

      final authState = _userToAuthState(user, isLoggedIn: true);

      // Persist to local storage
      await _saveLocalAuthState(authState);

      // Track analytics
      await AnalyticsService.logSignIn(method: 'service_account');
      await AnalyticsService.setUserId(user.uid);
      await CrashlyticsService.setUserId(user.uid);

      return authState;
    });
  }

  /// Sign out from Firebase and clear local cache
  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await FirebaseAuth.instance.signOut();

      // Clear local cache
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_authStateKey);

      // Track analytics
      await AnalyticsService.logSignOut();
      await AnalyticsService.clearUserId();
      await CrashlyticsService.clearUserId();

      return const AuthState(id: '', name: '', email: '', photoUrl: '', isLoggedIn: false);
    });
  }

  /// Check if user is logged in
  bool isLoggedIn() {
    final logged = state.value?.isLoggedIn ?? false;
    debugPrint('[AuthViewModel] isLoggedIn: $logged, state: \\${state.value}');
    return logged;
  }

  /// Private helpers

  /// Convert Firebase User to AuthState
  AuthState _userToAuthState(User user, {required bool isLoggedIn}) {
    return AuthState(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      photoUrl: user.photoURL ?? '',
      isLoggedIn: isLoggedIn,
    );
  }

  /// Get cached auth state from local storage
  Future<AuthState?> _getLocalAuthState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final authDataJson = prefs.getString(_authStateKey);
      if (authDataJson != null) {
        return AuthState.fromJson(jsonDecode(authDataJson) as Map<String, Object?>);
      }
    } catch (e) {
      // Ignore cache read errors
    }
    return null;
  }

  /// Save auth state to local storage
  Future<void> _saveLocalAuthState(AuthState authState) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_authStateKey, jsonEncode(authState.toJson()));
    } catch (e) {
      // Log but don't fail - persistence is not critical
    }
  }

  /// Login with environment variables (service account)
  /// This is used for automatic authentication with a backend service account
  Future<void> _loginWithEnvVars() async {
    final email = AuthHelper.email;
    final password = AuthHelper.password;

    if (email.isEmpty || password.isEmpty) {
      throw Exception('Service account credentials not configured');
    }

    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }
}
