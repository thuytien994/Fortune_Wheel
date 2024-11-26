import 'package:flutter/material.dart';
import 'package:flutter_application_1/lucky_wheel/view_model/lucky_wheel_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'components/components.dart';

class LuckyWheelDesktopPage extends ConsumerWidget {
//  final TextEditingController controllerName;
  final TextEditingController controllerPhone;
  const LuckyWheelDesktopPage({super.key, required this.controllerPhone});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/bgr_lucky_wheel.png',
              ),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final listGift = ref.watch(luckyWheelViewModelProvider
                      .select((value) => value.listGift));
                  final isLoading = ref.watch(luckyWheelViewModelProvider
                      .select((value) => value.isLoadingGift));
                  if (isLoading) {
                    return const CircularProgressIndicator();
                  }

                  if (listGift.isEmpty) {
                    return const CircularProgressIndicator();
                  }
                  return LuckyWidget(
                    vouchers: listGift,
                  );
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  final listGift = ref.watch(luckyWheelViewModelProvider
                      .select((value) => value.listGift));

                  final gift = ref.watch(luckyWheelViewModelProvider
                      .select((value) => value.gift));

                  if (listGift.isEmpty) {
                    return const SizedBox();
                  }

                  if (gift == null) {
                    controllerPhone.text = '';
                    return TabScreenSignIn(
                      //controllerName: controllerName,
                      controllerPhone: controllerPhone,
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
