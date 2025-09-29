import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/util/color_util.dart';
import 'package:flutter_application_1/lucky_wheel_new/data/model/gift_received_model.dart';
import 'package:flutter_application_1/lucky_wheel_new/data/model/lucky_wheel_model.dart';
import 'package:flutter_application_1/lucky_wheel_new/view_model/lucky_wheel_view_model.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:screenshot/screenshot.dart';
import 'components.dart';

class LuckyWidget extends ConsumerStatefulWidget {
  final LuckyWheelModel luckyWheelData;
  const LuckyWidget({
    super.key,
    required this.luckyWheelData,
  });

  @override
  ConsumerState<LuckyWidget> createState() => _LuckyWidgetState();
}

class _LuckyWidgetState extends ConsumerState<LuckyWidget>
    with TickerProviderStateMixin {
  late Animation<double> animationBtnSpin;
  late AnimationController controllerAnimation;
  StreamController<int> controllerStream = StreamController<int>();
  late LuckyWheelModel luckyWheelData;
  String? initValueGift;
  Widget btnSpin = Container();
  int timeSpin = 10;
  ScreenshotController screenshotController = ScreenshotController();
  late Color colorSpin1;
  late Color colorSpin2;
  @override
  void initState() {
    super.initState();
    luckyWheelData = widget.luckyWheelData;
    _setAnimationBtnSpin();
    colorSpin1 = getHexToColor(luckyWheelData.color1);
    colorSpin2 = getHexToColor(luckyWheelData.color2);
  }

  getHexToColor(String? hex) {
    if (hex != null) {
      return ColorUtil.hexToColor(hex);
    }
    return Colors.white;
  }

  @override
  void didUpdateWidget(LuckyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if (widget.vouchers.length != oldWidget.vouchers.length) {
    //   listItem = widget.vouchers;
    // }
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
  void dispose() {
    controllerAnimation.dispose();
    controllerStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).width,
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/glow_fortune.png',
                  ),
                ),
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.93,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/mobile/mam.png'),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(27),
                  child: Stack(
                    children: [
                      FortuneWheel(
                        indicators: const [],
                        animateFirst: false,
                        selected: controllerStream.stream,
                        duration: Duration(seconds: timeSpin),
                        styleStrategy: FortuneBar.kDefaultStyleStrategy,
                        onAnimationEnd: () => ref
                            .read(luckyWheelViewModelProvider.notifier)
                            .showGiftResult(),
                        items: [
                          for (int i = 0;
                              i < luckyWheelData.luckyPrizeModel.length;
                              i++)
                            FortuneItem(
                                style: FortuneItemStyle(
                                  borderColor: Colors.black,
                                  borderWidth: 0,
                                  textAlign: TextAlign.center,
                                  color: i % 2 != 0 ? colorSpin1 : colorSpin2,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 35, bottom: 35, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      _showImageGift(
                                          item: luckyWheelData
                                              .luckyPrizeModel[i]),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      RotatedBox(
                                          quarterTurns: 1,
                                          child: _showNameGift(
                                              id: luckyWheelData
                                                      .luckyPrizeModel[i].id ??
                                                  '',
                                              index: i,
                                              context: context)),
                                    ],
                                  ),
                                )),
                        ],
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          var giftCode = ref.watch(luckyWheelViewModelProvider
                              .select((value) => value.gift?.prizeID));
                          if (giftCode == null) {
                            return const SizedBox();
                          }
                          return Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                _onSpinLuckyheel(giftCode);
                              },
                              behavior: HitTestBehavior.opaque,
                              child: SpinAnimaBtn(animation: animationBtnSpin),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final isShowGiftResult = ref.watch(luckyWheelViewModelProvider
                    .select((value) => value.isShowGiftResult));
                final gift = ref.watch(
                    luckyWheelViewModelProvider.select((value) => value.gift));

                if (isShowGiftResult == true) {
                  return TabResultSpin(
                    resultSpin: gift ?? GiftReceivedModel(),
                    screenshotController: screenshotController,
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ],
    );
  }

  Widget _showImageGift({required LuckyPrizeDataModel item}) {
    var wb = _imageVoucherWidget(url: item.prizeImage, size: 60);

    return wb;
  }

  Widget _imageVoucherWidget({
    required String url,
    required double size,
  }) {
    return RotatedBox(
        quarterTurns: 1,
        child: url.isNotEmpty
            ? Image.network(
                url,
                width: size,
                height: size,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
              )
            : const SizedBox());
  }

  void _onSpinLuckyheel(String id) async {
    final index = luckyWheelData.luckyPrizeModel.indexWhere((e) => e.id == id);
    controllerStream.add(index); // update item selected
  }

  Widget _showNameGift(
      {required String id, required int index, required BuildContext context}) {
    return Text(luckyWheelData.luckyPrizeModel[index].prizeName.toUpperCase(),
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: index % 2 == 0
                ? const Color(0x001bad6f).withOpacity(1)
                : Colors.white.withOpacity(1)));
  }
}
