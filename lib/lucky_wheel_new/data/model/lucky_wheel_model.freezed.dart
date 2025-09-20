// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lucky_wheel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LuckyWheelModel _$LuckyWheelModelFromJson(Map<String, dynamic> json) {
  return _LuckyWheelModel.fromJson(json);
}

/// @nodoc
mixin _$LuckyWheelModel {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'spinName')
  String get spinName => throw _privateConstructorUsedError;
  @JsonKey(name: 'startDate')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'endDate')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxSpinPerDay')
  int? get maxSpinPerDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'shopId')
  int get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: 'backgroundImage')
  String get backgroundImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'backgroundImageMobile')
  String get backgroundImageMobile => throw _privateConstructorUsedError;
  @JsonKey(name: 'color1')
  String get color1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'color2')
  String get color2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'spinButtonImage')
  String get spinButtonImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'gameType')
  String get gameType => throw _privateConstructorUsedError;
  @JsonKey(name: 'platform')
  String get platform => throw _privateConstructorUsedError;
  @JsonKey(name: 'logoImage')
  String get logoImage => throw _privateConstructorUsedError;
  List<LuckyPrizeDataModel> get luckyPrizeModel =>
      throw _privateConstructorUsedError;

  /// Serializes this LuckyWheelModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LuckyWheelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LuckyWheelModelCopyWith<LuckyWheelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LuckyWheelModelCopyWith<$Res> {
  factory $LuckyWheelModelCopyWith(
          LuckyWheelModel value, $Res Function(LuckyWheelModel) then) =
      _$LuckyWheelModelCopyWithImpl<$Res, LuckyWheelModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'spinName') String spinName,
      @JsonKey(name: 'startDate') DateTime? startDate,
      @JsonKey(name: 'endDate') DateTime? endDate,
      @JsonKey(name: 'maxSpinPerDay') int? maxSpinPerDay,
      @JsonKey(name: 'shopId') int shopId,
      @JsonKey(name: 'backgroundImage') String backgroundImage,
      @JsonKey(name: 'backgroundImageMobile') String backgroundImageMobile,
      @JsonKey(name: 'color1') String color1,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'color2') String color2,
      @JsonKey(name: 'createdDate') DateTime? createdDate,
      @JsonKey(name: 'spinButtonImage') String spinButtonImage,
      @JsonKey(name: 'gameType') String gameType,
      @JsonKey(name: 'platform') String platform,
      @JsonKey(name: 'logoImage') String logoImage,
      List<LuckyPrizeDataModel> luckyPrizeModel});
}

/// @nodoc
class _$LuckyWheelModelCopyWithImpl<$Res, $Val extends LuckyWheelModel>
    implements $LuckyWheelModelCopyWith<$Res> {
  _$LuckyWheelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LuckyWheelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? spinName = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? maxSpinPerDay = freezed,
    Object? shopId = null,
    Object? backgroundImage = null,
    Object? backgroundImageMobile = null,
    Object? color1 = null,
    Object? status = null,
    Object? color2 = null,
    Object? createdDate = freezed,
    Object? spinButtonImage = null,
    Object? gameType = null,
    Object? platform = null,
    Object? logoImage = null,
    Object? luckyPrizeModel = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      spinName: null == spinName
          ? _value.spinName
          : spinName // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maxSpinPerDay: freezed == maxSpinPerDay
          ? _value.maxSpinPerDay
          : maxSpinPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundImage: null == backgroundImage
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundImageMobile: null == backgroundImageMobile
          ? _value.backgroundImageMobile
          : backgroundImageMobile // ignore: cast_nullable_to_non_nullable
              as String,
      color1: null == color1
          ? _value.color1
          : color1 // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      color2: null == color2
          ? _value.color2
          : color2 // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      spinButtonImage: null == spinButtonImage
          ? _value.spinButtonImage
          : spinButtonImage // ignore: cast_nullable_to_non_nullable
              as String,
      gameType: null == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      logoImage: null == logoImage
          ? _value.logoImage
          : logoImage // ignore: cast_nullable_to_non_nullable
              as String,
      luckyPrizeModel: null == luckyPrizeModel
          ? _value.luckyPrizeModel
          : luckyPrizeModel // ignore: cast_nullable_to_non_nullable
              as List<LuckyPrizeDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LuckyWheelModelImplCopyWith<$Res>
    implements $LuckyWheelModelCopyWith<$Res> {
  factory _$$LuckyWheelModelImplCopyWith(_$LuckyWheelModelImpl value,
          $Res Function(_$LuckyWheelModelImpl) then) =
      __$$LuckyWheelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'spinName') String spinName,
      @JsonKey(name: 'startDate') DateTime? startDate,
      @JsonKey(name: 'endDate') DateTime? endDate,
      @JsonKey(name: 'maxSpinPerDay') int? maxSpinPerDay,
      @JsonKey(name: 'shopId') int shopId,
      @JsonKey(name: 'backgroundImage') String backgroundImage,
      @JsonKey(name: 'backgroundImageMobile') String backgroundImageMobile,
      @JsonKey(name: 'color1') String color1,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'color2') String color2,
      @JsonKey(name: 'createdDate') DateTime? createdDate,
      @JsonKey(name: 'spinButtonImage') String spinButtonImage,
      @JsonKey(name: 'gameType') String gameType,
      @JsonKey(name: 'platform') String platform,
      @JsonKey(name: 'logoImage') String logoImage,
      List<LuckyPrizeDataModel> luckyPrizeModel});
}

