import 'package:flutter/material.dart';
import 'package:flutter_application_1/lucky_wheel/data/model/gift_received_model.dart';

class ShowGiftReceived extends AnimatedWidget {
  ShowGiftReceived(
      {super.key, required Animation<double> animation, required this.gift})
      : super(listenable: animation);
  final sizeFame = Tween<double>(begin: 0, end: 200);
  final GiftReceivedModel gift;
  final sizeText = Tween<double>(begin: 10, end: 15);
  final opacity = Tween<double>(begin: 0, end: 1);
  final sizeImage = Tween<double>(begin: 0, end: 50);
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Stack(
      children: [
        Row(
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
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  gift?.orderName ?? 'hahahaha',
                  // gift?.orderName ?? '',
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
                  gift?.gift ?? '',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(
                      opacity.evaluate(animation),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        Positioned(
          top: 10,
          right: 16,
          child: RichText(
            selectionColor: Colors.black.withOpacity(
              opacity.evaluate(animation),
            ),
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'ID hoá đơn: ',
                ),
                TextSpan(
                    text: gift?.orderName ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w600, 

                        ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
