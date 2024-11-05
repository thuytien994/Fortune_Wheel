import 'package:flutter_application_1/fortune_wheel/data/data_source/spin_data.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/account_model.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/signin_request.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/voucher_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class FortuneWheelViewModel {
  AccountModel? user;
  var data = SpinData();
  bool get isShowSignIn => user == null; // Nếu true là hiển thị popup/màn đăng nhập

  Future<void> signIn(SigninRequest request) async {
    user = await data.login(request);
  }

  Future<List<VoucherModel>> getVoucher() async {
    var reponse = await data.getVoucher();
    return reponse;
  }

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return '';
  }
}
