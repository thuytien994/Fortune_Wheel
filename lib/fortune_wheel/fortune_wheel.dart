import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/signin_request.dart';
import 'package:flutter_application_1/fortune_wheel/ui/screen_sign_in.dart';
import 'package:flutter_application_1/fortune_wheel/ui/screen_spin.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'data/model/voucher_model.dart';
import 'view_model/fortune_wheel_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum keySaveLogin { deviceLogin }

class MyFortuneWheel extends StatefulWidget {
  const MyFortuneWheel({super.key});

  @override
  State<MyFortuneWheel> createState() => _MyFortuneWheelState();
}

class _MyFortuneWheelState extends State<MyFortuneWheel> {
  static const kerSaveLogin = 'device-login';
  late bool isShowSignInPopup;
  final vm = FortuneWheelViewModel();
  var vouchers = <VoucherModel>[];
  String deviceId = '';
  VoucherModel? voucherResult;
  final controllerName = TextEditingController();
  final controllerPhone = TextEditingController();
  late bool isLoggedIn = false;
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    getDeviceId();
    onLoadVoucher();
    isShowSignInPopup = vm.isShowSignIn;
  }

  initPreft() async {
    prefs = await SharedPreferences.getInstance();
    print('Login prefs moi vao ap : ${prefs}');
    if (prefs != null) {
      isLoggedIn = await prefs!.getBool(kerSaveLogin) ?? false;
      print('Login isLoggedIn kt bien: ${isLoggedIn}');
    }
  }

  @override
  void didChangeDependencies() {
    initPreft();
    super.didChangeDependencies();
  }

  Future<void> onLoadVoucher() async {
    var res = await vm.getVoucher();

    setState(() {
      vouchers = res;
    });
  }

  Future<void> getDeviceId() async {
    deviceId = DateTime.now().millisecondsSinceEpoch.toString();
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
    //   setState(() {});
    //   print('Device ID: $deviceId');
    // }
  }

  Future<void> onSignIn(String name, String phone) async {
    var valid = validateMobile(phone);
    if (isLoggedIn) {
      FlutterToastr.show("Thiết bị này đã đăng nhập !", context);
    } else {
      if (name.trim().isNotEmpty && valid == null) {
        var user = SigninRequest();
        user
          ..name = name
          ..phoneNumber = phone
          ..device = deviceId
          ..ispinAgain = false;
        await vm.signIn(user);
        if (vm.isShowSignIn == false && prefs != null) {
          prefs!.setBool(kerSaveLogin, true); // da login
        }
        vm.user?.userName = name;
        setState(() {
          isShowSignInPopup = vm.isShowSignIn;
          controllerName.dispose();
          controllerPhone.dispose();
        });
      } else {
        FlutterToastr.show(valid ?? 'Số điện thoạt chưa đúng', context,
            duration: 2);
      }
    }
  }

  void onSpinResult(int index) {
    if (vm.user != null) {
      String codeMoreTurn = 'GIFTKG2024'; // Mã code thêm lượt từ API
      if (vm.user!.code == codeMoreTurn) return;
      setState(() {
        voucherResult = vouchers[index];
        voucherResult?.userName = vm.user?.userName;
      });
    }
  }

  String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return 'vui lòng nhập số điện thoạt';
    } else if (!regExp.hasMatch(value)) {
      return 'số điện thoạt chưa đúng';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            ///  fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/bgr-vongquay.png',
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              ScreenSpin(
                initValue: vm.user?.code,
                vouchers: vouchers,
                spinResult: voucherResult,
                onSpinResult: onSpinResult,
                screenshotController: vm.screenshotController,
              ),
              isShowSignInPopup
                  ? ScreenSignIn(
                      onSignIn: onSignIn,
                      controllerName: controllerName,
                      controllerPhone: controllerPhone,
                    )
                  : const SizedBox(),
              isLoggedIn == true
                  ? Positioned(
                      top: 200,
                      child: Container(
                        width: 300,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.amber,
                              size: 40,
                            ),
                            Text(
                              ' Thiết bị này đã đăng nhập ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
