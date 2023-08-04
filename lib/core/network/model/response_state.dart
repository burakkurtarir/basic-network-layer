import 'package:network_layer_2/core/network/model/network_error.dart';

/// Defines different response states for network operations<br>
/// Enables efficient management of user interface updates based on the current network operation status.
sealed class ResponseState {
  const ResponseState();
}

final class SuccessState extends ResponseState {
  const SuccessState();
}

final class LoadingState extends ResponseState {
  const LoadingState();
}

final class ErrorState extends ResponseState {
  const ErrorState({NetworkError? error}) : _error = error;

  final NetworkError? _error;

  NetworkError get error => _error ?? NetworkError.unknown();

  String get message => error.message;
}

final class InitialState extends ResponseState {
  const InitialState();
}
