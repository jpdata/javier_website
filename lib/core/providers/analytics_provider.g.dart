// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for analytics service
///
/// Usage:
/// ```dart
/// ref.read(analyticsServiceProvider).logPageView(pageName: 'Home');
/// ```

@ProviderFor(analyticsService)
final analyticsServiceProvider = AnalyticsServiceProvider._();

/// Provider for analytics service
///
/// Usage:
/// ```dart
/// ref.read(analyticsServiceProvider).logPageView(pageName: 'Home');
/// ```

final class AnalyticsServiceProvider
    extends
        $FunctionalProvider<
          AnalyticsService,
          AnalyticsService,
          AnalyticsService
        >
    with $Provider<AnalyticsService> {
  /// Provider for analytics service
  ///
  /// Usage:
  /// ```dart
  /// ref.read(analyticsServiceProvider).logPageView(pageName: 'Home');
  /// ```
  AnalyticsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'analyticsServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$analyticsServiceHash();

  @$internal
  @override
  $ProviderElement<AnalyticsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AnalyticsService create(Ref ref) {
    return analyticsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnalyticsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnalyticsService>(value),
    );
  }
}

String _$analyticsServiceHash() => r'a78e9020e79b5e99632cc4cee7e5f7156c672acd';

/// Provider for Crashlytics service
///
/// Usage:
/// ```dart
/// ref.read(crashlyticsServiceProvider).log('App started');
/// ```

@ProviderFor(crashlyticsService)
final crashlyticsServiceProvider = CrashlyticsServiceProvider._();

/// Provider for Crashlytics service
///
/// Usage:
/// ```dart
/// ref.read(crashlyticsServiceProvider).log('App started');
/// ```

final class CrashlyticsServiceProvider
    extends
        $FunctionalProvider<
          CrashlyticsService,
          CrashlyticsService,
          CrashlyticsService
        >
    with $Provider<CrashlyticsService> {
  /// Provider for Crashlytics service
  ///
  /// Usage:
  /// ```dart
  /// ref.read(crashlyticsServiceProvider).log('App started');
  /// ```
  CrashlyticsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'crashlyticsServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$crashlyticsServiceHash();

  @$internal
  @override
  $ProviderElement<CrashlyticsService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CrashlyticsService create(Ref ref) {
    return crashlyticsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CrashlyticsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CrashlyticsService>(value),
    );
  }
}

String _$crashlyticsServiceHash() =>
    r'542aa3ece81c80242afe3dfde3fa1fe1963c01f9';
