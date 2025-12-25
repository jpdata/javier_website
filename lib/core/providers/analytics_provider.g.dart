// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$analyticsServiceHash() => r'fa19e22c7c552c4e91ba12f76148d59ee1e954f8';

/// Provider for analytics service
///
/// Usage:
/// ```dart
/// ref.read(analyticsServiceProvider).logPageView(pageName: 'Home');
/// ```
///
/// Copied from [analyticsService].
@ProviderFor(analyticsService)
final analyticsServiceProvider = AutoDisposeProvider<AnalyticsService>.internal(
  analyticsService,
  name: r'analyticsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$analyticsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AnalyticsServiceRef = AutoDisposeProviderRef<AnalyticsService>;
String _$crashlyticsServiceHash() =>
    r'afe27d7c88c7d71b8817a0c3f62fc58548286986';

/// Provider for Crashlytics service
///
/// Usage:
/// ```dart
/// ref.read(crashlyticsServiceProvider).log('App started');
/// ```
///
/// Copied from [crashlyticsService].
@ProviderFor(crashlyticsService)
final crashlyticsServiceProvider =
    AutoDisposeProvider<CrashlyticsService>.internal(
  crashlyticsService,
  name: r'crashlyticsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$crashlyticsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CrashlyticsServiceRef = AutoDisposeProviderRef<CrashlyticsService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
