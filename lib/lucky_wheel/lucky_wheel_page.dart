import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k2pos_spin/lucky_wheel_new/view_model/lucky_wheel_view_model.dart';
import 'package:k2pos_spin/responsive_layout.dart';
import 'ui_platform/desktop/lucky_wheel_desktop_page.dart';
import 'ui_platform/mobile/lucky_wheel_mobile_page.dart';

class LuckyWheelPage extends ConsumerStatefulWidget {
  final int shopId;
  final String orderCode;
  const LuckyWheelPage(
      {super.key, required this.shopId, required this.orderCode});

  @override
  LuckyWheelPageState createState() => LuckyWheelPageState();
}

class LuckyWheelPageState extends ConsumerState<LuckyWheelPage>
    with AutomaticKeepAliveClientMixin {
  // TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      ref.read(luckyWheelViewModelProvider.notifier).init();

      ref.read(luckyWheelViewModelProvider.notifier).setShopId(widget.shopId);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controllerPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ResponsiveLayout(
      mobileLayout: LuckyWheelMobilePage(
        controllerPhone: TextEditingController(),
      ),
      tabletLayout: LuckyWheelDesktopPage(
        //   controllerName: controllerName,8936123375881

        controllerPhone: controllerPhone,
      ),
      desktopLayout: LuckyWheelDesktopPage(
        controllerPhone: controllerPhone,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
