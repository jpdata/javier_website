import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

part 'auth_provider.g.dart';

@Riverpod()
class AuthProvider extends _$AuthProvider {
  UserCredential? _userCredential;

  @override
  Future<bool> build() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      remoteConfig.fetchAndActivate();
      //await remoteConfig.setDefaults({'dbuser': '', 'dbpassword': ''});
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ));
      var user = remoteConfig.getString("dbuser");
      var password = remoteConfig.getString("dbpassword");
      return await _signInWithEmailAndPassword(user, password) != null;
    } catch (e) {
      return false;
    }
  }

  Future<UserCredential?> _signInWithEmailAndPassword(
      String email, String password) async {
    try {
      _userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userCredential;
    } on FirebaseAuthException catch (e) {
      if (e .code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }
}
