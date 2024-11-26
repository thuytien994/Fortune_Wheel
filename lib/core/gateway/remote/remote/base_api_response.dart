class BaseApiResponse {
  BaseApiResponse({
    required this.code,
    required this.success,
    required this.message,
  });

  int code;
  bool success;
  String message;

  factory BaseApiResponse.fromJson(Map<String, dynamic> json, int code) =>
      BaseApiResponse(
        code: code,
        success: json["success"] ?? true,
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
