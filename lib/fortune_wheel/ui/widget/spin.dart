import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/voucher_model.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class SpinWidget extends StatelessWidget {
  final StreamController<int> controllerStream;
  final List<VoucherModel> items;
  //final List<String> items;
  const SpinWidget(
      {required this.controllerStream, required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return FortuneWheel(
      indicators: [],
      animateFirst: false,
      selected: controllerStream.stream,
      duration: const Duration(seconds: 2),
      rotationCount: 3,
      styleStrategy: FortuneBar.kDefaultStyleStrategy,
      items: [
        for (int i = 0; i < items.length; i++)
          FortuneItem(
            style: FortuneItemStyle(
                borderColor: const Color(0x9E681A).withOpacity(1),
                borderWidth: 5,
                textAlign: TextAlign.center,
                color: i % 2 == 0
                    ? Color(0x265EA9).withOpacity(1)
                    : Colors.white.withOpacity(1)),
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        items[i].description ?? '',
                        style: TextStyle(
                            fontSize: 12,
                            color: i % 2 != 0
                                ? const Color(0x265EA9).withOpacity(1)
                                : Colors.white.withOpacity(1)),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 20,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Image.network(
                          items[i].image ?? '',
                          width: 45,
                          height: 45,
                        ),
                      )),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
