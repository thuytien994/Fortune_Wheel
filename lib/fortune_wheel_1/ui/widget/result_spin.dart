import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/fortune_wheel_1/data/model/voucher_model.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;

final Uri _urlZaloAo = Uri.parse('https://zalo.me/4584621595816857802');

final Uri _urlkenbar = Uri.parse('https://kenbar.vn/');
Map<int, String> codeVoucher = {20: 'VOUCHER50', 50: 'VOUCHER20'};
String descriptionVoucher = 'Áp dụng cho tất cả sản phẩm trà, cà phê...';

class ReslutSpin extends StatelessWidget {
  final GiftModel2 resultSpin;
  final VoidCallback? onLoadWeb;
  final String? valueBarcode;
  final VoidCallback onExit;

  final ScreenshotController screenshotController;
  ReslutSpin({
    required this.resultSpin,
    this.onLoadWeb,
    required this.screenshotController,
    this.valueBarcode,
    required this.onExit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // resultSpin.code = 'VOUCHER50';
    // resultSpin.voucherCode = 'hihi';
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
              // Positioned(
              //   top: 150,
              //   right: 50,
              //   child: GestureDetector(
              //     onTap: () => onExit(),
              //     child: Container(
              //       width: 30,
              //       height: 30,
              //       decoration: const BoxDecoration(
              //           shape: BoxShape.circle, color: Colors.white),
              //       child: const Icon(
              //         Icons.close,
              //         size: 25,
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // ),
              Image.asset(
                'assets/images/gift-bgr.gif',
                width: 300,
              ),
              _widgetImageScreenShot(context)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrlZaloOa() async {
    if (await launchUrl(_urlZaloAo)) {
      throw Exception('Could not launch $_urlZaloAo');
    }
  }

  Future<void> _launchUrlFLme() async {
    if (await launchUrl(_urlkenbar)) {
      throw Exception('Could not launch $_urlkenbar');
    }
  }

  showGiftCongralation() {
    return Stack(
      children: [
        Positioned(
          child: Image.asset(
            'assets/images/congrulation.gif',
            width: 100,
          ),
        ),
      ],
    );
  }

  _widgetImageScreenShot(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Screenshot(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                alignment: Alignment.center,
                child: Text(
                  'Chúc mừng bạn: ${resultSpin.userName}',
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              resultSpin.code == 'B0B5670B'
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '${resultSpin.description}' ?? '',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.amber,
                                fontWeight: FontWeight.w700,
                                fontSize: 25),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Nhận được ${resultSpin.description}' ?? '',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.amber,
                                fontWeight: FontWeight.w700,
                                fontSize: 25),
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              Image.network(
                resultSpin.image ?? '',
                width: 170,
                height: 170,
              ),
              resultSpin.voucherCode == null
                  ? SizedBox()
                  : Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Mã code của bạn là: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                ),
                                TextSpan(
                                  text: resultSpin.voucherCode,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.amber),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          descriptionVoucher,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                        )
                      ],
                    )
            ],
          ),
          controller: screenshotController,
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
        _btnSaveimage(context),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () => _launchUrlZaloOa(),
                child: const Text(
                  'Quan tâm OA',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: () => _launchUrlFLme(),
                child: const Row(
                  children: [
                    Text(
                      'Ghé Website',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _btnSaveimage(BuildContext context) {
    if (resultSpin.code == codeVoucher[20] ||
        resultSpin.code == codeVoucher[50]) {
      return GestureDetector(
        onTap: () async {
          _onSaveImageVoucher(context);
        },
        child: IntrinsicWidth(
          child: Container(
            constraints: const BoxConstraints(minWidth: 0),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Bấm lưu ảnh để nhận quà nhé: ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.downloading_sharp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    return SizedBox();
  }

  _onSaveImageVoucher(BuildContext context) {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    screenshotController.capture(pixelRatio: pixelRatio).then((image) async {
      if (image != null) {
        if (kIsWeb) {
          final base64data = base64Encode(image.toList());
          // then we create and AnchorElement with the html package
          final a =
              html.AnchorElement(href: 'data:image/jpeg;base64,$base64data');
          // set the name of the file we want the image to get
          // downloaded to
          a.download = 'download.jpg';
          // and we click the AnchorElement which downloads the image
          a.click();
          // finally we remove the AnchorElement
          a.remove();
        } else {
          var permission = await Permission.photos.request();
          if (permission.isGranted) {
            await ImageGallerySaverPlus.saveImage(image);
          }
        }
        FlutterToastr.show('Save successful', context, duration: 2);
      }
    }).catchError((onError) {
      print('here $onError');
    });
  }
}