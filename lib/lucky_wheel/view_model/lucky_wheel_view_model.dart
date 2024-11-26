import 'dart:developer';

import 'package:flutter_application_1/lucky_wheel/data/repository/lucky_wheel_repository_impl.dart';
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
    isInit = true;
  }

  void getGift() async {
    try {
      state = state.copyWith(isLoadingGift: true);
      final data = await repo.getGifts();
      print('data: $data');
      state = state.copyWith(
        listGift: data,
        isLoadingGift: false,
        gift: null,
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
