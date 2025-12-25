/// Global error handling utilities
/// 
/// Provides centralized error handling for the application with:
/// - User-friendly error messages
/// - Specific exception type handling
/// - Firebase exception recognition
/// - Logging support (can be extended with Crashlytics)

import 'package:flutter/material.dart';
import 'package:javier_website/core/l10n/app_locale.dart';

/// Custom exception for application-specific errors
class AppException implements Exception {
  final String message;
  final String? code;
  final Object? originalException;

  AppException(
    this.message, {
    this.code,
    this.originalException,
  });

  @override
  String toString() => message;
}

/// Error handler for the application
class ErrorHandler {
  /// Get user-friendly error message from any exception
  static String getErrorMessage(Object? error) {
    if (error == null) {
      return localizations.unknown_error;
    }

    // Check for Firebase/Firestore exceptions by message content
    final errorString = error.toString().toLowerCase();

    if (errorString.contains('network') || errorString.contains('connection')) {
      return localizations.network_error;
    }

    if (errorString.contains('permission') || errorString.contains('denied')) {
      return localizations.permission_error;
    }

    if (errorString.contains('timeout')) {
      return localizations.timeout_error;
    }

    if (errorString.contains('not found') || errorString.contains('404')) {
      return localizations.not_found_error;
    }

    if (errorString.contains('authentication') || errorString.contains('unauthenticated')) {
      return localizations.authentication_error;
    }

    // Default: try to extract a meaningful message
    if (error is AppException) {
      return error.message;
    }

    // If it's a detailed error message, extract the first line
    final message = error.toString();
    if (message.contains(':')) {
      final parts = message.split(':');
      return parts.last.trim();
    }

    return localizations.something_went_wrong;
  }

  /// Log error (can be extended with Crashlytics or other services)
  static void logError(Object? error, StackTrace? stackTrace) {
    debugPrint('❌ Error: $error');
    if (stackTrace != null) {
      debugPrintStack(stackTrace: stackTrace);
    }
    // TODO: Send to Firebase Crashlytics
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }

  /// Log warning (non-fatal issues)
  static void logWarning(String message) {
    debugPrint('⚠️ Warning: $message');
  }

  /// Create error widget for UI display
  static Widget errorWidget(Object? error, {TextAlign align = TextAlign.center}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              getErrorMessage(error),
              textAlign: align,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  /// Create compact error widget for inline display
  static Widget errorWidgetCompact(Object? error) {
    return Text(
      getErrorMessage(error),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(color: Colors.red),
    );
  }
}
