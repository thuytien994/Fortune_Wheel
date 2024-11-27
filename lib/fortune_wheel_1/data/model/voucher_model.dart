import 'package:freezed_annotation/freezed_annotation.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'voucher_model.g.dart';

@JsonSerializable()
class GiftModel2 {
  @JsonKey(name: "Id")
  int? id;

  @JsonKey(name: "Code")
  String? code;

  @JsonKey(name: "Type")
  int? type;

  @JsonKey(name: "Image")
  String? image;

  @JsonKey(name: "Discount")
  double? discount;

  @JsonKey(name: "GiftDescription")
  String? giftDescription;

  @JsonKey(name: "Quantity")
  int? quantity;

  @JsonKey(name: "IsActive")
  bool? isActive;

  @JsonKey(name: "StartDate")
  DateTime? startDate;

  @JsonKey(name: "EndDate")
  DateTime? endDate;

  @JsonKey(name: "Description")
  String? description;

  @JsonKey(name: "Name")
  String? userName;

  @JsonKey(name: "GiftCode")
  String? giftCode;

  @JsonKey(name: "VoucherCode")
  String? voucherCode;
  GiftModel2();
  factory GiftModel2.fromJson(Map<String, dynamic> json) =>
      _$GiftModel2FromJson(json);

  /// Connect the generated [_$GiftModel2ToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GiftModel2ToJson(this);
}
