/// Handles different operation results in a type-safe and structured
/// Provide a clear and concise way to manage success and failure cases
sealed class Result<T, E> {
  const Result();
}

final class Success<T, E> extends Result<T, E> {
  final T data;

  const Success(this.data);
}

final class Failure<T, E> extends Result<T, E> {
  final E error;

  const Failure(this.error);
}
