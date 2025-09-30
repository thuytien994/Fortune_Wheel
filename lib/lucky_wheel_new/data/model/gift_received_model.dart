import 'package:json_annotation/json_annotation.dart';
part 'gift_received_model.g.dart';

@JsonSerializable()
class GiftReceivedModel {
  String? prizeName;
  String prizeImage;
  String? prizeID;
  String? spinId;
  String? userName;
  String? phoneNumber;
  String? invoiceCode;
  String? barCode;
  int? shopId;
  bool isReceivedGift;
  GiftReceivedModel({
    this.prizeName,
    this.prizeImage = "",
    this.spinId,
    this.prizeID,
    this.barCode,
    this.invoiceCode,
    this.phoneNumber,
    this.userName,
    this.shopId,
    this.isReceivedGift = false,
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
            prizeName == other.prizeName &&
            prizeImage == other.prizeImage &&
            prizeID == other.prizeID &&
            spinId == other.spinId &&
            userName == other.userName &&
            phoneNumber == other.phoneNumber &&
            barCode == other.barCode &&
            invoiceCode == other.invoiceCode &&
            isReceivedGift == other.isReceivedGift;
  }
}
