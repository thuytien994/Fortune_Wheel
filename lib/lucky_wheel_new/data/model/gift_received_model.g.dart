// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_received_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftReceivedModel _$GiftReceivedModelFromJson(Map<String, dynamic> json) =>
    GiftReceivedModel(
      prizeName: json['prizeName'] as String?,
      prizeImage: json['prizeImage'] as String? ?? "",
      spinId: json['spinId'] as String?,
      prizeID: json['prizeID'] as String?,
      barCode: json['barCode'] as String?,
      invoiceCode: json['invoiceCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      userName: json['userName'] as String?,
      shopId: (json['shopId'] as num?)?.toInt(),
      isReceivedGift: json['isReceivedGift'] as bool? ?? false,
    );

Map<String, dynamic> _$GiftReceivedModelToJson(GiftReceivedModel instance) =>
    <String, dynamic>{
      'prizeName': instance.prizeName,
      'prizeImage': instance.prizeImage,
      'prizeID': instance.prizeID,
      'spinId': instance.spinId,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'invoiceCode': instance.invoiceCode,
      'barCode': instance.barCode,
      'shopId': instance.shopId,
      'isReceivedGift': instance.isReceivedGift,
    };
