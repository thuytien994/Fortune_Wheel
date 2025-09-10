// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_received_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftReceivedModel _$GiftReceivedModelFromJson(Map<String, dynamic> json) =>
    GiftReceivedModel(
      orderName: json['orderName'] as String?,
      gift: json['gift'] as String?,
      customerName: json['customerName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      image: json['image'] as String?,
      giftId: (json['giftId'] as num?)?.toInt(),
      kenbarVoucherId: (json['kenbarVoucherId'] as num?)?.toInt(),
      shopId: (json['shopId'] as num?)?.toInt(),
      isUsed: json['isUsed'] as bool?,
      giftDescription: json['giftDescription'] as String?,
      code: json['code'] as String?,
      id: (json['id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$GiftReceivedModelToJson(GiftReceivedModel instance) =>
    <String, dynamic>{
      'orderName': instance.orderName,
      'gift': instance.gift,
      'customerName': instance.customerName,
      'phoneNumber': instance.phoneNumber,
      'image': instance.image,
      'giftId': instance.giftId,
      'kenbarVoucherId': instance.kenbarVoucherId,
      'shopId': instance.shopId,
      'isUsed': instance.isUsed,
      'giftDescription': instance.giftDescription,
      'code': instance.code,
      'id': instance.id,
    };
