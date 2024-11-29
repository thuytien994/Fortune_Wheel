import 'package:flutter/material.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_received_model.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/voucher_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screenshot/screenshot.dart';

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
                width: 200,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Screenshot(
                    controller: screenshotController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          alignment: Alignment.center,
                          child: Text(
                            'Chúc mừng bạn: ${resultSpin.orderName}',
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 50,
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
                                          fontSize: 45),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Nhận được: ${resultSpin.orderName}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 45),
                                ),
                              ),
                        const SizedBox(
                          height: 15,
                        ),
                        Image.network(
                          resultSpin.image ?? '',
                          width: 200,
                          height: 200,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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

                  const SizedBox(
                    height: 15,
                  ),
                  // GestureDetector(
                  //   onTap: () async {
                  //     // double pixelRatio =
                  //     //     MediaQuery.of(context).devicePixelRatio;
                  //     // screenshotController.capture(pixelRatio: pixelRatio).then(
                  //     //   (image) async {
                  //     //     SaveImageUtil.saveImageToGallery(
                  //     //       context: context,
                  //     //       image: image,
                  //     //     );
                  //     //   },
                  //     // );
                  //   },
                  //   child: IntrinsicWidth(
                  //     child: Container(
                  //       constraints: const BoxConstraints(minWidth: 0),
                  //       alignment: Alignment.center,
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 10, vertical: 5),
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: Row(
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: [
                  //           Text(
                  //             'Bấm lưu ảnh để nhận quà nhé: ',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodyLarge!
                  //                 .copyWith(
                  //                     fontSize: 25,
                  //                     fontWeight: FontWeight.w600,
                  //                     color: Colors.white),
                  //           ),
                  //           Container(
                  //             padding: const EdgeInsets.all(1),
                  //             decoration: const BoxDecoration(
                  //               color: Colors.white,
                  //               shape: BoxShape.circle,
                  //             ),
                  //             child: const Icon(
                  //               Icons.downloading_sharp,
                  //               color: Colors.black,
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  const SizedBox(
                    height: 30,
                  ),
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
