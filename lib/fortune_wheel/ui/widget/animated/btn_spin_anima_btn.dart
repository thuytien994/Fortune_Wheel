import 'package:flutter/material.dart';

class SpinAnimaBtn extends AnimatedWidget {
  SpinAnimaBtn({
    super.key,
    required Animation<double> animation,
  }) : super(listenable: animation);
  var move = Tween<double>(begin: 130, end: 140);
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    // TODO: implement build
    return Image.asset(
      'assets/images/btn-spin.png',
      width: move.evaluate(animation),
      height: move.evaluate(animation),
    );
  }
}
