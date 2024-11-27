// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftModel2 _$GiftModel2FromJson(Map<String, dynamic> json) => GiftModel2()
  ..id = (json['Id'] as num?)?.toInt()
  ..code = json['Code'] as String?
  ..type = (json['Type'] as num?)?.toInt()
  ..image = json['Image'] as String?
  ..discount = (json['Discount'] as num?)?.toDouble()
  ..giftDescription = json['GiftDescription'] as String?
  ..quantity = (json['Quantity'] as num?)?.toInt()
  ..isActive = json['IsActive'] as bool?
  ..startDate = json['StartDate'] == null
      ? null
      : DateTime.parse(json['StartDate'] as String)
  ..endDate =
      json['EndDate'] == null ? null : DateTime.parse(json['EndDate'] as String)
  ..description = json['Description'] as String?
  ..userName = json['Name'] as String?
  ..giftCode = json['GiftCode'] as String?
  ..voucherCode = json['VoucherCode'] as String?;

Map<String, dynamic> _$GiftModel2ToJson(GiftModel2 instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Code': instance.code,
      'Type': instance.type,
      'Image': instance.image,
      'Discount': instance.discount,
      'GiftDescription': instance.giftDescription,
      'Quantity': instance.quantity,
      'IsActive': instance.isActive,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'Description': instance.description,
      'Name': instance.userName,
      'GiftCode': instance.giftCode,
      'VoucherCode': instance.voucherCode,
    };