/// @nodoc
class __$$LuckyWheelModelImplCopyWithImpl<$Res>
    extends _$LuckyWheelModelCopyWithImpl<$Res, _$LuckyWheelModelImpl>
    implements _$$LuckyWheelModelImplCopyWith<$Res> {
  __$$LuckyWheelModelImplCopyWithImpl(
      _$LuckyWheelModelImpl _value, $Res Function(_$LuckyWheelModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LuckyWheelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? spinName = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? maxSpinPerDay = freezed,
    Object? shopId = null,
    Object? backgroundImage = null,
    Object? backgroundImageMobile = null,
    Object? color1 = null,
    Object? status = null,
    Object? color2 = null,
    Object? createdDate = freezed,
    Object? spinButtonImage = null,
    Object? gameType = null,
    Object? platform = null,
    Object? logoImage = null,
    Object? luckyPrizeModel = null,
  }) {
    return _then(_$LuckyWheelModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      spinName: null == spinName
          ? _value.spinName
          : spinName // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maxSpinPerDay: freezed == maxSpinPerDay
          ? _value.maxSpinPerDay
          : maxSpinPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundImage: null == backgroundImage
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundImageMobile: null == backgroundImageMobile
          ? _value.backgroundImageMobile
          : backgroundImageMobile // ignore: cast_nullable_to_non_nullable
              as String,
      color1: null == color1
          ? _value.color1
          : color1 // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      color2: null == color2
          ? _value.color2
          : color2 // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      spinButtonImage: null == spinButtonImage
          ? _value.spinButtonImage
          : spinButtonImage // ignore: cast_nullable_to_non_nullable
              as String,
      gameType: null == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      logoImage: null == logoImage
          ? _value.logoImage
          : logoImage // ignore: cast_nullable_to_non_nullable
              as String,
      luckyPrizeModel: null == luckyPrizeModel
          ? _value._luckyPrizeModel
          : luckyPrizeModel // ignore: cast_nullable_to_non_nullable
              as List<LuckyPrizeDataModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LuckyWheelModelImpl extends _LuckyWheelModel {
  const _$LuckyWheelModelImpl(
      {@JsonKey(name: 'id') this.id = "",
      @JsonKey(name: 'spinName') this.spinName = "",
      @JsonKey(name: 'startDate') this.startDate = null,
      @JsonKey(name: 'endDate') this.endDate = null,
      @JsonKey(name: 'maxSpinPerDay') this.maxSpinPerDay = null,
      @JsonKey(name: 'shopId') this.shopId = 0,
      @JsonKey(name: 'backgroundImage') this.backgroundImage = "",
      @JsonKey(name: 'backgroundImageMobile') this.backgroundImageMobile = "",
      @JsonKey(name: 'color1') this.color1 = "",
      @JsonKey(name: 'status') this.status = "",
      @JsonKey(name: 'color2') this.color2 = "",
      @JsonKey(name: 'createdDate') this.createdDate,
      @JsonKey(name: 'spinButtonImage') this.spinButtonImage = "",
      @JsonKey(name: 'gameType') this.gameType = "ByInputInvoide",
      @JsonKey(name: 'platform') this.platform = "",
      @JsonKey(name: 'logoImage') this.logoImage = "",
      final List<LuckyPrizeDataModel> luckyPrizeModel = const []})
      : _luckyPrizeModel = luckyPrizeModel,
        super._();

  factory _$LuckyWheelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LuckyWheelModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'spinName')
  final String spinName;
  @override
  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'maxSpinPerDay')
  final int? maxSpinPerDay;
  @override
  @JsonKey(name: 'shopId')
  final int shopId;
  @override
  @JsonKey(name: 'backgroundImage')
  final String backgroundImage;
  @override
  @JsonKey(name: 'backgroundImageMobile')
  final String backgroundImageMobile;
  @override
  @JsonKey(name: 'color1')
  final String color1;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'color2')
  final String color2;
  @override
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'spinButtonImage')
  final String spinButtonImage;
  @override
  @JsonKey(name: 'gameType')
  final String gameType;
  @override
  @JsonKey(name: 'platform')
  final String platform;
  @override
  @JsonKey(name: 'logoImage')
  final String logoImage;
  final List<LuckyPrizeDataModel> _luckyPrizeModel;
  @override
  @JsonKey()
  List<LuckyPrizeDataModel> get luckyPrizeModel {
    if (_luckyPrizeModel is EqualUnmodifiableListView) return _luckyPrizeModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_luckyPrizeModel);
  }

  @override
  String toString() {
    return 'LuckyWheelModel(id: $id, spinName: $spinName, startDate: $startDate, endDate: $endDate, maxSpinPerDay: $maxSpinPerDay, shopId: $shopId, backgroundImage: $backgroundImage, backgroundImageMobile: $backgroundImageMobile, color1: $color1, status: $status, color2: $color2, createdDate: $createdDate, spinButtonImage: $spinButtonImage, gameType: $gameType, platform: $platform, logoImage: $logoImage, luckyPrizeModel: $luckyPrizeModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LuckyWheelModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.spinName, spinName) ||
                other.spinName == spinName) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.maxSpinPerDay, maxSpinPerDay) ||
                other.maxSpinPerDay == maxSpinPerDay) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage) &&
            (identical(other.backgroundImageMobile, backgroundImageMobile) ||
                other.backgroundImageMobile == backgroundImageMobile) &&
            (identical(other.color1, color1) || other.color1 == color1) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.color2, color2) || other.color2 == color2) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.spinButtonImage, spinButtonImage) ||
                other.spinButtonImage == spinButtonImage) &&
            (identical(other.gameType, gameType) ||
                other.gameType == gameType) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.logoImage, logoImage) ||
                other.logoImage == logoImage) &&
            const DeepCollectionEquality()
                .equals(other._luckyPrizeModel, _luckyPrizeModel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      spinName,
      startDate,
      endDate,
      maxSpinPerDay,
      shopId,
      backgroundImage,
      backgroundImageMobile,
      color1,
      status,
      color2,
      createdDate,
      spinButtonImage,
      gameType,
      platform,
      logoImage,
      const DeepCollectionEquality().hash(_luckyPrizeModel));

  /// Create a copy of LuckyWheelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LuckyWheelModelImplCopyWith<_$LuckyWheelModelImpl> get copyWith =>
      __$$LuckyWheelModelImplCopyWithImpl<_$LuckyWheelModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LuckyWheelModelImplToJson(
      this,
    );
  }
}

