import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k2pos_spin/lucky_wheel/data/model/gift_received_model.dart';
import 'package:screenshot/screenshot.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabResultSpin extends ConsumerStatefulWidget {
  final GiftReceivedModel resultSpin;
  final VoidCallback? onLoadWeb;
  final String? valueBarcode;
  final ScreenshotController screenshotController;
  const TabResultSpin({
    required this.resultSpin,
    this.onLoadWeb,
    required this.screenshotController,
    this.valueBarcode,
    super.key,
  });
  @override
  ConsumerState<TabResultSpin> createState() => _LuckyWidgetState();
}

class _LuckyWidgetState extends ConsumerState<TabResultSpin>
    with TickerProviderStateMixin {
  late Animation<double> animationSnow;
  late AnimationController controllerSnow;

  @override
  void initState() {
    super.initState();
    _setAnimationBtnSpin();
  }

  _setAnimationBtnSpin() {
    controllerSnow =
        AnimationController(duration: const Duration(seconds: 15), vsync: this);
    animationSnow =
        CurvedAnimation(parent: controllerSnow, curve: Curves.linear)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                controllerSnow.repeat();
              }
              // else if (status == AnimationStatus.dismissed) {
              //   controllerSnow.forward();
              // }
            },
          );

    controllerSnow.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        // image: const DecorationImage(
        //     fit: BoxFit.fill,
        //     image: AssetImage('assets/images/gif_snow2.gif'),
        //     scale: 1),
      ),
      alignment: Alignment.center,
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 40.r,
              top: 5.r,
              child: Image.asset(
                'assets/images/gif_fireword_2.gif',
                width: 500.r,
                height: 500.r,
              ),
            ),
            Positioned(
              right: 40.r,
              top: 5.r,
              child: Image.asset(
                'assets/images/gif_fireword_2.gif',
                width: 500.r,
                height: 500.r,
              ),
            ),
            Image.asset(
              'assets/mobile/gift-bgr.gif',
              width: 700.r,
              height: 700.r,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Screenshot(
                  controller: widget.screenshotController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          alignment: Alignment.center,
                          child: RichText(
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: 'Chúc mừng bạn: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 15.sp,
                                        color: Colors.white,
                                      ),
                                ),
                                TextSpan(
                                  text: (widget.resultSpin.customerName)
                                          ?.toUpperCase() ??
                                      '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 15.sp,
                                        color: Colors.red,
                                      ),
                                )
                              ]))),
                      const SizedBox(
                        height: 8,
                      ),
                      widget.resultSpin.kenbarVoucherId == 'B0B5670B'
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                '${widget.resultSpin.orderName}',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp),
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Nhận được: ${widget.resultSpin.gift}',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp),
                              ),
                            ),
                      const SizedBox(
                        height: 15,
                      ),
                      Image.network(
                        widget.resultSpin.image ?? '',
                        width: 250.r,
                        height: 250.r,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.r,
                ),
                // SizedBox(
                //   width: 200,
                //   height: 50,
                //   child: SfBarcodeGenerator(
                //     symbology: Code128(),
                //     barColor: Colors.black,
                //     backgroundColor: Colors.white,
                //     textStyle: const TextStyle(
                //       fontSize: 80,
                //     ),
                //     value: resultSpin.giftCode,
                //   ),
                // ),

                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.white,
                //   ),
                //   onPressed: ref
                //       .read(luckyWheelViewModelProvider.notifier)
                //       .reloadPageLuckWheel,
                //   child: Padding(
                //     padding: const EdgeInsets.all(6.0),
                //     child: Text(
                //       'Quay tiếp',
                //       textAlign: TextAlign.center,
                //       style:
                //           Theme.of(context).textTheme.displaySmall!.copyWith(
                //                 fontSize: 30,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.black,
                //               ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
