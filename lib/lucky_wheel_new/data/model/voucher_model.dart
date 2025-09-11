// import 'package:freezed_annotation/freezed_annotation.dart';

// // optional: Since our Person class is serializable, we must add this line.
// // But if Person was not serializable, we could skip it.
// part '../../../fortune_wheel_1/data/model/voucher_model.g.dart';

// @JsonSerializable()
// class GiftReceivedModel {
//   @JsonKey(name: "Id")
//   int? id;

//   @JsonKey(name: "Code")
//   String? code;

//   @JsonKey(name: "Type")
//   int? type;

//   @JsonKey(name: "Image")
//   String? image;

//   @JsonKey(name: "Discount")
//   double? discount;

//   @JsonKey(name: "GiftDescription")
//   String? giftDescription;

//   @JsonKey(name: "Quantity")
//   int? quantity;

//   @JsonKey(name: "IsActive")
//   bool? isActive;

//   @JsonKey(name: "StartDate")
//   DateTime? startDate;

//   @JsonKey(name: "EndDate")
//   DateTime? endDate;

//   @JsonKey(name: "Description")
//   String? description;

//   @JsonKey(name: "Name")
//   String? userName;

//   @JsonKey(name: "GiftCode")
//   String? giftCode;

//   @JsonKey(name: "VoucherCode")
//   String? voucherCode;
//   GiftReceivedModel();
//   factory GiftReceivedModel.fromJson(Map<String, dynamic> json) =>
//       _$GiftReceivedModelFromJson(json);

//   /// Connect the generated [_$GiftReceivedModelToJson] function to the `toJson` method.
//   Map<String, dynamic> toJson() => _$GiftReceivedModelToJson(this);
// }
