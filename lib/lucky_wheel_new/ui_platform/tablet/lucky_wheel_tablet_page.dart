import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k2pos_spin/lucky_wheel_new/view_model/lucky_wheel_view_model.dart';
import 'components/components.dart';

class LuckyWheelTabletPage extends ConsumerWidget {
  // final TextEditingController controllerName;
  final TextEditingController controllerPhone;
  const LuckyWheelTabletPage({super.key, required this.controllerPhone});
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
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/bgr_lucky_wheel.png',
                    ),
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
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (listGift.isEmpty) {
                      return const Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return Text("");
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
                  return const SizedBox.shrink();
                }

                if (gift == null) {
                  controllerPhone.text = '';
                  return TabScreenSignIn(
                    controllerPhone: controllerPhone,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
