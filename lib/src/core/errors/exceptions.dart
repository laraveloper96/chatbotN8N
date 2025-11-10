/// Base class for all application exceptions
abstract class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => message;
}

/// Exception thrown when server returns an error
class ServerException extends AppException {
  const ServerException(super.message);
}

/// Exception thrown when there's a network connectivity issue
class NetworkException extends AppException {
  const NetworkException(super.message);
}

/// Exception thrown when there's a cache-related error
class CacheException extends AppException {
  const CacheException(super.message);
}

/// Exception thrown when input validation fails
class ValidationException extends AppException {
  const ValidationException(super.message);
}

/// Exception thrown when a requested resource is not found
class NotFoundException extends AppException {
  const NotFoundException(super.message);
}

/// Exception thrown for unexpected errors
class UnexpectedException extends AppException {
  const UnexpectedException(super.message);
}

/// Server-related exceptions with specific error codes
class ServerExceptionWithCode extends ServerException {
  const ServerExceptionWithCode(
    super.message, {
    required this.statusCode,
  });

  final int statusCode;
}

/// Network timeout exception
class NetworkTimeoutException extends NetworkException {
  const NetworkTimeoutException(
    super.message, {
    this.timeoutDuration,
  });

  final Duration? timeoutDuration;
}

/// Cache miss exception - when requested data is not in cache
class CacheMissException extends CacheException {
  const CacheMissException(
    super.message, {
    this.key,
  });

  final String? key;
}

/// Validation exception with field-specific errors
class ValidationExceptionWithFields extends ValidationException {
  const ValidationExceptionWithFields(
    super.message, {
    this.fieldErrors = const {},
  });

  final Map<String, String> fieldErrors;
}

/// Not found exception with resource type information
class NotFoundExceptionWithType extends NotFoundException {
  const NotFoundExceptionWithType(
    super.message, {
    this.resourceType,
    this.resourceId,
  });

  final String? resourceType;
  final String? resourceId;
}
