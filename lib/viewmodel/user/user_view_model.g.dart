// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentUserHash() => r'99fc015b071c2374ad60cc29fd7c60ec594e6ae0';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeFutureProvider<User>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserRef = AutoDisposeFutureProviderRef<User>;
String _$userViewModelHash() => r'afb7de3fc22f18f8d493fb31488ed725091195fa';

/// See also [UserViewModel].
@ProviderFor(UserViewModel)
final userViewModelProvider =
    AutoDisposeAsyncNotifierProvider<UserViewModel, List<User>>.internal(
  UserViewModel.new,
  name: r'userViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserViewModel = AutoDisposeAsyncNotifier<List<User>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
