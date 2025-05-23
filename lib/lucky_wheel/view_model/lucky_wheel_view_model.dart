import 'dart:convert';
import 'dart:developer';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_received_model.dart';
import 'package:flutter_application_1/lucky_wheel/data/repository/lucky_wheel_repository_impl.dart';
import 'package:flutter_application_1/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'lucky_wheel_state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
part 'lucky_wheel_view_model.g.dart';

@riverpod
class LuckyWheelViewModel extends _$LuckyWheelViewModel {
  final repo = LuckyWheelRepository();
  bool isInit = false;
  final String keyLocal = 'save_gift_local';
  late final SharedPreferences prefs;
  @override
  LuckyWheelState build() {
    return const LuckyWheelState();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
    if (isInit) return;
    getGift();
    getListGiftReceived();

    // Đăng ký topic your/topic và lắng nghe khi có message tới
    // Khi có message tới data sẽ trả về cho callback từ đó se lấy data từ callback để mà xử lý cho từng subsribe
    // mqttService.subscribe(
    //   'KENBAR/1',
    //   callback: (data) async {
    //     print('here connect oke');
    //     GiftReceivedModel gift = GiftReceivedModel.fromJson(data);
    //     await getInfoWhenReloadPage(gift);
    //     if (state.isShowGiftResult == true) {
    //       reloadPageLuckWheel();
    //       return;
    //     }

    //   },
    // );
    isInit = true;
  }

  void getGift() async {
    try {
      state = state.copyWith(isLoadingGift: true);
      final data = await repo.getGifts(state.shopId);
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

  Future getInfoWhenReloadPage(GiftReceivedModel data) async {
    try {
      EasyLoading.show(status: "Loading...");

      state = state.copyWith(gift: data);

      //   await saveGiftLocal();
      EasyLoading.dismiss();
    } catch (e) {
      log("error: $e", name: 'getGift');
    }
  }

  showGiftResult() {
    if (state.gift != null) {
      state = state.copyWith(isShowGiftResult: true);
      connectMQTT();
    }
  }

  void reloadPageLuckWheel() async {
    state = state.copyWith(
        isLoadingGift: false,
        gift: null,
        isShowGiftResult: false,
        isSpinLuckyheel: false,
        errorMessage: null);
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

  Future<void> saveGiftLocal() async {
    var jsonGift = jsonEncode(state.gift);
    await prefs.setString(keyLocal, jsonGift);
  }

  Future<void> getGiftLocal() async {
    final String? action = prefs.getString(keyLocal);
    if (action != null) {
      Map<String, dynamic> valueMap = jsonDecode(action);
      GiftReceivedModel gift = GiftReceivedModel.fromJson(valueMap);
      state = state.copyWith(gift: gift);
      return;
    }
    return;
  }

  // void reloadPage() {
  //   window.location.reload();
  // }

  Future<void> getListGiftReceived() async {
    try {
      var data = await repo.getGiftReceived();
      state = state.copyWith(listGiftReceived: data);
    } catch (e) {
      log("error: $e", name: 'getGift');
    }
  }

  getBarcode(String barcode) async {
    reloadPageLuckWheel();
    var data = await repo.getGiftsFormBarcode(barcode, state.shopId);

    if (data != null) {
      state = state.copyWith(gift: data, isCheckBarcode: true);
    } else {
      state = state.copyWith(errorMessage: 'Hóa đơn đã tham gia vòng quay!');
    }
  }

  setOnCheckBarcode() {
    state = state.copyWith(isCheckBarcode: false);
  }

  connectMQTT() {
    mqttService.publishMessage(state.gift ?? GiftReceivedModel());
  }

  void setShopId(int shopId) {
    state = state.copyWith(shopId: shopId);
  }
}
