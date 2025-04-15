// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthState _$AuthStateFromJson(Map<String, dynamic> json) => _AuthState(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String,
      isLoggedIn: json['isLoggedIn'] as bool,
    );

const _$AuthStateFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'email': 'email',
  'photoUrl': 'photoUrl',
  'isLoggedIn': 'isLoggedIn',
};

// ignore: unused_element
abstract class _$AuthStatePerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? email(String instance) => instance;
  // ignore: unused_element
  static Object? photoUrl(String instance) => instance;
  // ignore: unused_element
  static Object? isLoggedIn(bool instance) => instance;
}

Map<String, dynamic> _$AuthStateToJson(_AuthState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'isLoggedIn': instance.isLoggedIn,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authViewModelHash() => r'b9ddca0dbb9ded167f7bca8bd5ebf7859f16dd6c';

/// See also [AuthViewModel].
@ProviderFor(AuthViewModel)
final authViewModelProvider =
    AutoDisposeAsyncNotifierProvider<AuthViewModel, AuthState>.internal(
  AuthViewModel.new,
  name: r'authViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthViewModel = AutoDisposeAsyncNotifier<AuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
