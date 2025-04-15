import 'dart:convert';
import 'dart:developer' as developer;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:javier_website/core/auth_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  factory AuthState.fromJson(Map<String, Object?> json) => _$AuthStateFromJson(json);
}

@Riverpod()
class AuthViewModel extends _$AuthViewModel {
  @override
  Future<AuthState> build() async {
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('authState');
    if (authData != null) {
      return AuthState.fromJson(jsonDecode(authData));
    } else {
      if (state.value != null && state.value!.id.isNotEmpty) {
        return state.value!;
      }
      await _loginWithEnvVars();
      final user = FirebaseAuth.instance.currentUser;
      return AuthState(
        id: user?.uid.toString() ?? '',
        name: '',
        email: '',
        photoUrl: '',
        isLoggedIn: false,
      );
    }
  }

  bool isLoggedIn() => state.value?.isLoggedIn ?? false;

  Future<void> sigIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        final user = userCredential.user;
        var authState = AuthState(
          id: user!.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          photoUrl: user.photoURL ?? '',
          isLoggedIn: true,
        );
        // Guarda el estado en localStorage
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('authState', jsonEncode(authState.toJson()));
        return authState;
      },
    );
  }

  Future<void> sigInAnonymous() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        _loginWithEnvVars();
        final user = FirebaseAuth.instance.currentUser;
        var authState = AuthState(
          id: user!.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          photoUrl: user.photoURL ?? '',
          isLoggedIn: true,
        );
        // Guarda el estado en localStorage
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('authState', jsonEncode(authState.toJson()));
        return authState;
      },
    );
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await FirebaseAuth.instance.signOut();
      await _loginWithEnvVars();
      // Elimina el estado de localStorage
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('authState');
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
      String email = AuthHelper.email;
      String password = AuthHelper.password;

      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      developer.log("Usuario autenticado exitosamente.");
    } catch (e) {
      developer.log("Error al autenticar", error: e);
    }
  }
}
