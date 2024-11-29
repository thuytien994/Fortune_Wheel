import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_received_model.dart';
import 'package:flutter_application_1/lucky_wheel/ui_platform/desktop/components/animated_widget.dart/show_gift_received.dart';
import 'package:flutter_application_1/lucky_wheel/view_model/lucky_wheel_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabListGiftReceived extends ConsumerStatefulWidget {
  const TabListGiftReceived({super.key});

  @override
  ConsumerState<TabListGiftReceived> createState() =>
      _TabListGiftReceivedState();
}

class _TabListGiftReceivedState extends ConsumerState<TabListGiftReceived>
    with TickerProviderStateMixin {
  late Animation<double> animationBtnSpin;
  late AnimationController controllerAnimation;
  ValueNotifier<List<String>> listItem =
      ValueNotifier<List<String>>(['1', '2', '3', '4', '5', '6', '7']);

  ValueNotifier<Widget> infoGiftWidget = ValueNotifier<Widget>(Container());
  ValueNotifier<GiftReceivedModel> showGift =
      ValueNotifier<GiftReceivedModel>(GiftReceivedModel());
  @override
  initState() {
    super.initState();

    _setAnimationBtnSpin();
  }

  _setAnimationBtnSpin() {
    controllerAnimation =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animationBtnSpin =
        CurvedAnimation(parent: controllerAnimation, curve: Curves.linear)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                Future.delayed(const Duration(milliseconds: 2000), () async {
                  controllerAnimation.reverse();
                });
              } else if (status == AnimationStatus.dismissed) {
                Future.delayed(const Duration(milliseconds: 2000), () async {
                  await controllerAnimation.forward();
                });
              }
            },
          );

    controllerAnimation.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      width: MediaQuery.sizeOf(context).height * 0.4,
      padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24, top: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white.withOpacity(0.8),
          border: Border.all(width: 0.5)),
      alignment: Alignment.centerRight,
      child: Consumer(
        builder: (context, ref, child) {
          List<GiftReceivedModel> listItem =
              ref.watch(luckyWheelViewModelProvider.select(
            (value) => value.listGiftReceived,
          ));

          print('here listItem.len:  ${listItem.length}');
          if (listItem.isNotEmpty) {
            for (int i = 0; i < listItem.length; i++) {
              Future.delayed(const Duration(milliseconds: 2000), () async {
                infoGiftWidget.value = item2(listItem[i]);
              });
              return ValueListenableBuilder(
                  valueListenable: infoGiftWidget,
                  builder: (context, value, child) => infoGiftWidget.value);
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void item(List<GiftReceivedModel> listItem) {}

  item2(GiftReceivedModel gift) {
    print('nameGift1: ${gift.customerName}');
    showGift.value
      ..customerName = gift.customerName
      ..gift = gift.gift
      ..image = gift.image
      ..phoneNumber = gift.phoneNumber;

    return Container(
      child: ValueListenableBuilder(
          valueListenable: showGift,
          builder: (context, value, child) => ShowGiftReceived(
              animation: animationBtnSpin, gift: showGift.value)),
    );
  }
}