abstract class _LuckyWheelModel extends LuckyWheelModel {
  const factory _LuckyWheelModel(
      {@JsonKey(name: 'id') final String id,
      @JsonKey(name: 'spinName') final String spinName,
      @JsonKey(name: 'startDate') final DateTime? startDate,
      @JsonKey(name: 'endDate') final DateTime? endDate,
      @JsonKey(name: 'maxSpinPerDay') final int? maxSpinPerDay,
      @JsonKey(name: 'shopId') final int shopId,
      @JsonKey(name: 'backgroundImage') final String backgroundImage,
      @JsonKey(name: 'backgroundImageMobile')
      final String backgroundImageMobile,
      @JsonKey(name: 'color1') final String color1,
      @JsonKey(name: 'status') final String status,
      @JsonKey(name: 'color2') final String color2,
      @JsonKey(name: 'createdDate') final DateTime? createdDate,
      @JsonKey(name: 'spinButtonImage') final String spinButtonImage,
      @JsonKey(name: 'gameType') final String gameType,
      @JsonKey(name: 'platform') final String platform,
      @JsonKey(name: 'logoImage') final String logoImage,
      final List<LuckyPrizeDataModel> luckyPrizeModel}) = _$LuckyWheelModelImpl;
  const _LuckyWheelModel._() : super._();

