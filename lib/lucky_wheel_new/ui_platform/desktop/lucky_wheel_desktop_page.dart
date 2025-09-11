import 'package:flutter/material.dart';
import 'package:flutter_application_1/lucky_wheel_new/ui_platform/desktop/components/lucky_widget.dart';
import 'package:flutter_application_1/lucky_wheel_new/ui_platform/desktop/components/tab_list_gift_received.dart';
import 'package:flutter_application_1/lucky_wheel_new/view_model/lucky_wheel_view_model.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'components/components.dart';

class LuckyWheelDesktopPage extends ConsumerWidget {
//  final TextEditingController controllerName;
  final TextEditingController controllerPhone;

  const LuckyWheelDesktopPage({super.key, required this.controllerPhone});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final luckyWheel = ref
        .watch(luckyWheelViewModelProvider.select((value) => value.luckyWheel));

    ImageProvider backgroundImage = const AssetImage(
      'assets/images/bgr_lucky_wheel.png',
    );
    if (luckyWheel?.backgroundImage != null) {
      backgroundImage = NetworkImage(luckyWheel!.backgroundImage!);
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: backgroundImage,
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
              // Consumer(
              //   builder: (context, ref, child) {
              //     final listGift = ref.watch(luckyWheelViewModelProvider
              //         .select((value) => value.listGift));

              //     final gift = ref.watch(luckyWheelViewModelProvider
              //         .select((value) => value.gift));

              //     print('hear UI ${gift}');
              //     if (listGift.isEmpty) {
              //       return const SizedBox();
              //     }

              //     if (gift == null) {
              //       controllerPhone.text = '';
              //       return TabScreenSignIn(
              //         //controllerName: controllerName,
              //         controllerPhone: controllerPhone,
              //       );
              //     }
              //     return const SizedBox();
              //   },
              // ),
              Positioned(
                bottom: 40,
                left: 40,
                child: Consumer(builder: (context, ref, child) {
                  return TabListGiftReceived(
                    gifts: ref.watch(luckyWheelViewModelProvider.select(
                      (value) => value.listGiftReceived,
                    )),
                  );
                }),
              ),
              Consumer(
                builder: (context, ref, child) {
                  return BarcodeKeyboardListener(
                    bufferDuration: const Duration(milliseconds: 200),
                    onBarcodeScanned: (barcode) {
                      //    if (!visible.value) return;
                      var isCheckBarcode =
                          ref.watch(luckyWheelViewModelProvider.select(
                        (value) => value.isCheckBarcode,
                      ));
                      if (isCheckBarcode == false) {
                        return ref
                            .read(luckyWheelViewModelProvider.notifier)
                            .getBarcode(barcode);
                      }
                      return;
                    },
                    child: const SizedBox.shrink(),
                  );
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  var messageError =
                      ref.watch(luckyWheelViewModelProvider.select(
                    (value) => value.errorMessage,
                  ));
                  if (messageError == null) {
                    return const SizedBox.shrink();
                  }
                  return Positioned(
                    top: MediaQuery.sizeOf(context).height * 0.08,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        messageError,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.black, fontSize: 30),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
