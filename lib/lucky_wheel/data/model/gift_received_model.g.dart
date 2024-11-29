// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_received_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftReceivedModel _$GiftReceivedModelFromJson(Map<String, dynamic> json) =>
    GiftReceivedModel()
      ..orderName = json['orderName'] as String?
      ..gift = json['gift'] as String?
      ..customerName = json['customerName'] as String?
      ..phoneNumber = json['phoneNumber'] as String?
      ..image = json['image'] as String?
      ..giftId = (json['giftId'] as num?)?.toInt()
      ..kenbarVoucherId = (json['kenbarVoucherId'] as num?)?.toInt();

Map<String, dynamic> _$GiftReceivedModelToJson(GiftReceivedModel instance) =>
    <String, dynamic>{
      'orderName': instance.orderName,
      'gift': instance.gift,
      'customerName': instance.customerName,
      'phoneNumber': instance.phoneNumber,
      'image': instance.image,
      'giftId': instance.giftId,
      'kenbarVoucherId': instance.kenbarVoucherId,
    };
