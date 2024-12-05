import 'dart:math';

import 'package:flutter/material.dart';

class SnowFillingAnima extends AnimatedWidget {
  const SnowFillingAnima({
    super.key,
    required Animation<double> animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final width =
        Tween<double>(begin: 0, end: MediaQuery.sizeOf(context).width);
    final height =
        Tween<double>(begin: 0, end: MediaQuery.sizeOf(context).height);
    final animation = listenable as Animation<double>;
    _showWidget() {
      return Container(
        height: 50,
        width: 50,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
      );
    }

    List<Widget> listItem = List<Widget>.generate(
      10,
      (index) => _showWidget(),
    );

    return Stack(
      children: listItem.map(
        (e) {
          return Positioned(
              top: width.evaluate(animation),
              left: height.evaluate(animation),
              child: e);
        },
      ).toList(),
    );
  }
}
