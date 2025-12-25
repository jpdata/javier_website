import 'package:javier_website/core/analytics_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_provider.g.dart';

/// Provider for analytics service
/// 
/// Usage:
/// ```dart
/// ref.read(analyticsServiceProvider).logPageView(pageName: 'Home');
/// ```
@riverpod
AnalyticsService analyticsService(ref) {
  return AnalyticsService();
}

/// Provider for Crashlytics service
/// 
/// Usage:
/// ```dart
/// ref.read(crashlyticsServiceProvider).log('App started');
/// ```
@riverpod
CrashlyticsService crashlyticsService(ref) {
  return CrashlyticsService();
}
