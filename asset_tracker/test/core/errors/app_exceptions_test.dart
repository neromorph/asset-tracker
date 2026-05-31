import 'package:flutter_test/flutter_test.dart';

import 'package:asset_tracker/core/errors/app_exceptions.dart';

void main() {
  group('AppException sealed class', () {
    test('NetworkException has correct default message', () {
      const e = NetworkException();
      expect(e.message, 'Network error occurred');
      expect(e.toString(), 'Network error occurred');
    });

    test('AuthException has correct default message', () {
      const e = AuthException();
      expect(e.message, 'Authentication failed');
    });

    test('StorageException has correct default message', () {
      const e = StorageException();
      expect(e.message, 'Storage error occurred');
    });

    test('ValidationException has correct default message', () {
      const e = ValidationException();
      expect(e.message, 'Validation failed');
    });

    test('NotFoundException has correct default message', () {
      const e = NotFoundException();
      expect(e.message, 'Resource not found');
    });

    test('SyncException has correct default message', () {
      const e = SyncException();
      expect(e.message, 'Sync failed');
    });

    test('BiometricException has correct default message', () {
      const e = BiometricException();
      expect(e.message, 'Biometric authentication failed');
    });

    test('custom messages are preserved', () {
      const e = NetworkException('No internet connection');
      expect(e.message, 'No internet connection');
      expect(e.toString(), 'No internet connection');
    });

    test('all subtypes are AppException', () {
      const List<AppException> exceptions = [
        NetworkException(),
        AuthException(),
        StorageException(),
        ValidationException(),
        NotFoundException(),
        SyncException(),
        BiometricException(),
      ];
      expect(exceptions.length, 7);
      for (final e in exceptions) {
        expect(e, isA<AppException>());
        expect(e, isA<Exception>());
      }
    });

    test('exhaustive pattern matching works', () {
      const AppException exception = NetworkException('test');
      final result = switch (exception) {
        NetworkException() => 'network',
        AuthException() => 'auth',
        StorageException() => 'storage',
        ValidationException() => 'validation',
        NotFoundException() => 'not_found',
        SyncException() => 'sync',
        BiometricException() => 'biometric',
      };
      expect(result, 'network');
    });
  });
}