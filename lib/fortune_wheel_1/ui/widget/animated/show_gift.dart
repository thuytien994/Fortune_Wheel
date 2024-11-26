import 'package:flutter/material.dart';

class ShowGift  extends AnimatedWidget{
    final String gift;

  ShowGift({
    Key? key,
    required Animation<double> animation,
    required this.gift,
  }) : super(key: key, listenable: animation);

 var widget = Tween<double>(begin: 0,end:100);
  var height =  Tween<double>(begin: 0, end: 100);

  @override
  Widget build(BuildContext context) {
    final animation = listenable  as  Animation<double>;

    // TODO: implement build
    return Stack(children: [
      Container(
        height: height.evaluate(animation),
        width: widget.evaluate(animation),
        alignment: Alignment.center,      
        color: Colors.amber,
        child: Text(gift),
      )

    ],);
  }

}

