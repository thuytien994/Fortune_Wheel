import 'package:flutter_application_1/fortune_wheel_1/data/model/voucher_model.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lucky_wheel_state.freezed.dart';

@freezed
class LuckyWheelState with _$LuckyWheelState {
  const factory LuckyWheelState({
    @Default([]) List<GiftModel2> listGift,
    @Default(false) bool isLoadingGift,
    @Default(null) GiftModel2? gift,
    @Default(false) bool isShowGiftResult,
    @Default(false) bool isSpinLuckyheel, //  spin when click enter  in keyboard
  }) = _LuckyWheelState;
}
