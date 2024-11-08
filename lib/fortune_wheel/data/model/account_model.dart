import 'package:freezed_annotation/freezed_annotation.dart';

class AccountModel {
  int? id;
  String? code;
  String? type;
  String? image;
  double? discount;
  String? giftDescription;
  int? quantity;
  bool? isActive;
  String? startDate;
  String? endDate;
  String? description;
  String? createdAt;
  String? common;
  String? message;
  String? userName;
  String? giftCode;
  String? voucherCode;

  AccountModel(
      {this.id,
      this.code,
      this.type,
      this.image,
      this.discount,
      this.giftDescription,
      this.quantity,
      this.isActive,
      this.startDate,
      this.endDate,
      this.description,
      this.createdAt,
      this.common,
      this.message,
      this.userName,
      this.voucherCode});

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    code = json['code'] as String?;
    type = json['type'] as String?;
    image = json['image'] as String?;
    discount = json['discount'] as double?;
    giftDescription = json['giftDescription'] as String?;
    quantity = json['quantity'] as int?;
    isActive = json['isActive'] as bool?;
    startDate = json['startDate'] as String?;
    endDate = json['endDate'] as String?;
    description = json['description'] as String?;
    createdAt = json['createdAt'] as String?;
    common = json['common'] as String?;
    message = json['message'] as String?;
    giftCode = json['giftCode'] as String?;

    voucherCode = json['voucherCode'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['code'] = code;
    data['type'] = type;
    data['image'] = image;
    data['discount'] = discount;
    data['giftDescription'] = giftDescription;
    data['quantity'] = quantity;
    data['isActive'] = isActive;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['common'] = common;
    data['message'] = message;
    data['giftCode'] = giftCode;
    data['voucherCode'] = voucherCode;
    return data;
  }
}
