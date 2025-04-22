import 'package:dio/dio.dart';
import 'package:flutter_cinema/core/errors/errors_list.dart';

/// Handles exceptions by mapping various error types to specific application
/// exceptions. This includes handling network-related errors from Dio, such as
/// timeouts and server errors, as well as format and unknown errors. Returns
/// an appropriate `AppException` based on the error type and includes an
/// optional stack trace for debugging purposes.
class ExceptionHandler {
  static AppException handle(dynamic error, [StackTrace? stackTrace]) {
    if (error is DioException || error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return TimeoutException(
            "The request has taken too long. Please try again.",
            stackTrace,
          );
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode ?? 0;
          return ServerException(
            statusCode,
            "Server error ($statusCode)",
            stackTrace,
          );
        case DioExceptionType.cancel:
        case DioExceptionType.unknown:
        default:
          return NetworkException("Unknown network error.", stackTrace);
      }
    }

    if (error is FormatException) {
      return ParsingException("Error interpreting data.", stackTrace);
    }

    return UnknownException(error.toString(), stackTrace);
  }
}
