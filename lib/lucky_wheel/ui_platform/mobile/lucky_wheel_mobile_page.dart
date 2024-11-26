import 'package:flutter/material.dart';
import 'package:flutter_application_1/lucky_wheel/view_model/lucky_wheel_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'components/components.dart';

class LuckyWheelMobilePage extends ConsumerWidget {
  final TextEditingController controllerPhone;

  const LuckyWheelMobilePage({
    super.key,
    required this.controllerPhone,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/bgr_mobile_forwheel.png'),
                  ),
                ),
                child: Consumer(
                  builder: (context, ref, child) {
                    final listGift = ref.watch(luckyWheelViewModelProvider
                        .select((value) => value.listGift));
                    final isLoading = ref.watch(luckyWheelViewModelProvider
                        .select((value) => value.isLoadingGift));
                    if (isLoading) {
                      return const Center(
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator()),
                      );
                    }

                    if (listGift.isEmpty) {
                      return const Center(
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator()),
                      );
                    }
                    return LuckyWidget(
                      vouchers: listGift,
                    );
                  },
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final listGift = ref.watch(luckyWheelViewModelProvider
                    .select((value) => value.listGift));

                final gift = ref.watch(
                    luckyWheelViewModelProvider.select((value) => value.gift));

                if (listGift.isEmpty) {
                  return const SizedBox();
                }
                if (gift == null) {
                  controllerPhone.text = '';
                  return TabScreenSignIn(
                    controllerPhone: controllerPhone,
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
