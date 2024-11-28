import 'package:json_annotation/json_annotation.dart';
part 'gift_received_model.g.dart';
@JsonSerializable()
class GiftReceivedModel {
  String? orderName;
  String? gift;
  GiftReceivedModel();
  factory GiftReceivedModel.fromJson(Map<String, dynamic> json) =>
      _$GiftReceivedModelFromJson(json);

  /// Connect the generated [_$GiftReceivedModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GiftReceivedModelToJson(this);
}
