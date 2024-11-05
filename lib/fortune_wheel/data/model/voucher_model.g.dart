// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherModel _$VoucherModelFromJson(Map<String, dynamic> json) => VoucherModel()
  ..id = (json['id'] as num?)?.toInt()
  ..code = json['code'] as String?
  ..type = json['type'] as String?
  ..image = json['image'] as String?
  ..discount = (json['discount'] as num?)?.toDouble()
  ..giftDescription = json['giftDescription'] as String?
  ..quantity = (json['quantity'] as num?)?.toInt()
  ..isActive = json['isActive'] as bool?
  ..startDate = json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String)
  ..endDate =
      json['endDate'] == null ? null : DateTime.parse(json['endDate'] as String)
  ..description = json['description'] as String?;

Map<String, dynamic> _$VoucherModelToJson(VoucherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'type': instance.type,
      'image': instance.image,
      'discount': instance.discount,
      'giftDescription': instance.giftDescription,
      'quantity': instance.quantity,
      'isActive': instance.isActive,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'description': instance.description,
    };
