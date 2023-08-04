/// Describes the error info when a request failed
class NetworkError {
  const NetworkError({required this.message, required this.type});

  final NetworkErrorType type;
  final String message;

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

  factory NetworkError.badResponse() {
    return const NetworkError(
      type: NetworkErrorType.connectionTimeout,
      message: 'The request returned an invalid status code.',
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
