import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/lucky_wheel/ui_platform/mobile/lucky_wheel_mobile_page.dart';
import 'package:flutter_application_1/lucky_wheel/view_model/lucky_wheel_view_model.dart';
import 'package:flutter_application_1/responsive_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui_platform/desktop/lucky_wheel_desktop_page.dart';

class LuckyWheelPage extends ConsumerStatefulWidget {
  const LuckyWheelPage({super.key});

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

      ref.read(luckyWheelViewModelProvider.notifier).getListGiftReceived();
    });
  }

  connect() async {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    //ref.read(luckyWheelViewModelProvider.notifier).disposeController();
    controllerPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ResponsiveLayout(
      mobileLayout: LuckyWheelMobilePage(
        //  controllerName: controllerName,
        controllerPhone: controllerPhone,
      ),
      tabletLayout: LuckyWheelDesktopPage(
        //   controllerName: controllerName,
        controllerPhone: controllerPhone,
      ),
      desktopLayout: LuckyWheelDesktopPage(
        //     controllerName: controllerName,
        controllerPhone: controllerPhone,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
