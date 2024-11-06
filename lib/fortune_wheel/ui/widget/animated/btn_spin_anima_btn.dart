import 'package:flutter/material.dart';

class SpinAnimaBtn extends AnimatedWidget {
  SpinAnimaBtn({
    super.key,
    required Animation<double> animation,
  }) : super(listenable: animation);
  var move = Tween<double>(begin: 100, end: 110);
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    // TODO: implement build
    return Image.asset(
      'assets/images/spin.png',
      width: move.evaluate(animation),
      height: move.evaluate(animation),
    );
  }
}
