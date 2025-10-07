import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:k2pos_spin/lucky_wheel/data/model/gift_model.dart';
import 'package:k2pos_spin/lucky_wheel/data/model/gift_received_model.dart';


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
  }) = _LuckyWheelState;
}
