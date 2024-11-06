import 'package:client_information/client_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/fortune_wheel/ui/screen_sign_in.dart';
import 'package:flutter_application_1/fortune_wheel/ui/screen_spin.dart';

import 'data/model/signin_request.dart';
import 'data/model/voucher_model.dart';
import 'view_model/fortune_wheel_view_model.dart';

class MyFortuneWheel extends StatefulWidget {
  const MyFortuneWheel({super.key});

  @override
  State<MyFortuneWheel> createState() => _MyFortuneWheelState();
}

class _MyFortuneWheelState extends State<MyFortuneWheel> {
  late bool isShowSignInPopup;
  final vm = FortuneWheelViewModel();
  var vouchers = <VoucherModel>[];
  String deviceId = '';
  VoucherModel? voucherResult;

  @override
  void initState() {
    super.initState();
    getDeviceId();
    onLoadVoucher();
    isShowSignInPopup = vm.isShowSignIn;
  }

  Future<void> onLoadVoucher() async {
    var res = await vm.getVoucher();
    setState(() {
      vouchers = res;
    });
  }

  Future<void> getDeviceId() async {
    // deviceId = 'y';
    // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // if (Platform.isAndroid) {
    //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    //   deviceId = androidInfo.id; // Lấy ID thiết bị trên Android
    // } else if (Platform.isIOS) {
    //   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    //   deviceId = iosInfo.identifierForVendor ?? ''; // Lấy ID thiết bị trên iOS
    // }
    // deviceId = '${DateTime.now().millisecondsSinceEpoch}$deviceId';
    // if (kIsWeb) {
    //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    //   WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
    //   var deviceIdentifier = webInfo.vendor! +
    //       webInfo.userAgent! +
    //       webInfo.hardwareConcurrency.toString();
    //   deviceId = deviceIdentifier;

    var basicInfo = await ClientInformation.fetch();
    deviceId = basicInfo.deviceId;
    setState(() {});
    print('Device ID: $deviceId');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> onSignIn(String name, String phone) async {
    if (name.trim().isNotEmpty && phone.trim().isNotEmpty) {
      var user = SigninRequest();
      user
        ..name = name
        ..phoneNumber = phone
        ..device = deviceId
        ..ispinAgain = false;
      await vm.signIn(user);
      setState(() {
        isShowSignInPopup = vm.isShowSignIn;
      });
    }
  }

  void onSpinResult(int index) {
    if (vm.user != null) {
      String codeMoreTurn = 'GIFTKG2024'; // Mã code thêm lượt từ API
      if (vm.user!.code == codeMoreTurn) return;
      setState(() {
        voucherResult = vouchers[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Builder(
          builder: (context) {
            return Stack(
              children: [
                Image.asset(
                  'assets/images/vongquay.png',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                ScreenSpin(
                  initValue: vm.user?.code,
                  vouchers: vouchers,
                  spinResult: voucherResult,
                  onSpinResult: onSpinResult,
                ),
                isShowSignInPopup
                    ? ScreenSignIn(
                        onSignIn: onSignIn,
                      )
                    : const SizedBox(),
                Container(
                    padding: const EdgeInsets.all(40),
                    color: Colors.white,
                    width: 400,
                    child: Text('deviceId:$deviceId'))
              ],
            );
          },
        ),
      ),
    );
  }
}
