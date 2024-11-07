import 'package:flutter/material.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/voucher_model.dart';

class ReslutSpin extends StatelessWidget {
 final VoucherModel resultSpin;
  const ReslutSpin({required this.resultSpin,  super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.black.withOpacity(0.6),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/congrulation.gif',
                    width: 100,
                  ),
                  Container(
                    height: 150,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text('Chúc mừng bạn đã trúng',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white,
                                )),
                        Text(resultSpin.description??'',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.w700)),
                        Image.network(
                          resultSpin.image??'',
                          width: 100,
                          height: 100,
                        )
                      ],
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: Image.asset(
                      'assets/images/congrulation.gif',
                      width: 100,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
