sealed class Result<T, E extends Object> {
  const Result();
}

class Success<T, E extends Object> extends Result<T, E> {
  final T data;

  const Success(this.data);
}

class Failure<T, E extends Object> extends Result<T, E> {
  final E error;

  const Failure(this.error);
}
