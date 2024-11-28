import 'package:flutter/material.dart';
import 'package:flutter_application_1/fortune_wheel_1/data/model/account_model.dart';
import 'package:flutter_application_1/fortune_wheel_1/data/model/signin_request.dart';
import 'package:flutter_application_1/fortune_wheel_1/ui/screen_sign_in.dart';
import 'package:flutter_application_1/fortune_wheel_1/ui/screen_spin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import '../lucky_wheel/data/model/voucher_model.dart';
import 'view_model/fortune_wheel_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum keySaveLogin { deviceLogin }

class MyFortuneWheel extends ConsumerStatefulWidget {
  const MyFortuneWheel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyFortuneWheelState();

  // @override
  // State<MyFortuneWheel>() async => _MyFortuneWheelState();
}

class _MyFortuneWheelState extends ConsumerState<MyFortuneWheel> {
  static const kerSaveLogin = 'device-login';
  late bool isShowSignInPopup;
  final vm = FortuneWheelViewModel();
  var vouchers = <GiftModel2>[];
  String deviceId = '';
  GiftModel2? voucherResult;
  final controllerName = TextEditingController();
  final controllerPhone = TextEditingController();
  SharedPreferences? prefs;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var isLoad = true;
  AutovalidateMode validateMode = AutovalidateMode.disabled;
  var user = SigninRequest();
  AccountModel? getInfoGiftLocal = AccountModel();
  @override
  void initState() {
    super.initState();
    getDeviceId();
    onLoadVoucher();
    isShowSignInPopup = vm.isShowSignIn;
  }

  @override
  void didChangeDependencies() {
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
  }

  Future<void> onSignIn(String name, String phone) async {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        validateMode = AutovalidateMode.always;
      });
      return;
    }
    setState(() {
      isLoad = false;
    });
    user
      ..name = name
      ..phoneNumber = phone
      ..device = deviceId
      ..ispinAgain = false;
    await vm.signIn(user, context);
    if (vm.isShowSignIn == false && prefs != null) {
      prefs!.setBool(kerSaveLogin, true); // da login
    }
    vm.user?.userName = name;
    setState(() {
      isShowSignInPopup = vm.isShowSignIn;
      isLoad = true;
    });
  }

  void onSpinResult(int index) async {
    if (vm.user != null) {
      String codeMoreTurn =
          'GIFTKG2024'; // Mã code thêm lượt từ API //GIFTKG2024
      if (vm.user!.code == codeMoreTurn) {
        user.ispinAgain = true;
        FlutterToastr.show("Bạn được nhận thêm một lượt quay ", context,
            duration: 2);
        await vm.signIn(user, context);
      } else if (vm.user!.code != codeMoreTurn) {
        voucherResult = vouchers[index];
        voucherResult
          ?..userName = user.name
          ..giftCode = vm.user?.giftCode
          ..voucherCode = vm.user?.voucherCode;
      }
    }
    setState(() {});
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
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/bgr_fortune.png',
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),

              vouchers.length > 1
                  ? ScreenSpin(
                      initValue: vm.user?.code,
                      vouchers: vouchers,
                      spinResult: voucherResult,
                      onSpinResult: onSpinResult,
                      screenshotController: vm.screenshotController,
                    )
                  : const SizedBox(),
              isShowSignInPopup
                  ? Form(
                      key: _formKey,
                      autovalidateMode: validateMode,
                      child: ScreenSignIn(
                        onSignIn: onSignIn,
                        controllerName: controllerName,
                        controllerPhone: controllerPhone,
                        isLogging: !isLoad,
                      ),
                    )
                  : const SizedBox(),
              // Positioned(
              //   top: kToolbarHeight + MediaQuery.paddingOf(context).top + 20,
              //   child: Container(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //     decoration: BoxDecoration(
              //         color: Colors.black.withOpacity(0.8),
              //         borderRadius: BorderRadius.circular(10)),
              //     child: Row(
              //       children: [
              //         const Icon(
              //           Icons.warning_amber_rounded,
              //           color: Colors.amber,
              //           size: 40,
              //         ),
              //         Text(
              //           ' Bạn đã hết lượt quay ',
              //           style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              //               color: Colors.white, fontWeight: FontWeight.w700),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              !isLoad
                  ? const CircularProgressIndicator(
                      color: Colors.amber,
                    )
                  : const SizedBox(),
              // getInfoGiftLocal != null
              //     ? Positioned(
              //         bottom: 100,
              //         right: 100,
              //         child: GestureDetector(
              //           onTap: () {},
              //           child: Container(
              //             color: Colors.blue,
              //             width: 200,
              //             child: Text(
              //               'Xem quà của bạn',
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodyLarge!
              //                   .copyWith(
              //                       color: Colors.black,
              //                       fontWeight: FontWeight.w900),
              //             ),
              //           ),
              //         ),
              //       )
              //     : const SizedBox()
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