  factory _LuckyWheelModel.fromJson(Map<String, dynamic> json) =
      _$LuckyWheelModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'spinName')
  String get spinName;
  @override
  @JsonKey(name: 'startDate')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'endDate')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'maxSpinPerDay')
  int? get maxSpinPerDay;
  @override
  @JsonKey(name: 'shopId')
  int get shopId;
  @override
  @JsonKey(name: 'backgroundImage')
  String get backgroundImage;
  @override
  @JsonKey(name: 'backgroundImageMobile')
  String get backgroundImageMobile;
  @override
  @JsonKey(name: 'color1')
  String get color1;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'color2')
  String get color2;
  @override
  @JsonKey(name: 'createdDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'spinButtonImage')
  String get spinButtonImage;
  @override
  @JsonKey(name: 'gameType')
  String get gameType;
  @override
  @JsonKey(name: 'platform')
  String get platform;
  @override
  @JsonKey(name: 'logoImage')
  String get logoImage;
  @override
  List<LuckyPrizeDataModel> get luckyPrizeModel;

  /// Create a copy of LuckyWheelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LuckyWheelModelImplCopyWith<_$LuckyWheelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LuckyPrizeDataModel _$LuckyPrizeDataModelFromJson(Map<String, dynamic> json) {
  return _LuckyPrizeDataModel.fromJson(json);
}

/// @nodoc
mixin _$LuckyPrizeDataModel {
//  @JsonKey(name: 'spinId') String? spinId,
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'prizeName')
  String get prizeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'prizeQuantity')
  int get prizeQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'prizeProbability')
  double get prizeProbability => throw _privateConstructorUsedError;
  @JsonKey(name: 'prizeColor')
  String get prizeColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'prizeImage')
  String get prizeImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'prizeOrder')
  int get prizeOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalAmount')
  double get totalAmount => throw _privateConstructorUsedError;

  /// Serializes this LuckyPrizeDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LuckyPrizeDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LuckyPrizeDataModelCopyWith<LuckyPrizeDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LuckyPrizeDataModelCopyWith<$Res> {
  factory $LuckyPrizeDataModelCopyWith(
          LuckyPrizeDataModel value, $Res Function(LuckyPrizeDataModel) then) =
      _$LuckyPrizeDataModelCopyWithImpl<$Res, LuckyPrizeDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'prizeName') String prizeName,
      @JsonKey(name: 'prizeQuantity') int prizeQuantity,
      @JsonKey(name: 'prizeProbability') double prizeProbability,
      @JsonKey(name: 'prizeColor') String prizeColor,
      @JsonKey(name: 'prizeImage') String prizeImage,
      @JsonKey(name: 'prizeOrder') int prizeOrder,
      @JsonKey(name: 'totalAmount') double totalAmount});
}

