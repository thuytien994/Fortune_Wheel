import 'package:flutter/material.dart';

class SpinAnimaBtn extends AnimatedWidget {
  const SpinAnimaBtn({
    super.key,
    required Animation<double> animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final move = Tween<double>(begin: 110, end: 120);
    final animation = listenable as Animation<double>;
    return Image.asset(
      'assets/images/btn-spin.png',
      width: move.evaluate(animation),
      height: move.evaluate(animation),
    );
  }
}
