import 'package:freezed_annotation/freezed_annotation.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'gift_model.g.dart';

@JsonSerializable()
class GiftModel {
  int? id;
  String? code;
  String? type;
  String? image;
  double? discount;
  String? giftDescription;
  int? quantity;
  bool? isActive;
  DateTime? startDate;
  DateTime? endDate;
  String? description;
  String? userName;
  String? giftCode;
  String? voucherCode;
  GiftModel();
  factory GiftModel.fromJson(Map<String, dynamic> json) =>
      _$GiftModelFromJson(json);

  /// Connect the generated [_$GiftModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GiftModelToJson(this);
}
