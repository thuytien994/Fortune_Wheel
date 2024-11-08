import 'package:freezed_annotation/freezed_annotation.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'voucher_model.g.dart';
@JsonSerializable()
class VoucherModel {
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
VoucherModel();
  factory VoucherModel.fromJson(Map<String, dynamic> json) => _$VoucherModelFromJson(json);

  /// Connect the generated [_$VoucherModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$VoucherModelToJson(this);
}
