import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_api_response.g.dart';

@JsonSerializable()
class BaseResponse {
  int? code;
  bool? success;
  String? message;
  dynamic data;

  BaseResponse({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
