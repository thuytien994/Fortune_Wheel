import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/lucky_wheel_new/data/model/gift_received_model.dart';
import 'package:flutter_application_1/lucky_wheel_new/view_model/lucky_wheel_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

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
      width: MediaQuery.sizeOf(context).width,
      alignment: Alignment.center,
      color: Colors.black.withOpacity(0.6),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Image.asset(
              'assets/mobile/gift-bgr.gif',
              width: 100,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Screenshot(
                controller: screenshotController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      alignment: Alignment.center,
                      child: Text(
                        resultSpin.userName != null
                            ? 'Chúc mừng bạn ${resultSpin.userName}'
                            : "Chúc mừng bạn quay trúng",
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    resultSpin.prizeImage.isNotEmpty
                        ? SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.network(
                              resultSpin.prizeImage,
                              width: 80,
                              height: 80,
                              errorBuilder: (context, error, stackTrace) =>
                                  const SizedBox.shrink(),
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer(
                builder: (context, ref, child) {
                  String? infoGift;
                  var luckySpin = ref.watch(luckyWheelViewModelProvider
                      .select((value) => value.luckyWheel));

                  if (luckySpin?.byLink() == true) {
                    return const SizedBox();
                  }

                  if (luckySpin?.byInputNumberPhone() == true) {
                    infoGift = resultSpin.phoneNumber;
                  } else {
                    infoGift = resultSpin.invoiceCode;
                  }

                  return SizedBox(
                    width: 200,
                    height: 50,
                    child: SfBarcodeGenerator(
                      symbology: Code128(),
                      barColor: Colors.black,
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 80,
                      ),
                      value: infoGift,
                    ),
                  );
                },
              ),

              const SizedBox(
                height: 15,
              ),
              // GestureDetector(
              //   onTap: () async {
              //     // double pixelRatio = MediaQuery.of(context).devicePixelRatio;
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
              //       padding:
              //           const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       child: Row(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           Text(
              //             'Bấm lưu ảnh để nhận quà nhé: ',
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .bodyLarge!
              //                 .copyWith(
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
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Theo dõi kenbar: ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "Tại đây",
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
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
              const SizedBox(
                height: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
