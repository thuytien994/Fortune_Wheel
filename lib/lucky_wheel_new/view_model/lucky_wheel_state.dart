import 'package:flutter_application_1/lucky_wheel_new/data/model/gift_received_model.dart';
import 'package:flutter_application_1/lucky_wheel_new/data/model/gift_model.dart';
import 'package:flutter_application_1/lucky_wheel_new/data/model/lucky_wheel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lucky_wheel_state.freezed.dart';

@freezed
class LuckyWheelState with _$LuckyWheelState {
  const factory LuckyWheelState({
    @Default([]) List<GiftModel> listGift,
    @Default(false) bool isLoadingGift,
    @Default(null) GiftReceivedModel? gift,
    @Default(false) bool isShowGiftResult,
    @Default(false) bool isSpinLuckyheel,
    @Default(false) bool isCheckBarcode,
    @Default(null) String? errorMessage,
    @Default(-1) int shopId,
    @Default([])
    List<GiftReceivedModel>
        listGiftReceived, //  spin when click enter  in keyboard
    LuckyWheelModel? luckyWheel,
    
  }) = _LuckyWheelState;
}
