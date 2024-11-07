import 'package:dio/dio.dart';
import 'package:flutter_application_1/fortune_wheel/data/data_source/fortune_wheel_datasource.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/account_model.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/signin_request.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/voucher_model.dart';
import 'package:screenshot/screenshot.dart';

class FortuneWheelViewModel {
  AccountModel? user;
  var api = FortuneWheelDatasource();
  
  ScreenshotController screenshotController = ScreenshotController();
  bool get isShowSignIn =>
      user == null; // Nếu true là hiển thị popup/màn đăng nhập

  String? errorMessage;

  Future<void> signIn(SigninRequest request) async {
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
      } else {
        errorMessage = err.toString();
      }
    }
  }

  Future<List<VoucherModel>> getVoucher() async {
    var reponse = await api.getVoucher();
    return reponse;
  }
}
