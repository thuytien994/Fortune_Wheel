class BaseApiException implements Exception {
  final int code;
  final String message;
  BaseApiException({
    required this.code,
    required this.message,
  });

  factory BaseApiException.fromMap(Map<String, dynamic> map, int code) {
    return BaseApiException(
      code: code,
      message: map['message'] ?? '',
    );
  }
}
