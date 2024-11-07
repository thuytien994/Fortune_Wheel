import 'package:flutter_application_1/fortune_wheel/data/data_source/spin_data.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/account_model.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/signin_request.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/voucher_model.dart';

class FortuneWheelViewModel {
  AccountModel? user;
  var data = SpinData();
  bool get isShowSignIn =>
      user == null; // Nếu true là hiển thị popup/màn đăng nhập

  Future<void> signIn(SigninRequest request) async {
    user = await data.login(request);
  }

  Future<List<VoucherModel>> getVoucher() async {
    var reponse = await data.getVoucher();
    return reponse;
  }
}
