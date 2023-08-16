class Result<T> {
  T? data;
  bool? error;
  int? response;
  String? message;
  String? userMessage;
  int? retryCount;
  bool? loading;
  List<dynamic>? validationMessages;
  bool? hasValidationMessages;

  Result({
    this.data,
    this.error,
    this.hasValidationMessages,
    this.message,
    this.userMessage,
    this.response,
    this.retryCount,
    this.loading,
    this.validationMessages,
  });
}
