import 'package:flutter/material.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_received_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screenshot/screenshot.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabResultSpin extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.black.withOpacity(0.6),
      alignment: Alignment.center,
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/mobile/gift-bgr.gif',
                width: 500.r,
                height: 500.r,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Screenshot(
                    controller: screenshotController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          alignment: Alignment.center,
                          child: Text(
                            'Chúc mừng bạn: ${resultSpin.customerName ?? 'Thuy Tien'}',
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        resultSpin.kenbarVoucherId == 'B0B5670B'
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  '${resultSpin.orderName}',
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
                                  'Nhận được: ${resultSpin.gift}',
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
                          resultSpin.image ?? '',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
