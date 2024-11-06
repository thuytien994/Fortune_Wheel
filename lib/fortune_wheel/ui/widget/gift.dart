import 'package:flutter/material.dart';

class Gift extends StatelessWidget {
  final String item;
  final String image;
  const Gift({required this.item, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.black.withOpacity(0.5),
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
                        Text(item,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.w700)),
                        Image.network(
                          image,
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
          //  left: MediaQuery.sizeOf(context).width,
          child: Image.asset(
            'assets/images/congrulation.gif',
            width: 100,
          ),
        ),
        //   Image.asset('assets/images/gift-bgr.gif')
      ],
    );
  }
}
