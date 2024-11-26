class BaseResponse {
  int? code;
  String? message;
  dynamic data;
  BaseResponse({this.code, this.message, this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> map) {
    return BaseResponse(
      code: map['code']?.toInt(),
      message: map['message'],
      data: map['data'],
    );
  }
}
