import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/voucher_model.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;

final Uri _url = Uri.parse('https://flutter.dev');

class ReslutSpin extends StatelessWidget {
  final VoucherModel resultSpin;
  VoidCallback? onLoadWeb;

  ScreenshotController screenshotController;
  ReslutSpin({
    required this.resultSpin,
    this.onLoadWeb,
    required this.screenshotController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                'assets/images/gift-bgr.gif',
                width: 300,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Screenshot(
                    child: Column(
                      children: [
                        Text('Chúc mừng bạn: đã trúng',
                            overflow: TextOverflow.clip,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                        Text(
                          resultSpin.description ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w700),
                        ),
                        Image.network(
                          resultSpin.image ?? '',
                          width: 100,
                          height: 100,
                        ),
                      ],
                    ),
                    controller: screenshotController,
                  ),
                  GestureDetector(
                    onTap: () async {
                      double pixelRatio =
                          MediaQuery.of(context).devicePixelRatio;
                      screenshotController
                          .capture(pixelRatio: pixelRatio)
                          .then((image) async {
                        if (image != null) {
                          if (kIsWeb) {
                            final base64data = base64Encode(image.toList());

                            // then we create and AnchorElement with the html package
                            final a = html.AnchorElement(
                                href: 'data:image/jpeg;base64,$base64data');

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
                          FlutterToastr.show('Save successful', context);
                        }
                      }).catchError((onError) {
                        print('here $onError');
                      });
                    },
                    child: Container(
                      color: Colors.white,
                      child: Text(
                        'Luu anh',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w900, color: Colors.black),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber),
                        onPressed: () {},
                        child: Text('Quan tâm OA'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _launchUrl();
                        },
                        child: const Row(
                          children: [
                            Text('Ghé thăm Kengruop'),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.home)
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    print('tien');
    if (await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
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
}
