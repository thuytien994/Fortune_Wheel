import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/fortune_wheel_1/data/model/voucher_model.dart';
import 'package:flutter_application_1/fortune_wheel_1/ui/widget/animated/btn_spin_anima_btn.dart';
import 'package:flutter_application_1/fortune_wheel_1/ui/widget/result_spin.dart';
import 'package:flutter_application_1/fortune_wheel_1/ui/widget/spin.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

class ScreenSpin extends StatefulWidget {
  final String? initValue;
  final List<GiftModel2> vouchers; // Danh sách voucher
  final GiftModel2?
      spinResult; // Kết quả trả về. Nếu null thì quay tiếp, khác null là dừng
  final Function(int index) onSpinResult; // Function callback từ con sang cha

  final ScreenshotController screenshotController;
  ScreenSpin(
      {super.key,
      required this.initValue,
      required this.vouchers,
      required this.spinResult,
      required this.onSpinResult,
      required this.screenshotController});

  @override
  State<ScreenSpin> createState() => _ScreenSpinState();
}

class _ScreenSpinState extends State<ScreenSpin> with TickerProviderStateMixin {
  late Animation<double> animationBtnSpin;
  late AnimationController controllerAnimation;
  var controllerStream = StreamController<int>();
  GiftModel2? spinResult;
  List<GiftModel2> listItem = [];
  String? initValue;
  Widget btnSpin = Container();
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
    }
    setState(() {});
    _showClickSpin();
  }

  _showClickSpin() {
    btnSpin = Container(
      child: GestureDetector(
        onTap: () {
          _spinningResults();
        },
        behavior: HitTestBehavior.opaque,
        child: SpinAnimaBtn(animation: animationBtnSpin),
      ),
    );
    return btnSpin;
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

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Positioned(
                  top: 50,
                  right: 10,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.81,
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/mam.png'))),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Stack(
                        children: [
                          SpinWidget(
                            controllerStream: controllerStream,
                            items: listItem,
                          ),
                          Align(alignment: Alignment.center, child: btnSpin),
                        ],
                      ),
                    ),
                  ),
                ),
                spinResult != null && spinResult!.description != null
                    ? ReslutSpin(
                        resultSpin: spinResult ?? GiftModel2(),
                        screenshotController: widget.screenshotController,
                        onExit: () {
                          btnSpin = Text(
                            'Đã quay',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w800, fontSize: 25),
                          );
                          spinResult = null;
                          setState(() {});
                        },
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }

  _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  _spinningResults() async {
    final index = listItem.indexWhere((e) => e.code == initValue);
    controllerStream.add(index); // update item selected
    await Future.delayed(const Duration(seconds: 15), () {});
    widget.onSpinResult(index);
    setState(() {});
  }
}