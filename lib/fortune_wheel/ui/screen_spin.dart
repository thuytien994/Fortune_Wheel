import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/voucher_model.dart';
import 'package:flutter_application_1/fortune_wheel/ui/widget/animated/btn_spin_anima_btn.dart';
import 'package:flutter_application_1/fortune_wheel/ui/widget/result_spin.dart';
import 'package:flutter_application_1/fortune_wheel/ui/widget/spin.dart';

class ScreenSpin extends StatefulWidget {
  final String? initValue;
  final List<VoucherModel> vouchers; // Danh sách voucher
  final VoucherModel?
      spinResult; // Kết quả trả về. Nếu null thì quay tiếp, khác null là dừng
  final Function(int index) onSpinResult; // Function callback từ con sang cha

  ScreenSpin({
    super.key,
    required this.initValue,
    required this.vouchers,
    required this.spinResult,
    required this.onSpinResult,
  });

  @override
  State<ScreenSpin> createState() => _ScreenSpinState();
}

class _ScreenSpinState extends State<ScreenSpin> with TickerProviderStateMixin {
  late Animation<double> animationBtnSpin;
  late AnimationController controllerAnimation;
  var controllerStream = StreamController<int>();
  VoucherModel? spinResult;
  List<VoucherModel> listItem = [];
  String? initValue;

  @override
  void initState() {
    super.initState();
    initValue = widget.initValue;
    spinResult = widget.spinResult;
    listItem = widget.vouchers;
    _setAnimationBtnSpin();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(ScreenSpin oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.vouchers.length != oldWidget.vouchers.length) {
      listItem = widget.vouchers;
    }
    if (widget.initValue != oldWidget.initValue) {
      initValue = widget.initValue;
    }
    if (widget.spinResult != null) {
      spinResult = widget.spinResult;
      controllerAnimation.dispose();
    }
  }

  _setAnimationBtnSpin() {
    controllerAnimation =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animationBtnSpin =
        CurvedAnimation(parent: controllerAnimation, curve: Curves.linear)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                controllerAnimation.reverse();
              } else if (status == AnimationStatus.dismissed) {
                controllerAnimation.forward();
              }
            },
          );

    controllerAnimation.forward();
  }

  // _setAnimationGift() {
  //   controllerGift =
  //       AnimationController(duration: const Duration(seconds: 1), vsync: this);
  //   animationGift =
  //       CurvedAnimation(parent: controllerGift, curve: Curves.linear)
  //         ..addStatusListener(
  //           (status) {
  //             if (status == AnimationStatus.completed) {
  //               controllerGift.reverse();
  //             } else if (status == AnimationStatus.dismissed) {
  //               controllerGift.forward();
  //             }
  //           },
  //         );
  //   controllerGift.forward();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                //  Image.asset('assets/images/bgrsspins.png', fit: BoxFit.cover),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/mam.png'),
                          fit: BoxFit.contain)),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: listItem.isNotEmpty
                        ? SpinWidget(
                            controllerStream: controllerStream,
                            items: listItem,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: spinResult == null
                      ? GestureDetector(
                          onTap: () {
                            _spinningResults();
                          },
                          behavior: HitTestBehavior.opaque,
                          child: SpinAnimaBtn(animation: animationBtnSpin),
                        )
                      : Text(
                          'Đã quay',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                        ),
                ),
                spinResult != null && spinResult!.description != null
                    ? ReslutSpin(
                        resultSpin: spinResult?? VoucherModel(),
                      )
                    : const SizedBox()
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  _spinningResults() async {
    final index = listItem.indexWhere((e) => e.code == initValue);
    controllerStream.add(index); // update item selected
    // Kiểm tra vị trí index. Check xem mã code có phải là thêm lượt không
    // isSpin = listItem[spinResultt].code == codeMoreTurn;
    await Future.delayed(const Duration(seconds: 2), () {});
    widget.onSpinResult(index);
  }
}
