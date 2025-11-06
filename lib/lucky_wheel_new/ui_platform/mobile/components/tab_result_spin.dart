import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k2pos_spin/lucky_wheel_new/data/model/gift_received_model.dart';
import 'package:k2pos_spin/lucky_wheel_new/view_model/lucky_wheel_view_model.dart';
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
                                  text: (widget.resultSpin.userName)
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Nhận được: ${widget.resultSpin.prizeName}',
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
                        widget.resultSpin.prizeImage,
                        width: 250.r,
                        height: 250.r,
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.r,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Theo dõi kenbar: ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: "Tại đây",
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            ref
                                .read(luckyWheelViewModelProvider.notifier)
                                .launchUrlWeb("https://kenbar.vn/");
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
