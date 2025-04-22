/// An abstract class representing a custom application exception.
///
/// This class implements the [Exception] interface and provides a
/// mechanism to include a message and an optional stack trace.
///
/// Attributes:
/// - `message`: A description of the exception.
/// - `stackTrace`: An optional stack trace associated with the exception.
///
/// Methods:
/// - `toString()`: Returns a string representation of the exception,
///   including its runtime type and message.
abstract class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  AppException(this.message, [this.stackTrace]);

  @override
  String toString() => '$runtimeType: $message';
}

/// Represents an exception that occurs during network operations.
///
/// This exception is a subclass of [AppException] and is used to handle
/// errors related to network connectivity or requests.
///
/// The [message] parameter provides a description of the error, while
/// the optional [stackTrace] parameter can be used to capture the stack
/// trace at the point where the exception was thrown.
class NetworkException extends AppException {
  NetworkException(super.message, [super.stackTrace]);
}

/// Represents an exception that occurs when a network operation times out.
///
/// This exception is a subclass of [AppException] and is used to handle
/// errors related to network request timeouts.
///
/// The [message] parameter provides a description of the error, while
/// the optional [stackTrace] parameter can be used to capture the stack
/// trace at the point where the exception was thrown.
class TimeoutException extends AppException {
  TimeoutException(super.message, [super.stackTrace]);
}

/// Represents an exception that occurs due to server-related errors.
///
/// This exception is a subclass of [AppException] and is used to handle
/// errors that are associated with server responses, identified by a
/// specific [statusCode].
///
/// The [message] parameter provides a description of the error, while
/// the optional [stackTrace] parameter can be used to capture the stack
/// trace at the point where the exception was thrown.
class ServerException extends AppException {
  final int statusCode;
  ServerException(this.statusCode, String message, [StackTrace? stackTrace])
    : super(message, stackTrace);
}

/// Represents an exception that occurs during parsing operations.
///
/// This exception is a subclass of [AppException] and is used to handle
/// errors related to data parsing failures.
///
/// The [message] parameter provides a description of the error, while
/// the optional [stackTrace] parameter can be used to capture the stack
/// trace at the point where the exception was thrown.
class ParsingException extends AppException {
  ParsingException(super.message, [super.stackTrace]);
}

/// Represents an exception that occurs due to unknown errors.
///
/// This exception is a subclass of [AppException] and is used to handle
/// errors that do not fall into specific categories.
///
/// The [message] parameter provides a description of the error, while
/// the optional [stackTrace] parameter can be used to capture the stack
/// trace at the point where the exception was thrown.
class UnknownException extends AppException {
  UnknownException(super.message, [super.stackTrace]);
}
