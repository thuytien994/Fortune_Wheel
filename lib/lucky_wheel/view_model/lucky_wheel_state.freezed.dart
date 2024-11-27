// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lucky_wheel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LuckyWheelState {
  List<GiftModel> get listGift => throw _privateConstructorUsedError;
  bool get isLoadingGift => throw _privateConstructorUsedError;
  GiftModel2? get gift => throw _privateConstructorUsedError;
  bool get isShowGiftResult => throw _privateConstructorUsedError;
  bool get isSpinLuckyheel => throw _privateConstructorUsedError;

  /// Create a copy of LuckyWheelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LuckyWheelStateCopyWith<LuckyWheelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LuckyWheelStateCopyWith<$Res> {
  factory $LuckyWheelStateCopyWith(
          LuckyWheelState value, $Res Function(LuckyWheelState) then) =
      _$LuckyWheelStateCopyWithImpl<$Res, LuckyWheelState>;
  @useResult
  $Res call(
      {List<GiftModel> listGift,
      bool isLoadingGift,
      GiftModel2? gift,
      bool isShowGiftResult,
      bool isSpinLuckyheel});
}

/// @nodoc
class _$LuckyWheelStateCopyWithImpl<$Res, $Val extends LuckyWheelState>
    implements $LuckyWheelStateCopyWith<$Res> {
  _$LuckyWheelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LuckyWheelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listGift = null,
    Object? isLoadingGift = null,
    Object? gift = freezed,
    Object? isShowGiftResult = null,
    Object? isSpinLuckyheel = null,
  }) {
    return _then(_value.copyWith(
      listGift: null == listGift
          ? _value.listGift
          : listGift // ignore: cast_nullable_to_non_nullable
              as List<GiftModel>,
      isLoadingGift: null == isLoadingGift
          ? _value.isLoadingGift
          : isLoadingGift // ignore: cast_nullable_to_non_nullable
              as bool,
      gift: freezed == gift
          ? _value.gift
          : gift // ignore: cast_nullable_to_non_nullable
              as GiftModel2?,
      isShowGiftResult: null == isShowGiftResult
          ? _value.isShowGiftResult
          : isShowGiftResult // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpinLuckyheel: null == isSpinLuckyheel
          ? _value.isSpinLuckyheel
          : isSpinLuckyheel // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LuckyWheelStateImplCopyWith<$Res>
    implements $LuckyWheelStateCopyWith<$Res> {
  factory _$$LuckyWheelStateImplCopyWith(_$LuckyWheelStateImpl value,
          $Res Function(_$LuckyWheelStateImpl) then) =
      __$$LuckyWheelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GiftModel> listGift,
      bool isLoadingGift,
      GiftModel2? gift,
      bool isShowGiftResult,
      bool isSpinLuckyheel});
}

/// @nodoc
class __$$LuckyWheelStateImplCopyWithImpl<$Res>
    extends _$LuckyWheelStateCopyWithImpl<$Res, _$LuckyWheelStateImpl>
    implements _$$LuckyWheelStateImplCopyWith<$Res> {
  __$$LuckyWheelStateImplCopyWithImpl(
      _$LuckyWheelStateImpl _value, $Res Function(_$LuckyWheelStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LuckyWheelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listGift = null,
    Object? isLoadingGift = null,
    Object? gift = freezed,
    Object? isShowGiftResult = null,
    Object? isSpinLuckyheel = null,
  }) {
    return _then(_$LuckyWheelStateImpl(
      listGift: null == listGift
          ? _value._listGift
          : listGift // ignore: cast_nullable_to_non_nullable
              as List<GiftModel>,
      isLoadingGift: null == isLoadingGift
          ? _value.isLoadingGift
          : isLoadingGift // ignore: cast_nullable_to_non_nullable
              as bool,
      gift: freezed == gift
          ? _value.gift
          : gift // ignore: cast_nullable_to_non_nullable
              as GiftModel2?,
      isShowGiftResult: null == isShowGiftResult
          ? _value.isShowGiftResult
          : isShowGiftResult // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpinLuckyheel: null == isSpinLuckyheel
          ? _value.isSpinLuckyheel
          : isSpinLuckyheel // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LuckyWheelStateImpl implements _LuckyWheelState {
  const _$LuckyWheelStateImpl(
      {final List<GiftModel> listGift = const [],
      this.isLoadingGift = false,
      this.gift = null,
      this.isShowGiftResult = false,
      this.isSpinLuckyheel = false})
      : _listGift = listGift;

  final List<GiftModel> _listGift;
  @override
  @JsonKey()
  List<GiftModel> get listGift {
    if (_listGift is EqualUnmodifiableListView) return _listGift;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listGift);
  }

  @override
  @JsonKey()
  final bool isLoadingGift;
  @override
  @JsonKey()
  final GiftModel2? gift;
  @override
  @JsonKey()
  final bool isShowGiftResult;
  @override
  @JsonKey()
  final bool isSpinLuckyheel;

  @override
  String toString() {
    return 'LuckyWheelState(listGift: $listGift, isLoadingGift: $isLoadingGift, gift: $gift, isShowGiftResult: $isShowGiftResult, isSpinLuckyheel: $isSpinLuckyheel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LuckyWheelStateImpl &&
            const DeepCollectionEquality().equals(other._listGift, _listGift) &&
            (identical(other.isLoadingGift, isLoadingGift) ||
                other.isLoadingGift == isLoadingGift) &&
            (identical(other.gift, gift) || other.gift == gift) &&
            (identical(other.isShowGiftResult, isShowGiftResult) ||
                other.isShowGiftResult == isShowGiftResult) &&
            (identical(other.isSpinLuckyheel, isSpinLuckyheel) ||
                other.isSpinLuckyheel == isSpinLuckyheel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listGift),
      isLoadingGift,
      gift,
      isShowGiftResult,
      isSpinLuckyheel);

  /// Create a copy of LuckyWheelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LuckyWheelStateImplCopyWith<_$LuckyWheelStateImpl> get copyWith =>
      __$$LuckyWheelStateImplCopyWithImpl<_$LuckyWheelStateImpl>(
          this, _$identity);
}

abstract class _LuckyWheelState implements LuckyWheelState {
  const factory _LuckyWheelState(
      {final List<GiftModel> listGift,
      final bool isLoadingGift,
      final GiftModel2? gift,
      final bool isShowGiftResult,
      final bool isSpinLuckyheel}) = _$LuckyWheelStateImpl;

  @override
  List<GiftModel> get listGift;
  @override
  bool get isLoadingGift;
  @override
  GiftModel2? get gift;
  @override
  bool get isShowGiftResult;
  @override
  bool get isSpinLuckyheel;

  /// Create a copy of LuckyWheelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LuckyWheelStateImplCopyWith<_$LuckyWheelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
