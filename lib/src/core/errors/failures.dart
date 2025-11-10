import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base class for all failures in the application using Freezed
@freezed
class Failure with _$Failure {
  /// Server-related failure
  const factory Failure.server({
    required String message,
    int? statusCode,
  }) = ServerFailure;

  /// Network connectivity failure
  const factory Failure.network({
    required String message,
  }) = NetworkFailure;

  /// Data validation failure
  const factory Failure.validation({
    required String message,
  }) = ValidationFailure;

  /// Cache-related failure
  const factory Failure.cache({
    required String message,
  }) = CacheFailure;

  /// Data not found failure
  const factory Failure.notFound({
    required String message,
  }) = NotFoundFailure;

  /// Unknown/unexpected failure
  const factory Failure.unknown({
    required String message,
  }) = UnknownFailure;
}
