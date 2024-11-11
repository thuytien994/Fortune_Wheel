import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/fortune_wheel/data/data_source/fortune_wheel_datasource.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/account_model.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/signin_request.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/voucher_model.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String saveInfoGift = 'save_info_gift';

class FortuneWheelViewModel {
  AccountModel? user;
  var api = FortuneWheelDatasource();

  ScreenshotController screenshotController = ScreenshotController();
  bool get isShowSignIn =>
      user == null; // Nếu true là hiển thị popup/màn đăng nhập

  String? errorMessage;

  Future<void> signIn(SigninRequest request, BuildContext context) async {
    try {
      errorMessage = null;
      var result = await api.login(request);
      if (result.data != null) {
        user = result.data;
      } else {
        errorMessage = result.errorMessage!;
      }
    } catch (err) {
      if (err is DioException) {
        errorMessage = err.response?.data['message'];
        FlutterToastr.show(errorMessage ?? 'Lỗi đăng nhập ', context,
            duration: 3);
      } else {
        errorMessage = err.toString();
      }
    }
  }

  Future<List<VoucherModel>> getVoucher() async {
    var reponse = await api.getVoucher();
    return reponse;
  }

  void saveGiftonLocal(AccountModel gift, SharedPreferences prefs) {
    var data = jsonEncode(gift.toJson());
    prefs.setString(saveInfoGift, data);
  }

  AccountModel? getGiftonLocal(SharedPreferences prefs) {
    var data = prefs.getString(saveInfoGift);
    if (data != null) {
      user = AccountModel.fromJson(jsonDecode(data));
    }
    return user;
  }
}
