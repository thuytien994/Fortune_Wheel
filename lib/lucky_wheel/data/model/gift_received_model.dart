import 'package:json_annotation/json_annotation.dart';
part 'gift_received_model.g.dart';

@JsonSerializable()
class GiftReceivedModel {
  String? orderName;
  String? gift;
  String? customerName;
  String? phoneNumber;
  String? image;
  int? giftId;
  int? kenbarVoucherId;
  int? shopId;
  GiftReceivedModel({
    this.orderName,
    this.gift,
    this.customerName,
    this.phoneNumber,
    this.image,
    this.giftId,
    this.kenbarVoucherId,
    this.shopId,
  });
  factory GiftReceivedModel.fromJson(Map<String, dynamic> json) =>
      _$GiftReceivedModelFromJson(json);

  /// Connect the generated [_$GiftReceivedModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GiftReceivedModelToJson(this);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is GiftReceivedModel &&
            runtimeType == other.runtimeType &&
            orderName == other.orderName &&
            gift == other.gift &&
            customerName == other.customerName &&
            phoneNumber == other.phoneNumber &&
            image == other.image &&
            giftId == other.giftId &&
            kenbarVoucherId == other.kenbarVoucherId;
  }
}
