class BaseResult<T> {
  String? errorMessage;
  T? data;

  BaseResult({
    this.errorMessage,
    this.data,
  });
}
