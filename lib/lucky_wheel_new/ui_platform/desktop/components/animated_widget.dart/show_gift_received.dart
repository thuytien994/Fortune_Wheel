import 'package:flutter/material.dart';
import 'package:flutter_application_1/lucky_wheel_new/data/model/gift_received_model.dart';

class ShowGiftReceived extends AnimatedWidget {
  ShowGiftReceived(
      {super.key, required Animation<double> animation, required this.gift})
      : super(listenable: animation);
  final sizeFame = Tween<double>(begin: 0, end: 200);
  final GiftReceivedModel gift;
  final sizeText = Tween<double>(begin: 0, end: 15);
  final opacity = Tween<double>(begin: 0, end: 1);
  final sizeImage = Tween<double>(begin: 0, end: 60);
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      // width: MediaQuery.sizeOf(context).height * 0.4,
      padding: const EdgeInsets.only(bottom: 8, left: 36, right: 36, top: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white.withOpacity(0.8),
          border: Border.all(width: 0.5)),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: sizeImage.evaluate(animation),
            width: sizeImage.evaluate(animation),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber.withOpacity(opacity.evaluate(animation)),
            ),
            child: Image.network(
              gift.image ?? '',
              height: sizeImage.evaluate(animation),
              width: sizeImage.evaluate(animation),
            ),
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  gift.gift ?? '',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(
                          opacity.evaluate(animation),
                        ),
                      ),
                ),
                const SizedBox(
                  height: 0,
                ),
                Text(
                  (gift.phoneNumber ?? '092238891229').substring(0, 6) + 'xxxx',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(
                      opacity.evaluate(animation),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 103, 227, 157)
                          .withOpacity(opacity.evaluate(animation)),
                      borderRadius: BorderRadius.circular(8)),
                  child: RichText(
                    selectionColor: Colors.black.withOpacity(
                      opacity.evaluate(animation),
                    ),
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Người nhận: ',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black
                                    .withOpacity(opacity.evaluate(animation)))),
                        TextSpan(
                            text: gift.orderName ?? 'Tieen',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(
                                    opacity.evaluate(animation),
                                  ),
                                ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
