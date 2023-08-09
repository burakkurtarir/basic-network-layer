/// Describes the error info when a request failed
class NetworkError<T> {
  const NetworkError({required this.message, required this.type, this.data});

  final NetworkErrorType type;
  final String message;

  /// Error response data
  final T? data;

  factory NetworkError.connectionTimeout() {
    return const NetworkError(
      type: NetworkErrorType.connectionTimeout,
      message:
          'The request connection took longer than expected. It was aborted.',
    );
  }

  factory NetworkError.sendTimeout() {
    return const NetworkError(
      type: NetworkErrorType.connectionTimeout,
      message:
          'The request connection took longer than expected. It was aborted.',
    );
  }

  factory NetworkError.receiveTimeout() {
    return const NetworkError(
      type: NetworkErrorType.connectionTimeout,
      message:
          'The request connection took longer than expected. It was aborted.',
    );
  }

  factory NetworkError.badCertificate() {
    return const NetworkError(
      type: NetworkErrorType.connectionTimeout,
      message:
          'The request connection took longer than expected. It was aborted.',
    );
  }

  factory NetworkError.badResponse({T? data}) {
    return NetworkError(
      type: NetworkErrorType.connectionTimeout,
      message: 'The request returned an invalid status code.',
      data: data,
    );
  }

  factory NetworkError.cancel() {
    return const NetworkError(
      type: NetworkErrorType.connectionTimeout,
      message: 'The request was cancelled.',
    );
  }

  factory NetworkError.connectionError() {
    return const NetworkError(
      type: NetworkErrorType.connectionTimeout,
      message: 'The request connection error.',
    );
  }

  factory NetworkError.unknown() {
    return const NetworkError(
      type: NetworkErrorType.connectionTimeout,
      message: 'The request connection error unknown.',
    );
  }

  factory NetworkError.decodingError() {
    return const NetworkError(
      type: NetworkErrorType.decodingError,
      message: 'The request returned an invalid data.',
    );
  }

  factory NetworkError.tokenExpired() {
    return const NetworkError(
      type: NetworkErrorType.tokenExpired,
      message: 'The authentication token has expired.',
    );
  }

  NetworkError<T> copyWith({
    NetworkErrorType? type,
    String? message,
    T? data,
  }) {
    return NetworkError<T>(
      type: type ?? this.type,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

enum NetworkErrorType {
  connectionTimeout,
  sendTimeout,
  receiveTimeout,
  badCertificate,
  badResponse,
  cancel,
  connectionError,
  unknown,
  decodingError,
  tokenExpired,
}
