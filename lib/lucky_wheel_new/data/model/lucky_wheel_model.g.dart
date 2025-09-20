// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lucky_wheel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LuckyWheelModelImpl _$$LuckyWheelModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LuckyWheelModelImpl(
      id: json['id'] as String? ?? "",
      spinName: json['spinName'] as String? ?? "",
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      maxSpinPerDay: (json['maxSpinPerDay'] as num?)?.toInt() ?? null,
      shopId: (json['shopId'] as num?)?.toInt() ?? 0,
      backgroundImage: json['backgroundImage'] as String? ?? "",
      backgroundImageMobile: json['backgroundImageMobile'] as String? ?? "",
      color1: json['color1'] as String? ?? "",
      status: json['status'] as String? ?? "",
      color2: json['color2'] as String? ?? "",
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      spinButtonImage: json['spinButtonImage'] as String? ?? "",
      gameType: json['gameType'] as String? ?? "ByInputInvoide",
      platform: json['platform'] as String? ?? "",
      logoImage: json['logoImage'] as String? ?? "",
      luckyPrizeModel: (json['luckyPrizeModel'] as List<dynamic>?)
              ?.map((e) =>
                  LuckyPrizeDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LuckyWheelModelImplToJson(
        _$LuckyWheelModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'spinName': instance.spinName,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'maxSpinPerDay': instance.maxSpinPerDay,
      'shopId': instance.shopId,
      'backgroundImage': instance.backgroundImage,
      'backgroundImageMobile': instance.backgroundImageMobile,
      'color1': instance.color1,
      'status': instance.status,
      'color2': instance.color2,
      'createdDate': instance.createdDate?.toIso8601String(),
      'spinButtonImage': instance.spinButtonImage,
      'gameType': instance.gameType,
      'platform': instance.platform,
      'logoImage': instance.logoImage,
      'luckyPrizeModel': instance.luckyPrizeModel,
    };

_$LuckyPrizeDataModelImpl _$$LuckyPrizeDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LuckyPrizeDataModelImpl(
      id: json['id'] as String?,
      prizeName: json['prizeName'] as String? ?? "",
      prizeQuantity: (json['prizeQuantity'] as num?)?.toInt() ?? 0,
      prizeProbability: (json['prizeProbability'] as num?)?.toDouble() ?? 0,
      prizeColor: json['prizeColor'] as String? ?? "",
      prizeImage: json['prizeImage'] as String? ?? "",
      prizeOrder: (json['prizeOrder'] as num?)?.toInt() ?? 0,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$LuckyPrizeDataModelImplToJson(
        _$LuckyPrizeDataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prizeName': instance.prizeName,
      'prizeQuantity': instance.prizeQuantity,
      'prizeProbability': instance.prizeProbability,
      'prizeColor': instance.prizeColor,
      'prizeImage': instance.prizeImage,
      'prizeOrder': instance.prizeOrder,
      'totalAmount': instance.totalAmount,
    };
