import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/fortune_wheel/data/model/voucher_model.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

List<String> codeVoucher = [' VOUCHER50', 'VOUCHER20,'];
Map<String, String> mapVoucher = {
  'VOUCHER50': 'Áp dụng cho tất cả sản phẩm trà, cà phê...',
  'VOUCHER20': ''
};
String description = 'Áp dụng cho tất cả sản phẩm trà, cà phê...';

class SpinWidget extends StatelessWidget {
  final StreamController<int> controllerStream;
  final List<VoucherModel> items;

  const SpinWidget(
      {required this.controllerStream, required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return FortuneWheel(
      indicators: [],
      animateFirst: false,
      selected: controllerStream.stream,
      duration: const Duration(seconds: 20),
      //     rotationCount: 10,
      styleStrategy: FortuneBar.kDefaultStyleStrategy,
      items: [
        for (int i = 0; i < items.length; i++)
          FortuneItem(
            style: FortuneItemStyle(
              borderColor: const Color(0x9E681A).withOpacity(1),
              borderWidth: 2,
              textAlign: TextAlign.center,
              color: _color(code: items[i].code ?? '', index: i),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: RotatedBox(
                      quarterTurns: 1,
                      child: _showNameGift(
                          code: items[i].code ?? '',
                          index: i,
                          context: context)),
                ),
                _showImageGift(item: items[i])
              ],
            ),
          ),
      ],
    );
  }

  _showImageGift({required VoucherModel item}) {
    var wb =
        _imageVoucherDiscount(url: item.image ?? '', size: 45, position: 55);

    switch (item.code) {
      case 'VOUCHER50' || 'VOUCHER20':
        {
          return wb = _imageVoucherDiscount(
              url: item.image ?? '', size: 29, position: 70);
        }
    }
    return wb;
  }

  _imageVoucherDiscount(
      {required String url, required double size, required double position}) {
    return Positioned(
        right: position,
        child: RotatedBox(
            quarterTurns: 1,
            child: Image.network(
              url,
              width: size,
              height: size,
            )));
  }

  Color _color({required String code, required int index}) {
    switch (code) {
      case 'VOUCHER50':
        {
          return Colors.amber;
        }
      case 'VOUCHER20':
        {
          return Colors.amber;
        }
    }
    return index % 2 == 0
        ? const Color(0x265EA9).withOpacity(1)
        : Colors.white.withOpacity(1);
  }

  Widget _showNameGift(
      {required String code,
      required int index,
      required BuildContext context}) {
    Widget widget = Container();
    switch (code) {
      case 'VOUCHER50':
        {
          widget = _loadTextImageDiscount(
              url: 'assets/images/discount-50.png',
              index: index,
              context: context);
          break;
        }
      case 'VOUCHER20':
        widget = _loadTextImageDiscount(
            url: 'assets/images/discount20.png',
            index: index,
            context: context);
        break;
      default:
        widget = Container(
          padding: const EdgeInsets.only(top: 4),
          width: 65,
          child: Text(
            items[index].giftDescription ?? '',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: index % 2 != 0
                  ? const Color(0x265EA9).withOpacity(1)
                  : Colors.white.withOpacity(1),
            ),
          ),
        );
    }

    return widget;
  }

  Widget _loadTextImageDiscount(
      {required String url,
      required int index,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            color: const Color(0x265EA9).withOpacity(1),
            url,
            width: 58,
            height: 40,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 53,
            child: Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 5, color: Color(0x265EA9).withOpacity(1)),
            ),
          )
        ],
      ),
    );
  }
}
