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
  String get id => throw _privateConstructorUsedError;
  String get spinName => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  int? get maxParticipants => throw _privateConstructorUsedError;
  int get shopId => throw _privateConstructorUsedError;
  String? get backgroundImage => throw _privateConstructorUsedError;
  String? get color1 => throw _privateConstructorUsedError;
  String? get color2 => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get spinButtonImage => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;
  DateTime? get updateDate => throw _privateConstructorUsedError;
  List<LuckyWheelPriceModel> get luckyPrizeModel =>
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
      {String id,
      String spinName,
      DateTime? startDate,
      DateTime? endDate,
      int? maxParticipants,
      int shopId,
      String? backgroundImage,
      String? color1,
      String? color2,
      String? status,
      String? spinButtonImage,
      DateTime? createdDate,
      DateTime? updateDate,
      List<LuckyWheelPriceModel> luckyPrizeModel});
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
    Object? maxParticipants = freezed,
    Object? shopId = null,
    Object? backgroundImage = freezed,
    Object? color1 = freezed,
    Object? color2 = freezed,
    Object? status = freezed,
    Object? spinButtonImage = freezed,
    Object? createdDate = freezed,
    Object? updateDate = freezed,
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
      maxParticipants: freezed == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundImage: freezed == backgroundImage
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      color1: freezed == color1
          ? _value.color1
          : color1 // ignore: cast_nullable_to_non_nullable
              as String?,
      color2: freezed == color2
          ? _value.color2
          : color2 // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      spinButtonImage: freezed == spinButtonImage
          ? _value.spinButtonImage
          : spinButtonImage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateDate: freezed == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      luckyPrizeModel: null == luckyPrizeModel
          ? _value.luckyPrizeModel
          : luckyPrizeModel // ignore: cast_nullable_to_non_nullable
              as List<LuckyWheelPriceModel>,
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
      {String id,
      String spinName,
      DateTime? startDate,
      DateTime? endDate,
      int? maxParticipants,
      int shopId,
      String? backgroundImage,
      String? color1,
      String? color2,
      String? status,
      String? spinButtonImage,
      DateTime? createdDate,
      DateTime? updateDate,
      List<LuckyWheelPriceModel> luckyPrizeModel});
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
    Object? maxParticipants = freezed,
    Object? shopId = null,
    Object? backgroundImage = freezed,
    Object? color1 = freezed,
    Object? color2 = freezed,
    Object? status = freezed,
    Object? spinButtonImage = freezed,
    Object? createdDate = freezed,
    Object? updateDate = freezed,
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
      maxParticipants: freezed == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundImage: freezed == backgroundImage
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      color1: freezed == color1
          ? _value.color1
          : color1 // ignore: cast_nullable_to_non_nullable
              as String?,
      color2: freezed == color2
          ? _value.color2
          : color2 // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      spinButtonImage: freezed == spinButtonImage
          ? _value.spinButtonImage
          : spinButtonImage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateDate: freezed == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      luckyPrizeModel: null == luckyPrizeModel
          ? _value._luckyPrizeModel
          : luckyPrizeModel // ignore: cast_nullable_to_non_nullable
              as List<LuckyWheelPriceModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LuckyWheelModelImpl implements _LuckyWheelModel {
  const _$LuckyWheelModelImpl(
      {required this.id,
      this.spinName = '',
      this.startDate,
      this.endDate,
      this.maxParticipants,
      required this.shopId,
      this.backgroundImage,
      this.color1,
      this.color2,
      this.status,
      this.spinButtonImage,
      this.createdDate,
      this.updateDate,
      final List<LuckyWheelPriceModel> luckyPrizeModel = const []})
      : _luckyPrizeModel = luckyPrizeModel;

  factory _$LuckyWheelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LuckyWheelModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String spinName;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final int? maxParticipants;
  @override
  final int shopId;
  @override
  final String? backgroundImage;
  @override
  final String? color1;
  @override
  final String? color2;
  @override
  final String? status;
  @override
  final String? spinButtonImage;
  @override
  final DateTime? createdDate;
  @override
  final DateTime? updateDate;
  final List<LuckyWheelPriceModel> _luckyPrizeModel;
  @override
  @JsonKey()
  List<LuckyWheelPriceModel> get luckyPrizeModel {
    if (_luckyPrizeModel is EqualUnmodifiableListView) return _luckyPrizeModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_luckyPrizeModel);
  }

  @override
  String toString() {
    return 'LuckyWheelModel(id: $id, spinName: $spinName, startDate: $startDate, endDate: $endDate, maxParticipants: $maxParticipants, shopId: $shopId, backgroundImage: $backgroundImage, color1: $color1, color2: $color2, status: $status, spinButtonImage: $spinButtonImage, createdDate: $createdDate, updateDate: $updateDate, luckyPrizeModel: $luckyPrizeModel)';
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
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage) &&
            (identical(other.color1, color1) || other.color1 == color1) &&
            (identical(other.color2, color2) || other.color2 == color2) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.spinButtonImage, spinButtonImage) ||
                other.spinButtonImage == spinButtonImage) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updateDate, updateDate) ||
                other.updateDate == updateDate) &&
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
      maxParticipants,
      shopId,
      backgroundImage,
      color1,
      color2,
      status,
      spinButtonImage,
      createdDate,
      updateDate,
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