/// @nodoc
class _$LuckyPrizeDataModelCopyWithImpl<$Res, $Val extends LuckyPrizeDataModel>
    implements $LuckyPrizeDataModelCopyWith<$Res> {
  _$LuckyPrizeDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LuckyPrizeDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prizeName = null,
    Object? prizeQuantity = null,
    Object? prizeProbability = null,
    Object? prizeColor = null,
    Object? prizeImage = null,
    Object? prizeOrder = null,
    Object? totalAmount = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      prizeName: null == prizeName
          ? _value.prizeName
          : prizeName // ignore: cast_nullable_to_non_nullable
              as String,
      prizeQuantity: null == prizeQuantity
          ? _value.prizeQuantity
          : prizeQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      prizeProbability: null == prizeProbability
          ? _value.prizeProbability
          : prizeProbability // ignore: cast_nullable_to_non_nullable
              as double,
      prizeColor: null == prizeColor
          ? _value.prizeColor
          : prizeColor // ignore: cast_nullable_to_non_nullable
              as String,
      prizeImage: null == prizeImage
          ? _value.prizeImage
          : prizeImage // ignore: cast_nullable_to_non_nullable
              as String,
      prizeOrder: null == prizeOrder
          ? _value.prizeOrder
          : prizeOrder // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LuckyPrizeDataModelImplCopyWith<$Res>
    implements $LuckyPrizeDataModelCopyWith<$Res> {
  factory _$$LuckyPrizeDataModelImplCopyWith(_$LuckyPrizeDataModelImpl value,
          $Res Function(_$LuckyPrizeDataModelImpl) then) =
      __$$LuckyPrizeDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'prizeName') String prizeName,
      @JsonKey(name: 'prizeQuantity') int prizeQuantity,
      @JsonKey(name: 'prizeProbability') double prizeProbability,
      @JsonKey(name: 'prizeColor') String prizeColor,
      @JsonKey(name: 'prizeImage') String prizeImage,
      @JsonKey(name: 'prizeOrder') int prizeOrder,
      @JsonKey(name: 'totalAmount') double totalAmount});
}

/// @nodoc
class __$$LuckyPrizeDataModelImplCopyWithImpl<$Res>
    extends _$LuckyPrizeDataModelCopyWithImpl<$Res, _$LuckyPrizeDataModelImpl>
    implements _$$LuckyPrizeDataModelImplCopyWith<$Res> {
  __$$LuckyPrizeDataModelImplCopyWithImpl(_$LuckyPrizeDataModelImpl _value,
      $Res Function(_$LuckyPrizeDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LuckyPrizeDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prizeName = null,
    Object? prizeQuantity = null,
    Object? prizeProbability = null,
    Object? prizeColor = null,
    Object? prizeImage = null,
    Object? prizeOrder = null,
    Object? totalAmount = null,
  }) {
    return _then(_$LuckyPrizeDataModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      prizeName: null == prizeName
          ? _value.prizeName
          : prizeName // ignore: cast_nullable_to_non_nullable
              as String,
      prizeQuantity: null == prizeQuantity
          ? _value.prizeQuantity
          : prizeQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      prizeProbability: null == prizeProbability
          ? _value.prizeProbability
          : prizeProbability // ignore: cast_nullable_to_non_nullable
              as double,
      prizeColor: null == prizeColor
          ? _value.prizeColor
          : prizeColor // ignore: cast_nullable_to_non_nullable
              as String,
      prizeImage: null == prizeImage
          ? _value.prizeImage
          : prizeImage // ignore: cast_nullable_to_non_nullable
              as String,
      prizeOrder: null == prizeOrder
          ? _value.prizeOrder
          : prizeOrder // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LuckyPrizeDataModelImpl extends _LuckyPrizeDataModel {
  const _$LuckyPrizeDataModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'prizeName') this.prizeName = "",
      @JsonKey(name: 'prizeQuantity') this.prizeQuantity = 0,
      @JsonKey(name: 'prizeProbability') this.prizeProbability = 0,
      @JsonKey(name: 'prizeColor') this.prizeColor = "",
      @JsonKey(name: 'prizeImage') this.prizeImage = "",
      @JsonKey(name: 'prizeOrder') this.prizeOrder = 0,
      @JsonKey(name: 'totalAmount') this.totalAmount = 0})
      : super._();

  factory _$LuckyPrizeDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LuckyPrizeDataModelImplFromJson(json);

