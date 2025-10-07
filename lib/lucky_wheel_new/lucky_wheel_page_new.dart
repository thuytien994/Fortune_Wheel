import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k2pos_spin/lucky_wheel_new/view_model/lucky_wheel_view_model.dart';
import 'package:k2pos_spin/responsive_layout.dart';
import 'ui_platform/desktop/lucky_wheel_desktop_page.dart';
import 'ui_platform/mobile/lucky_wheel_mobile_page.dart';

class LuckyWheelPageNew extends ConsumerStatefulWidget {
  final int shopId;
  final String orderCode;
  const LuckyWheelPageNew(
      {super.key, required this.shopId, required this.orderCode});

  @override
  LuckyWheelPageState createState() => LuckyWheelPageState();
}

class LuckyWheelPageState extends ConsumerState<LuckyWheelPageNew>
    with AutomaticKeepAliveClientMixin {
  // TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(luckyWheelViewModelProvider.notifier).setShopId(widget.shopId);
      ref.read(luckyWheelViewModelProvider.notifier).init();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ResponsiveLayout(
      mobileLayout: LuckyWheelMobilePage(
        orderCode: widget.orderCode,
      ),
      tabletLayout: LuckyWheelDesktopPage(
        //   controllerName: controllerName,
        controllerPhone: controllerPhone,
        orderCode: widget.orderCode,
      ),
      desktopLayout: LuckyWheelDesktopPage(
        controllerPhone: controllerPhone,
        orderCode: widget.orderCode,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
