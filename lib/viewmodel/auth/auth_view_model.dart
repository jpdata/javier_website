import 'dart:convert';
import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_view_model.g.dart';
part 'auth_view_model.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    required String id,
    required String name,
    required String email,
    required String photoUrl,
    required bool isLoggedIn,
  }) = _AuthState;
}

@Riverpod()
class AuthViewModel extends _$AuthViewModel {
  @override
  Future<AuthState> build() async {
    final user = FirebaseAuth.instance.currentUser;
    final Map<String, dynamic> credentials = jsonDecode(await rootBundle.loadString('assets/strings/credentials.json'));

    if (user != null && user.email != credentials['username']) {
      return AuthState(
        id: user.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
        photoUrl: user.photoURL ?? '',
        isLoggedIn: true,
      );
    } else {
      return const AuthState(
        id: '',
        name: '',
        email: '',
        photoUrl: '',
        isLoggedIn: false,
      );
    }
  }

  bool isLoggedIn() {
    return state.value?.isLoggedIn ?? false;
  }

  Future<void> sigIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        final user = userCredential.user;
        return AuthState(
          id: user!.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          photoUrl: user.photoURL ?? '',
          isLoggedIn: true,
        );
      },
    );
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await FirebaseAuth.instance.signOut();
      _loginWithEnvVars();
      return const AuthState(
        id: '',
        name: '',
        email: '',
        photoUrl: '',
        isLoggedIn: false,
      );
    });
  }

  Future<void> _loginWithEnvVars() async {
    try {
      final Map<String, dynamic> credentials =
          jsonDecode(await rootBundle.loadString('assets/strings/credentials.json'));

      String email = credentials['username'];
      String password = credentials['password'];

      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      developer.log("Usuario autenticado exitosamente.");
    } catch (e) {
      developer.log("Error al autenticar", error: e);
    }
  }
}