abstract class _LuckyWheelModel implements LuckyWheelModel {
  const factory _LuckyWheelModel(
          {required final String id,
          final String spinName,
          final DateTime? startDate,
          final DateTime? endDate,
          final int? maxParticipants,
          required final int shopId,
          final String? backgroundImage,
          final String? color1,
          final String? color2,
          final String? status,
          final String? spinButtonImage,
          final DateTime? createdDate,
          final DateTime? updateDate,
          final List<LuckyWheelPriceModel> luckyPrizeModel}) =
      _$LuckyWheelModelImpl;

  factory _LuckyWheelModel.fromJson(Map<String, dynamic> json) =
      _$LuckyWheelModelImpl.fromJson;

  @override
  String get id;
  @override
  String get spinName;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  int? get maxParticipants;
  @override
  int get shopId;
  @override
  String? get backgroundImage;
  @override
  String? get color1;
  @override
  String? get color2;
  @override
  String? get status;
  @override
  String? get spinButtonImage;
  @override
  DateTime? get createdDate;
  @override
  DateTime? get updateDate;
  @override
  List<LuckyWheelPriceModel> get luckyPrizeModel;

  /// Create a copy of LuckyWheelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LuckyWheelModelImplCopyWith<_$LuckyWheelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LuckyWheelPriceModel _$LuckyWheelPriceModelFromJson(Map<String, dynamic> json) {
  return _LuckyWheelPriceModel.fromJson(json);
}

/// @nodoc
mixin _$LuckyWheelPriceModel {
  String get id => throw _privateConstructorUsedError;
  String get spinId => throw _privateConstructorUsedError;
  String? get prizeName => throw _privateConstructorUsedError;
  int? get prizeQuantity => throw _privateConstructorUsedError;
  double? get prizeProbability => throw _privateConstructorUsedError;
  int? get prizeOrder => throw _privateConstructorUsedError;
  String? get prizeImage => throw _privateConstructorUsedError;

  /// Serializes this LuckyWheelPriceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LuckyWheelPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LuckyWheelPriceModelCopyWith<LuckyWheelPriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LuckyWheelPriceModelCopyWith<$Res> {
  factory $LuckyWheelPriceModelCopyWith(LuckyWheelPriceModel value,
          $Res Function(LuckyWheelPriceModel) then) =
      _$LuckyWheelPriceModelCopyWithImpl<$Res, LuckyWheelPriceModel>;
  @useResult
  $Res call(
      {String id,
      String spinId,
      String? prizeName,
      int? prizeQuantity,
      double? prizeProbability,
      int? prizeOrder,
      String? prizeImage});
}

/// @nodoc
class _$LuckyWheelPriceModelCopyWithImpl<$Res,
        $Val extends LuckyWheelPriceModel>
    implements $LuckyWheelPriceModelCopyWith<$Res> {
  _$LuckyWheelPriceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LuckyWheelPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? spinId = null,
    Object? prizeName = freezed,
    Object? prizeQuantity = freezed,
    Object? prizeProbability = freezed,
    Object? prizeOrder = freezed,
    Object? prizeImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      spinId: null == spinId
          ? _value.spinId
          : spinId // ignore: cast_nullable_to_non_nullable
              as String,
      prizeName: freezed == prizeName
          ? _value.prizeName
          : prizeName // ignore: cast_nullable_to_non_nullable
              as String?,
      prizeQuantity: freezed == prizeQuantity
          ? _value.prizeQuantity
          : prizeQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      prizeProbability: freezed == prizeProbability
          ? _value.prizeProbability
          : prizeProbability // ignore: cast_nullable_to_non_nullable
              as double?,
      prizeOrder: freezed == prizeOrder
          ? _value.prizeOrder
          : prizeOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      prizeImage: freezed == prizeImage
          ? _value.prizeImage
          : prizeImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LuckyWheelPriceModelImplCopyWith<$Res>
    implements $LuckyWheelPriceModelCopyWith<$Res> {
  factory _$$LuckyWheelPriceModelImplCopyWith(_$LuckyWheelPriceModelImpl value,
          $Res Function(_$LuckyWheelPriceModelImpl) then) =
      __$$LuckyWheelPriceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String spinId,
      String? prizeName,
      int? prizeQuantity,
      double? prizeProbability,
      int? prizeOrder,
      String? prizeImage});
}

