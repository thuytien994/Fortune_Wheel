import 'package:flutter/material.dart';
import 'package:flutter_application_1/lucky_wheel_new/view_model/lucky_wheel_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'components/components.dart';
import 'components/tab_sign_in_invoice_code.dart';

class LuckyWheelMobilePage extends ConsumerStatefulWidget {
  final TextEditingController controllerPhone;
  final String orderCode;

  const LuckyWheelMobilePage({
    super.key,
    required this.controllerPhone,
    required this.orderCode,
  });

  @override
  ConsumerState<LuckyWheelMobilePage> createState() =>
      _LuckyWheelMobilePageState();
}

class _LuckyWheelMobilePageState extends ConsumerState<LuckyWheelMobilePage> {
  ImageProvider backgroundImageMobile = const AssetImage(
    'assets/images/bgr_lucky_wheel.png',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer(builder: (context, ref, _) {
        var luckyWheel = ref.watch(
            luckyWheelViewModelProvider.select((value) => value.luckyWheel));

        if (luckyWheel?.backgroundImageMobile != null &&
            luckyWheel!.backgroundImageMobile.isNotEmpty) {
          backgroundImageMobile =
              NetworkImage(luckyWheel.backgroundImageMobile);
        }
        if (luckyWheel == null) {
          return reloadWidget(ref: ref);
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: backgroundImageMobile,
                    onError: (exception, stackTrace) {},
                  ),
                ),
                child: LuckyWidget(
                  luckyWheelData: luckyWheel,
                ),
              ),
            ),
            // if (luckyWheel.logoImage.isNotEmpty) ...[
            //   Image.network(
            //     luckyWheel.logoImage,
            //     height: 400,
            //   )
            // ],
            Consumer(builder: (context, ref, _) {
              final gift = ref.watch(
                  luckyWheelViewModelProvider.select((value) => value.gift));
              if (gift != null) {
                return const SizedBox.shrink();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (luckyWheel.byInputNumberPhone()) ...[
                    TabSignIn(
                      controllerPhone: widget.controllerPhone,
                    ),
                  ],
                  if (luckyWheel.byInputInvoideCode()) ...[
                    TabSignInInvoiceCode(ref: ref)
                  ],
                  if (luckyWheel.byInputQR()) ...[
                    FutureBuilder(
                        future: ref
                            .read(luckyWheelViewModelProvider.notifier)
                            .getGiftForSpin(invoiceCode: widget.orderCode),
                        builder: (context, constraints) {
                          if (constraints.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          if (constraints.hasError) {
                            return GestureDetector(
                                onTap: () => ref
                                    .read(luckyWheelViewModelProvider.notifier)
                                    .getGiftForSpin(
                                        invoiceCode: widget.orderCode),
                                child: const Row(
                                  children: [
                                    Text('Có lỗi xảy ra, vui lòng thử lại'),
                                    Icon(
                                      Icons.replay_outlined,
                                      color: Colors.red,
                                    )
                                  ],
                                ));
                          }
                          return const SizedBox.shrink();
                        })
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
                  ]
                ],
              );
            }),
          ],
        );
      }),
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
