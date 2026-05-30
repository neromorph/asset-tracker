/// Domain-level exceptions following AGENTS.md section 4.3.
/// All exceptions use sealed classes for exhaustive handling.
sealed class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => message;
}

/// Thrown when network operations fail.
class NetworkException extends AppException {
  const NetworkException([String message = 'Network error occurred']) : super(message);
}

/// Thrown when authentication fails.
class AuthException extends AppException {
  const AuthException([String message = 'Authentication failed']) : super(message);
}

/// Thrown when storage operations fail.
class StorageException extends AppException {
  const StorageException([String message = 'Storage error occurred']) : super(message);
}

/// Thrown when input validation fails.
class ValidationException extends AppException {
  const ValidationException([String message = 'Validation failed']) : super(message);
}

/// Thrown when a resource is not found.
class NotFoundException extends AppException {
  const NotFoundException([String message = 'Resource not found']) : super(message);
}

/// Thrown when sync operations fail.
class SyncException extends AppException {
  const SyncException([String message = 'Sync failed']) : super(message);
}

/// Thrown when biometric authentication fails.
class BiometricException extends AppException {
  const BiometricException([String message = 'Biometric authentication failed']) : super(message);
}
