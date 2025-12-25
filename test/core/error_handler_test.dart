import 'package:flutter_test/flutter_test.dart';
import 'package:javier_website/core/error_handler.dart';

void main() {
  group('ErrorHandler', () {
    test('handles network errors', () {
      final error = Exception('Network error');
      final message = ErrorHandler.getErrorMessage(error);
      
      expect(message, isNotEmpty);
      expect(message, isA<String>());
    });

    test('handles unknown errors', () {
      final error = Exception('Unknown error');
      final message = ErrorHandler.getErrorMessage(error);
      
      expect(message, isNotEmpty);
      expect(message, isA<String>());
    });

    test('logs errors without crashing', () {
      final error = Exception('Test error');
      final stackTrace = StackTrace.current;
      
      // Should not throw
      expect(
        () => ErrorHandler.logError(error, stackTrace),
        returnsNormally,
      );
    });

    test('creates error widget for errors', () {
      final error = Exception('Test error');
      final widget = ErrorHandler.errorWidget(error);
      
      expect(widget, isNotNull);
    });

    test('creates compact error widget', () {
      final error = Exception('Test error');
      final widget = ErrorHandler.errorWidgetCompact(error);
      
      expect(widget, isNotNull);
    });
  });
}
