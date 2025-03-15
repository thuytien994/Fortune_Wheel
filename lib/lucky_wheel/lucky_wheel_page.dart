import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/lucky_wheel/view_model/lucky_wheel_view_model.dart';
import 'package:flutter_application_1/responsive_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui_platform/desktop/lucky_wheel_desktop_page.dart';

class LuckyWheelPage extends ConsumerStatefulWidget {
  final int shopId;
  const LuckyWheelPage({super.key, required this.shopId});

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

  connect() async {}

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
      mobileLayout: const Center(
        child: Text(
          "Chưa hỗ trợ cho màn hình nhỏ",
          style: TextStyle(fontSize: 16),
        ),
      ),
      tabletLayout: LuckyWheelDesktopPage(
        //   controllerName: controllerName,

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