//  @JsonKey(name: 'spinId') String? spinId,
  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'prizeName')
  final String prizeName;
  @override
  @JsonKey(name: 'prizeQuantity')
  final int prizeQuantity;
  @override
  @JsonKey(name: 'prizeProbability')
  final double prizeProbability;
  @override
  @JsonKey(name: 'prizeColor')
  final String prizeColor;
  @override
  @JsonKey(name: 'prizeImage')
  final String prizeImage;
  @override
  @JsonKey(name: 'prizeOrder')
  final int prizeOrder;
  @override
  @JsonKey(name: 'totalAmount')
  final double totalAmount;

  @override
  String toString() {
    return 'LuckyPrizeDataModel(id: $id, prizeName: $prizeName, prizeQuantity: $prizeQuantity, prizeProbability: $prizeProbability, prizeColor: $prizeColor, prizeImage: $prizeImage, prizeOrder: $prizeOrder, totalAmount: $totalAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LuckyPrizeDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prizeName, prizeName) ||
                other.prizeName == prizeName) &&
            (identical(other.prizeQuantity, prizeQuantity) ||
                other.prizeQuantity == prizeQuantity) &&
            (identical(other.prizeProbability, prizeProbability) ||
                other.prizeProbability == prizeProbability) &&
            (identical(other.prizeColor, prizeColor) ||
                other.prizeColor == prizeColor) &&
            (identical(other.prizeImage, prizeImage) ||
                other.prizeImage == prizeImage) &&
            (identical(other.prizeOrder, prizeOrder) ||
                other.prizeOrder == prizeOrder) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, prizeName, prizeQuantity,
      prizeProbability, prizeColor, prizeImage, prizeOrder, totalAmount);

  /// Create a copy of LuckyPrizeDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LuckyPrizeDataModelImplCopyWith<_$LuckyPrizeDataModelImpl> get copyWith =>
      __$$LuckyPrizeDataModelImplCopyWithImpl<_$LuckyPrizeDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LuckyPrizeDataModelImplToJson(
      this,
    );
  }
}

abstract class _LuckyPrizeDataModel extends LuckyPrizeDataModel {
  const factory _LuckyPrizeDataModel(
          {@JsonKey(name: 'id') final String? id,
          @JsonKey(name: 'prizeName') final String prizeName,
          @JsonKey(name: 'prizeQuantity') final int prizeQuantity,
          @JsonKey(name: 'prizeProbability') final double prizeProbability,
          @JsonKey(name: 'prizeColor') final String prizeColor,
          @JsonKey(name: 'prizeImage') final String prizeImage,
          @JsonKey(name: 'prizeOrder') final int prizeOrder,
          @JsonKey(name: 'totalAmount') final double totalAmount}) =
      _$LuckyPrizeDataModelImpl;
  const _LuckyPrizeDataModel._() : super._();

  factory _LuckyPrizeDataModel.fromJson(Map<String, dynamic> json) =
      _$LuckyPrizeDataModelImpl.fromJson;

//  @JsonKey(name: 'spinId') String? spinId,
  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'prizeName')
  String get prizeName;
  @override
  @JsonKey(name: 'prizeQuantity')
  int get prizeQuantity;
  @override
  @JsonKey(name: 'prizeProbability')
  double get prizeProbability;
  @override
  @JsonKey(name: 'prizeColor')
  String get prizeColor;
  @override
  @JsonKey(name: 'prizeImage')
  String get prizeImage;
  @override
  @JsonKey(name: 'prizeOrder')
  int get prizeOrder;
  @override
  @JsonKey(name: 'totalAmount')
  double get totalAmount;

  /// Create a copy of LuckyPrizeDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LuckyPrizeDataModelImplCopyWith<_$LuckyPrizeDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
