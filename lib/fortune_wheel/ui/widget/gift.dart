import 'package:flutter/material.dart';

class Gift extends StatelessWidget {
  final String item;
  const Gift({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
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
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  color: Colors.amber,
                  child:
                      Text(item, style: Theme.of(context).textTheme.bodyLarge),
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