/// @nodoc
class __$$LuckyWheelPriceModelImplCopyWithImpl<$Res>
    extends _$LuckyWheelPriceModelCopyWithImpl<$Res, _$LuckyWheelPriceModelImpl>
    implements _$$LuckyWheelPriceModelImplCopyWith<$Res> {
  __$$LuckyWheelPriceModelImplCopyWithImpl(_$LuckyWheelPriceModelImpl _value,
      $Res Function(_$LuckyWheelPriceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LuckyWheelPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? spinId = null,
    Object? prizeName = freezed,
    Object? prizeQuantity = freezed,
    Object? prizeProbability = freezed,
    Object? prizeOrder = freezed,
    Object? prizeImage = freezed,
  }) {
    return _then(_$LuckyWheelPriceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      spinId: null == spinId
          ? _value.spinId
          : spinId // ignore: cast_nullable_to_non_nullable
              as String,
      prizeName: freezed == prizeName
          ? _value.prizeName
          : prizeName // ignore: cast_nullable_to_non_nullable
              as String?,
      prizeQuantity: freezed == prizeQuantity
          ? _value.prizeQuantity
          : prizeQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      prizeProbability: freezed == prizeProbability
          ? _value.prizeProbability
          : prizeProbability // ignore: cast_nullable_to_non_nullable
              as double?,
      prizeOrder: freezed == prizeOrder
          ? _value.prizeOrder
          : prizeOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      prizeImage: freezed == prizeImage
          ? _value.prizeImage
          : prizeImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LuckyWheelPriceModelImpl implements _LuckyWheelPriceModel {
  const _$LuckyWheelPriceModelImpl(
      {required this.id,
      required this.spinId,
      this.prizeName,
      this.prizeQuantity,
      this.prizeProbability,
      this.prizeOrder,
      this.prizeImage});

  factory _$LuckyWheelPriceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LuckyWheelPriceModelImplFromJson(json);

  @override
  final String id;
  @override
  final String spinId;
  @override
  final String? prizeName;
  @override
  final int? prizeQuantity;
  @override
  final double? prizeProbability;
  @override
  final int? prizeOrder;
  @override
  final String? prizeImage;

  @override
  String toString() {
    return 'LuckyWheelPriceModel(id: $id, spinId: $spinId, prizeName: $prizeName, prizeQuantity: $prizeQuantity, prizeProbability: $prizeProbability, prizeOrder: $prizeOrder, prizeImage: $prizeImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LuckyWheelPriceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.spinId, spinId) || other.spinId == spinId) &&
            (identical(other.prizeName, prizeName) ||
                other.prizeName == prizeName) &&
            (identical(other.prizeQuantity, prizeQuantity) ||
                other.prizeQuantity == prizeQuantity) &&
            (identical(other.prizeProbability, prizeProbability) ||
                other.prizeProbability == prizeProbability) &&
            (identical(other.prizeOrder, prizeOrder) ||
                other.prizeOrder == prizeOrder) &&
            (identical(other.prizeImage, prizeImage) ||
                other.prizeImage == prizeImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, spinId, prizeName,
      prizeQuantity, prizeProbability, prizeOrder, prizeImage);

  /// Create a copy of LuckyWheelPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LuckyWheelPriceModelImplCopyWith<_$LuckyWheelPriceModelImpl>
      get copyWith =>
          __$$LuckyWheelPriceModelImplCopyWithImpl<_$LuckyWheelPriceModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LuckyWheelPriceModelImplToJson(
      this,
    );
  }
}

abstract class _LuckyWheelPriceModel implements LuckyWheelPriceModel {
  const factory _LuckyWheelPriceModel(
      {required final String id,
      required final String spinId,
      final String? prizeName,
      final int? prizeQuantity,
      final double? prizeProbability,
      final int? prizeOrder,
      final String? prizeImage}) = _$LuckyWheelPriceModelImpl;

  factory _LuckyWheelPriceModel.fromJson(Map<String, dynamic> json) =
      _$LuckyWheelPriceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get spinId;
  @override
  String? get prizeName;
  @override
  int? get prizeQuantity;
  @override
  double? get prizeProbability;
  @override
  int? get prizeOrder;
  @override
  String? get prizeImage;

  /// Create a copy of LuckyWheelPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LuckyWheelPriceModelImplCopyWith<_$LuckyWheelPriceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
