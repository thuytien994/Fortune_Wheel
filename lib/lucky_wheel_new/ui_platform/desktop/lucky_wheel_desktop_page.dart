import 'package:flutter/material.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k2pos_spin/lucky_wheel_new/view_model/lucky_wheel_view_model.dart';
import 'components/components.dart';

class LuckyWheelDesktopPage extends ConsumerStatefulWidget {
  final TextEditingController controllerPhone;
  final String orderCode;

  const LuckyWheelDesktopPage({
    super.key,
    required this.controllerPhone,
    required this.orderCode,
  });
  @override
  ConsumerState<LuckyWheelDesktopPage> createState() =>
      _LuckyWheelDesktopPageState();
}

class _LuckyWheelDesktopPageState extends ConsumerState<LuckyWheelDesktopPage> {
  ImageProvider backgroundImage = const AssetImage(
    'assets/images/bgr_lucky_wheel.png',
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Consumer(builder: (context, ref, _) {
          var luckyWheel = ref.watch(
              luckyWheelViewModelProvider.select((value) => value.luckyWheel));
          if (luckyWheel?.backgroundImage != null &&
              luckyWheel!.backgroundImage.isNotEmpty) {
            backgroundImage = NetworkImage(luckyWheel.backgroundImage);
          }
          if (luckyWheel == null) {
            return const SizedBox.shrink();
            // return reloadWidget(ref: ref);
          }
          return Container(
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: backgroundImage,
                onError: (exception, stackTrace) {},
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                LuckyWidget(
                  luckyWheelData: luckyWheel,
                ),
                if (luckyWheel.byInputNumberPhone()) ...[
                  Consumer(
                    builder: (context, ref, child) {
                      final gift = ref.watch(luckyWheelViewModelProvider
                          .select((value) => value.gift));
                      if (gift == null) {
                        widget.controllerPhone.text = '';
                        return TabScreenSignIn(
                          //controllerName: controllerName,
                          controllerPhone: widget.controllerPhone,
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
                if (luckyWheel.byInputInvoideCode()) ...[
                  Consumer(
                    builder: (context, ref, child) {
                      final gift = ref.watch(luckyWheelViewModelProvider
                          .select((value) => value.gift));
                      if (gift == null) {
                        widget.controllerPhone.text = '';
                        return TabSignInInvoiceCode(ref: ref);
                      }
                      return const SizedBox();
                    },
                  ),
                ],
                Positioned(
                  bottom: 40,
                  left: 40,
                  child: Consumer(
                    builder: (context, ref, child) {
                      var listGifts = ref.watch(
                        luckyWheelViewModelProvider.select(
                          (value) => value.listGiftReceived,
                        ),
                      );
                      return TabListGiftReceived(
                        gifts: listGifts,
                      );
                    },
                  ),
                ),
                if (luckyWheel.byInputInvoideCode()) ...[
                  BarcodeKeyboardListener(
                    bufferDuration: const Duration(milliseconds: 200),
                    onBarcodeScanned: (barcode) {
                      var isCheckBarcode =
                          ref.watch(luckyWheelViewModelProvider.select(
                        (value) => value.isCheckBarcode,
                      ));
                      if (isCheckBarcode == false) {
                        return ref
                            .read(luckyWheelViewModelProvider.notifier)
                            .getGiftForSpin(barCode: barcode);
                      }
                    },
                    child: const SizedBox.shrink(),
                  ),
                ],
                if (luckyWheel.byInputQR()) ...[
                  if (widget.orderCode.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: const Text(
                        "Chưa có mã hoá đơn",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  FutureBuilder(
                    future: ref
                        .read(luckyWheelViewModelProvider.notifier)
                        .getGiftForSpin(barCode: widget.orderCode),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        EasyLoading.showError("Có lỗi xảy ra");
                        return const SizedBox.shrink();
                      }
                      return const SizedBox.shrink();
                    },
                  )
                ],
                if (luckyWheel.byLink()) ...[
                  FutureBuilder(
                    future: ref
                        .read(luckyWheelViewModelProvider.notifier)
                        .getGiftForSpin(invoiceCode: ""),
                    builder: (context, constraints) {
                      if (constraints.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (constraints.hasError) {
                        return GestureDetector(
                          onTap: () => ref
                              .read(luckyWheelViewModelProvider.notifier)
                              .getGiftForSpin(invoiceCode: widget.orderCode),
                          child: const Row(
                            children: [
                              Text('Có lỗi xảy ra, vui lòng thử lại'),
                              Icon(
                                Icons.replay_outlined,
                                color: Colors.red,
                              )
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  )
                ],
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
          );
        }),
      ),
    );
  }

  Widget reloadWidget({required WidgetRef ref}) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Chưa có vòng quay nào đang diễn ra"),
            const SizedBox(
              width: 8,
            ),
            IconButton(
              onPressed: () {
                ref
                    .read(luckyWheelViewModelProvider.notifier)
                    .getActiveLuckySpins();
              },
              icon: const Icon(
                Icons.replay_outlined,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
