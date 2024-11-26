import 'package:freezed_annotation/freezed_annotation.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'voucher_model.g.dart';

@JsonSerializable()
class GiftModel2 {
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
  GiftModel2();
  factory GiftModel2.fromJson(Map<String, dynamic> json) =>
      _$GiftModel2FromJson(json);

  /// Connect the generated [_$GiftModel2ToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GiftModel2ToJson(this);
}
