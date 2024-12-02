import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_received_model.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_model.dart';
import 'package:flutter_application_1/lucky_wheel/view_model/lucky_wheel_view_model.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';
import 'components.dart';

class LuckyWidget extends ConsumerStatefulWidget {
  final List<GiftModel> vouchers;
  const LuckyWidget({
    super.key,
    required this.vouchers,
  });

  @override
  ConsumerState<LuckyWidget> createState() => _LuckyWidgetState();
}

class _LuckyWidgetState extends ConsumerState<LuckyWidget>
    with TickerProviderStateMixin {
  late Animation<double> animationBtnSpin;
  late AnimationController controllerAnimation;
  var controllerStream = StreamController<int>();
  GiftReceivedModel? spinResult;
  List<GiftModel> listItem = [];
  Widget btnSpin = Container();
  int timeSpin = 15;
  ScreenshotController screenshotController = ScreenshotController();
  bool onSpinLuckyheel = false;
  @override
  void initState() {
    super.initState();
    listItem = widget.vouchers;
    _setAnimationBtnSpin();
    ServicesBinding.instance.keyboard.addHandler(_handlerBoardKey);
  }

  bool _handlerBoardKey(KeyEvent event) {
    var result = ref.watch(luckyWheelViewModelProvider);
    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
      if (result.gift != null &&
          result.isSpinLuckyheel == false &&
          result.isCheckBarcode == false) {
        _onSpinLuckyheel();
      }
    }
    if (event is KeyDownEvent && event.logicalKey != LogicalKeyboardKey.enter) {
      return false;
    }

    return true;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(LuckyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.vouchers.length != oldWidget.vouchers.length) {
      listItem = widget.vouchers;
    }
    // if (widget.initValueGift != oldWidget.initValueGift) {
    //   initValueGift = widget.initValueGift;
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

    ServicesBinding.instance.keyboard.removeHandler(_handlerBoardKey);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var result = ref.watch(luckyWheelViewModelProvider);

    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.05,
            right: MediaQuery.sizeOf(context).height * 0.1,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.8,
              width: MediaQuery.sizeOf(context).height * 0.8,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/mam.png'),
                    fit: BoxFit.contain),
              ),
              child: Padding(
                padding: EdgeInsets.all(38.r),
                child: Stack(
                  children: [
                    Positioned(
                      child: FortuneWheel(
                        indicators: const [],
                        animateFirst: false,
                        selected: controllerStream.stream,
                        duration: Duration(seconds: timeSpin),
                        styleStrategy: FortuneBar.kDefaultStyleStrategy,
                        rotationCount: timeSpin,
                        onAnimationEnd: () {
                          ref
                              .read(luckyWheelViewModelProvider.notifier)
                              .showGiftResult();
                          ref
                              .read(luckyWheelViewModelProvider.notifier)
                              .getListGiftReceived();
                          ref
                              .read(luckyWheelViewModelProvider.notifier)
                              .setOnCheckBarcode();
                        },
                        items: [
                          for (int i = 0; i < listItem.length; i++)
                            FortuneItem(
                                style: FortuneItemStyle(
                                  borderColor: Colors.black,
                                  borderWidth: 0,
                                  textAlign: TextAlign.center,
                                  color: i % 2 != 0
                                      ? const Color(0x02C731).withOpacity(1)
                                      : const Color(0xFFF97F).withOpacity(1),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 50.r, bottom: 50.r, right: 0.r),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Container(
                                        alignment: Alignment.centerRight,
                                        child:
                                            _showImageGift(item: listItem[i]),
                                      )),
                                      RotatedBox(
                                          quarterTurns: 1,
                                          child: _showNameGift(
                                              giftDescription:
                                                  listItem[i].giftDescription ??
                                                      '',
                                              code: listItem[i].id ?? 0,
                                              index: i,
                                              context: context)),
                                    ],
                                  ),
                                )

                                // Stack(
                                //   alignment: Alignment.center,
                                //   children: [
                                //     Align(
                                //       alignment: Alignment.centerRight,
                                //       child: RotatedBox(
                                //           quarterTurns: 1,
                                //           child: _showNameGift(
                                //               giftDescription: listItem[i]
                                //                       .giftDescription ??
                                //                   '',
                                //               code: listItem[i].id ?? 0,
                                //               index: i,
                                //               context: context)),
                                //     ),
                                //     _showImageGift(item: listItem[i])
                                //   ],
                                // ),
                                ),
                        ],
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        var data = ref.watch(luckyWheelViewModelProvider.select(
                          (value) => value.gift,
                        ));
                        if (data == null) {
                          return const SizedBox.shrink();
                        }
                        return Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: _onSpinLuckyheel,
                            behavior: HitTestBehavior.opaque,
                            child: SpinAnimaBtn(animation: animationBtnSpin),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final isShowGiftResult = ref.watch(
                luckyWheelViewModelProvider
                    .select((value) => value.isShowGiftResult),
              );

              if (isShowGiftResult) {
                return TabResultSpin(
                  resultSpin: result.gift ?? GiftReceivedModel(),
                  screenshotController: screenshotController,
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  _showImageGift({required GiftModel item}) {
    var wb = _showImageVoucher(
      url: item.image ?? '',
      size: 75.r,
    );

    switch (item.id) {
      case 'B0B5670B': // mayman
        {
          return wb = _showImageVoucher(url: item.image ?? '', size: 50);
        }
      case 'B0B554C0': // ly kenbar
        {
          return wb = _showImageVoucher(url: item.image ?? '', size: 90);
        }
    }
    return wb;
  }

  _showImageVoucher({
    required String url,
    required double size,
  }) {
    return RotatedBox(
        quarterTurns: 1,
        child: Image.network(
          url,
          width: size,
          height: size,
        ));
  }

  _onSpinLuckyheel() async {
    var id = ref.watch(luckyWheelViewModelProvider).gift?.kenbarVoucherId;
    print('hear gift recieved:  ${id}');
    final index = listItem.indexWhere((e) => e.id == id);
    print('here idSpin : $index');
    controllerStream.add(index); // update item selected
    ref.read(luckyWheelViewModelProvider.notifier).onSpinLuckyheel();
  }

  Widget _showNameGift(
      {required int code,
      required int index,
      required String giftDescription,
      required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(top: 15.r),
      child: Text((giftDescription).toUpperCase(),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 5.5.sp,
              fontWeight: FontWeight.bold,
              color: index % 2 == 0
                  ? const Color(0x1BAD6F).withOpacity(1)
                  : Colors.white.withOpacity(1))),
    );
  }
}
