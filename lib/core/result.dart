class Result<T> {
  final T? value;
  final String? error;

  Result._({this.value, this.error});

  factory Result.success(T value) => Result._(value: value);

  factory Result.failure(String error) => Result._(error: error);

  bool get isSuccess => value != null;
  bool get isFailure => error != null;
}
