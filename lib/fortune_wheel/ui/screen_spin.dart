import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/voucher_model.dart';
import 'package:flutter_application_1/fortune_wheel/ui/widget/animated/spin_anima_btn.dart';
import 'package:flutter_application_1/fortune_wheel/ui/widget/gift.dart';
import 'package:flutter_application_1/fortune_wheel/ui/widget/spin.dart';
import 'package:flutter_application_1/fortune_wheel/view_model/fortune_wheel_view_model.dart';

class ScreenSpin extends StatefulWidget {
  final String? initValue; // Giá trị khởi tạo
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
  late Animation<double> animationGift;
  late AnimationController controllerGift;
  var controllerStream = StreamController<int>();
  VoucherModel? spinResult;
  final List<String> items = ['🍎', '🍌', '🍒', '🍇', '🍉', '🍇', '🍉', '🍉'];
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
                //  controllerAnimation.forward();
              }
            },
          );

    //   controllerAnimation.forward();
  }

  _setAnimationGift() {
    controllerGift =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animationGift =
        CurvedAnimation(parent: controllerGift, curve: Curves.linear)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                controllerGift.reverse();
              } else if (status == AnimationStatus.dismissed) {
                //    controllerGift.forward();
              }
            },
          );
    //   controllerGift.forward();
  }

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
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/bgrsspins.png'),
                          fit: BoxFit.contain)),
                  child: Padding(
                    padding: const EdgeInsets.all(40),
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
                    ? Gift(
                        item: spinResult!.description!,
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
    // Vị trí index sau khi random
    final index = listItem.indexWhere((e) => e.code == initValue);
    controllerStream.add(index); // Cập nhật mục được chọ
    // Kiểm tra vị trí index. Check xem mã code có phải là thêm lượt không
    // isSpin = listItem[spinResultt].code == codeMoreTurn;
    await Future.delayed(const Duration(seconds: 2), () {});
    widget.onSpinResult(index);

    // controllerAnimation.dispose();
  }
}
