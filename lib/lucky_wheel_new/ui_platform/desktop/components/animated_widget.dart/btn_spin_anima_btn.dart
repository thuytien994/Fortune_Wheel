import 'package:flutter/material.dart';

class SpinAnimaBtn extends AnimatedWidget {
  final String? urlImage;
  const SpinAnimaBtn({
    super.key,
    required Animation<double> animation,
    this.urlImage,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final move = Tween<double>(begin: 140, end: 150);
    final animation = listenable as Animation<double>;
    if (urlImage != null && urlImage!.isNotEmpty) {
      return Image.network(
        urlImage!,
        width: move.evaluate(animation),
        height: move.evaluate(animation),
      );
    }
    return Image.asset(
      "assets/images/btn-spin.png",
      width: move.evaluate(animation),
      height: move.evaluate(animation),
    );
  }
}
