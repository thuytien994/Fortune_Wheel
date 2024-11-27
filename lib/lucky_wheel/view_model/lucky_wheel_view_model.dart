import 'dart:developer';

import 'package:flutter_application_1/fortune_wheel_1/data/model/voucher_model.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_model.dart';
import 'package:flutter_application_1/lucky_wheel/data/repository/lucky_wheel_repository_impl.dart';
import 'package:flutter_application_1/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'lucky_wheel_state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
part 'lucky_wheel_view_model.g.dart';

@riverpod
class LuckyWheelViewModel extends _$LuckyWheelViewModel {
  final repo = LuckyWheelRepository();
  bool isInit = false;

  @override
  LuckyWheelState build() {
    return const LuckyWheelState();
  }

  void init() {
    if (isInit) return;
    getGift();
    // Đăng ký topic your/topic và lắng nghe khi có message tới
    // Khi có message tới data sẽ trả về cho callback từ đó sex lấy data từ callback để mà xử lý cho từng subsribe cụ thể
    mqttService.subscribe(
      'your/topic',
      callback: (data) {
        GiftModel2 gift = GiftModel2.fromJson(data);
        signInLuckyWheel222(gift);
      },
    );
    isInit = true;
  }

  void getGift() async {
    try {
      print('showgift ${state.gift}');
      state = state.copyWith(isLoadingGift: true);
      final data = await repo.getGifts();
      state = state.copyWith(
        listGift: data,
        isLoadingGift: false,
      );
    } catch (e) {
      log("error: $e", name: 'getGift');
      state = state.copyWith(isLoadingGift: false);
    }
  }

  Future signInLuckyWheel(String phone) async {
    try {
      EasyLoading.show(status: "Loading...");

      var data = await repo.signInLuckyWheel(phone);
      state = state.copyWith(gift: data);
      EasyLoading.dismiss();
    } catch (e) {
      log("error: $e", name: 'getGift');
    }
  }

  Future signInLuckyWheel222(GiftModel2 data) async {
    try {
      EasyLoading.show(status: "Loading...");
      data.discount = -1;
      data.voucherCode = '';
      data.giftCode = '';
      state = state.copyWith(gift: data);
      EasyLoading.dismiss();
    } catch (e) {
      log("error: $e", name: 'getGift');
    }
  }

  showGiftResult() {
    if (state.gift != null) {
      state = state.copyWith(isShowGiftResult: true);
    }
  }

  void reloadPageLuckWheel() {
    state = state.copyWith(
        isLoadingGift: false,
        gift: null,
        isShowGiftResult: false,
        isSpinLuckyheel: false);
  }

  void disposeController() {
    state = state.copyWith(
      isLoadingGift: false,
      gift: null,
      isShowGiftResult: false,
    );
  }

  void onSpinLuckyheel() {
    state = state.copyWith(isSpinLuckyheel: true);
  }
}
