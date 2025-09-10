// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lucky_wheel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LuckyWheelModelImpl _$$LuckyWheelModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LuckyWheelModelImpl(
      id: json['id'] as String,
      spinName: json['spinName'] as String? ?? '',
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      maxParticipants: (json['maxParticipants'] as num?)?.toInt(),
      shopId: (json['shopId'] as num).toInt(),
      backgroundImage: json['backgroundImage'] as String?,
      color1: json['color1'] as String?,
      color2: json['color2'] as String?,
      status: json['status'] as String?,
      spinButtonImage: json['spinButtonImage'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      luckyPrizeModel: (json['luckyPrizeModel'] as List<dynamic>?)
              ?.map((e) =>
                  LuckyWheelPriceModel.fromJson(e as Map<String, dynamic>))
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
      'maxParticipants': instance.maxParticipants,
      'shopId': instance.shopId,
      'backgroundImage': instance.backgroundImage,
      'color1': instance.color1,
      'color2': instance.color2,
      'status': instance.status,
      'spinButtonImage': instance.spinButtonImage,
      'createdDate': instance.createdDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'luckyPrizeModel': instance.luckyPrizeModel,
    };

_$LuckyWheelPriceModelImpl _$$LuckyWheelPriceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LuckyWheelPriceModelImpl(
      id: json['id'] as String,
      spinId: json['spinId'] as String,
      prizeName: json['prizeName'] as String?,
      prizeQuantity: (json['prizeQuantity'] as num?)?.toInt(),
      prizeProbability: (json['prizeProbability'] as num?)?.toDouble(),
      prizeOrder: (json['prizeOrder'] as num?)?.toInt(),
      prizeImage: json['prizeImage'] as String?,
    );

Map<String, dynamic> _$$LuckyWheelPriceModelImplToJson(
        _$LuckyWheelPriceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'spinId': instance.spinId,
      'prizeName': instance.prizeName,
      'prizeQuantity': instance.prizeQuantity,
      'prizeProbability': instance.prizeProbability,
      'prizeOrder': instance.prizeOrder,
      'prizeImage': instance.prizeImage,
    };
