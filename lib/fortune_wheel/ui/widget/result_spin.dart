import 'package:flutter/material.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/voucher_model.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

class ReslutSpin extends StatelessWidget {
  final VoucherModel resultSpin;
  VoidCallback? launchUrl;
  ReslutSpin({
    required this.resultSpin,
    this.launchUrl,
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
                  Text('Chúc mừng bạn: đã trúng',
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                  Text(resultSpin.description ?? '',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.amber, fontWeight: FontWeight.w700)),
                  Image.network(
                    resultSpin.image ?? '',
                    width: 100,
                    height: 100,
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
    await canLaunchUrl(_url);
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
