
class BaseApiReponse{
   int code;
  bool success;
  String message;
  BaseApiReponse ({
      required this.code,
    required this.success,
    required this.message,
  });
    // factory BaseApiResponse.fromJson(Map<String, dynamic> json, int code) =>
    //   BaseApiResponse(
    //     code: code,
    //     success: json["success"] ?? true,
    //     message: json["message"] ?? "",
    //   );

  // Map<String, dynamic> toJson() => {
  //       "code": code,
  //       "message": message,
  //     };
}