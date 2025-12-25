import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

/// Analytics service for tracking user events and performance
class AnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// Track page view
  static Future<void> logPageView({
    required String pageName,
    String? pageClass,
  }) async {
    try {
      await _analytics.logEvent(
        name: 'page_view',
        parameters: {
          'page_name': pageName,
          'page_class': pageClass ?? pageName,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );
      developer.log('Analytics: Page view tracked - $pageName');
    } catch (e) {
      developer.log('Analytics Error: Failed to log page view - $e');
    }
  }

  /// Track user sign in
  static Future<void> logSignIn({required String method}) async {
    try {
      await _analytics.logEvent(
        name: 'sign_in',
        parameters: {
          'method': method,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );
      developer.log('Analytics: Sign in tracked - method: $method');
    } catch (e) {
      developer.log('Analytics Error: Failed to log sign in - $e');
    }
  }

  /// Track user sign out
  static Future<void> logSignOut() async {
    try {
      await _analytics.logEvent(
        name: 'sign_out',
        parameters: {
          'timestamp': DateTime.now().toIso8601String(),
        },
      );
      developer.log('Analytics: Sign out tracked');
    } catch (e) {
      developer.log('Analytics Error: Failed to log sign out - $e');
    }
  }

  /// Track blog entry view
  static Future<void> logEntryView({
    required String entryId,
    required String entryTitle,
    String? entryCategory,
  }) async {
    try {
      final params = <String, Object>{
        'entry_id': entryId,
        'entry_title': entryTitle,
        'timestamp': DateTime.now().toIso8601String(),
      };
      if (entryCategory != null) {
        params['entry_category'] = entryCategory;
      }
      await _analytics.logEvent(
        name: 'view_entry',
        parameters: params,
      );
      developer.log('Analytics: Entry view tracked - $entryTitle');
    } catch (e) {
      developer.log('Analytics Error: Failed to log entry view - $e');
    }
  }

  /// Track entry creation
  static Future<void> logEntryCreated({
    required String entryId,
    required String entryType, // 'blog' or 'news'
    int? wordCount,
  }) async {
    try {
      final params = <String, Object>{
        'entry_id': entryId,
        'entry_type': entryType,
        'timestamp': DateTime.now().toIso8601String(),
      };
      if (wordCount != null) {
        params['word_count'] = wordCount;
      }
      await _analytics.logEvent(
        name: 'entry_created',
        parameters: params,
      );
      developer.log('Analytics: Entry created tracked - type: $entryType');
    } catch (e) {
      developer.log('Analytics Error: Failed to log entry creation - $e');
    }
  }

  /// Track entry deleted
  static Future<void> logEntryDeleted({
    required String entryId,
    required String entryType,
  }) async {
    try {
      await _analytics.logEvent(
        name: 'entry_deleted',
        parameters: {
          'entry_id': entryId,
          'entry_type': entryType,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );
      developer.log('Analytics: Entry deleted tracked - type: $entryType');
    } catch (e) {
      developer.log('Analytics Error: Failed to log entry deletion - $e');
    }
  }

  /// Track language change
  static Future<void> logLanguageChange({required String language}) async {
    try {
      await _analytics.logEvent(
        name: 'language_changed',
        parameters: {
          'language': language,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );
      developer.log('Analytics: Language changed to - $language');
    } catch (e) {
      developer.log('Analytics Error: Failed to log language change - $e');
    }
  }

  /// Track custom event
  static Future<void> logCustomEvent({
    required String eventName,
    Map<String, Object>? parameters,
  }) async {
    try {
      await _analytics.logEvent(
        name: eventName,
        parameters: parameters ?? {},
      );
      developer.log('Analytics: Custom event tracked - $eventName');
    } catch (e) {
      developer.log('Analytics Error: Failed to log custom event - $e');
    }
  }

  /// Set user properties
  static Future<void> setUserProperty({
    required String name,
    required String value,
  }) async {
    try {
      await _analytics.setUserProperty(name: name, value: value);
      developer.log('Analytics: User property set - $name: $value');
    } catch (e) {
      developer.log('Analytics Error: Failed to set user property - $e');
    }
  }

  /// Set user ID for analytics
  static Future<void> setUserId(String userId) async {
    try {
      await _analytics.logEvent(
        name: 'user_identified',
        parameters: {
          'user_id': userId,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );
      developer.log('Analytics: User ID set');
    } catch (e) {
      developer.log('Analytics Error: Failed to set user ID - $e');
    }
  }

  /// Clear user ID (on sign out)
  static Future<void> clearUserId() async {
    try {
      // Firebase Analytics doesn't have a direct clearUserId, so we'll use the log method
      await _analytics.logEvent(
        name: 'user_cleared',
        parameters: {'timestamp': DateTime.now().toIso8601String()},
      );
      developer.log('Analytics: User ID cleared');
    } catch (e) {
      developer.log('Analytics Error: Failed to clear user ID - $e');
    }
  }
}

/// Crashlytics service for error reporting and monitoring
class CrashlyticsService {
  static final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  /// Initialize Crashlytics
  static Future<void> initialize() async {
    try {
      // Disable Crashlytics in debug mode
      if (kDebugMode) {
        await _crashlytics.setCrashlyticsCollectionEnabled(false);
      } else {
        await _crashlytics.setCrashlyticsCollectionEnabled(true);
      }
      developer.log('Crashlytics initialized');
    } catch (e) {
      developer.log('Crashlytics Error: Failed to initialize - $e');
    }
  }

  /// Report an error to Crashlytics
  static Future<void> recordError(
    dynamic exception,
    StackTrace? stackTrace, {
    String? reason,
  }) async {
    try {
      await _crashlytics.recordError(
        exception,
        stackTrace,
        reason: reason,
      );
      developer.log('Crashlytics: Error recorded - ${exception.toString()}');
    } catch (e) {
      developer.log('Crashlytics Error: Failed to record error - $e');
    }
  }

  /// Record a fatal error (app-breaking)
  static Future<void> recordFatalError(
    dynamic exception,
    StackTrace stackTrace,
  ) async {
    try {
      await _crashlytics.recordFlutterFatalError(
        FlutterErrorDetails(
          exception: exception,
          stack: stackTrace,
          library: 'javier_website',
        ),
      );
      developer.log('Crashlytics: Fatal error recorded');
    } catch (e) {
      developer.log('Crashlytics Error: Failed to record fatal error - $e');
    }
  }

  /// Log a custom message to Crashlytics
  static void log(String message) {
    try {
      _crashlytics.log(message);
    } catch (e) {
      developer.log('Crashlytics Error: Failed to log message - $e');
    }
  }

  /// Set a custom key-value pair
  static void setCustomKey(String key, Object value) {
    try {
      _crashlytics.setCustomKey(key, value);
      developer.log('Crashlytics: Custom key set - $key: $value');
    } catch (e) {
      developer.log('Crashlytics Error: Failed to set custom key - $e');
    }
  }

  /// Set user ID
  static Future<void> setUserId(String userId) async {
    try {
      _crashlytics.log('User ID set: $userId');
      developer.log('Crashlytics: User ID set');
    } catch (e) {
      developer.log('Crashlytics Error: Failed to set user ID - $e');
    }
  }

  /// Clear user ID
  static Future<void> clearUserId() async {
    try {
      _crashlytics.log('User ID cleared');
      developer.log('Crashlytics: User ID cleared');
    } catch (e) {
      developer.log('Crashlytics Error: Failed to clear user ID - $e');
    }
  }

  /// Check if Crashlytics is collecting errors
  static Future<bool> isCrashlyticsCollectionEnabled() async {
    try {
      return kDebugMode ? false : true;
    } catch (e) {
      return false;
    }
  }
}
