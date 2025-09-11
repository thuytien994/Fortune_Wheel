// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoCustomer _$InfoCustomerFromJson(Map<String, dynamic> json) => InfoCustomer(
      barcode: json['barcode'] as String?,
      invoiceCode: json['invoiceCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      shopId: (json['shopId'] as num?)?.toInt(),
      spinId: json['spinId'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$InfoCustomerToJson(InfoCustomer instance) =>
    <String, dynamic>{
      'spinId': instance.spinId,
      'shopId': instance.shopId,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'invoiceCode': instance.invoiceCode,
      'barcode': instance.barcode,
    };
