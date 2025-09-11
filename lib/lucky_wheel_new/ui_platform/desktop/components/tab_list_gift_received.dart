import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/lucky_wheel_new/data/model/gift_received_model.dart';
import 'package:flutter_application_1/lucky_wheel_new/ui_platform/desktop/components/animated_widget.dart/show_gift_received.dart';
import 'package:flutter_application_1/lucky_wheel_new/view_model/lucky_wheel_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabListGiftReceived extends StatefulWidget {
  final List<GiftReceivedModel> gifts;
  const TabListGiftReceived({super.key, required this.gifts});

  @override
  State<TabListGiftReceived> createState() => _TabListGiftReceivedState();
}

class _TabListGiftReceivedState extends State<TabListGiftReceived>
    with TickerProviderStateMixin {
  List<GiftReceivedModel> _gifts = [];
  late Animation<double> animationBtnSpin;
  late AnimationController controllerAnimation;

  final ValueNotifier<GiftReceivedModel?> _giftReceivedNotifier =
      ValueNotifier<GiftReceivedModel?>(null);

  ValueNotifier<GiftReceivedModel> showGift =
      ValueNotifier<GiftReceivedModel>(GiftReceivedModel());

  @override
  initState() {
    super.initState();
    _gifts = widget.gifts;
    _setAnimationBtnSpin();
  }

  @override
  void didUpdateWidget(covariant TabListGiftReceived oldWidget) {
    if (oldWidget.gifts.length != widget.gifts.length) {
      _gifts = widget.gifts;
      _onShowGiftReceived();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onShowGiftReceived() async {
    for (int i = 0; i < _gifts.length; i++) {
      _giftReceivedNotifier.value = _gifts[i];
      await controllerAnimation.forward();
      Future.delayed(const Duration(milliseconds: 2000), () async {});
      await Future.delayed(
        const Duration(milliseconds: 2000),
      );
      await controllerAnimation.reverse();
      if (i == _gifts.length - 1) {
        i = 0;
      }
    }
  }

  _setAnimationBtnSpin() {
    controllerAnimation =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animationBtnSpin =
        CurvedAnimation(parent: controllerAnimation, curve: Curves.linear);

    controllerAnimation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        List<GiftReceivedModel> listItem =
            ref.watch(luckyWheelViewModelProvider.select(
          (value) => value.listGiftReceived,
        ));
        if (listItem.isNotEmpty) {
          return ValueListenableBuilder(
              valueListenable: _giftReceivedNotifier,
              builder: (context, value, child) {
                return value == null ? const SizedBox() : item2(value);
              });
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget item2(GiftReceivedModel gift) {
    showGift.value
      ..userName = gift.userName
      ..prizeName = gift.prizeName
      ..prizeImage = gift.prizeImage
      ..phoneNumber = gift.phoneNumber;

    return SizedBox(
      child: ValueListenableBuilder(
        valueListenable: showGift,
        builder: (context, value, child) =>
            ShowGiftReceived(animation: animationBtnSpin, gift: showGift.value),
      ),
    );
  }
}
