import 'dart:math';

import 'package:flutter/material.dart';

class NumberTimer extends StatefulWidget {
  final Function onCompleted;

  const NumberTimer({Key key, this.onCompleted}) : super(key: key);

  @override
  State<NumberTimer> createState() => _NumberTimer();
}

class _NumberTimer extends State<NumberTimer>
    with TickerProviderStateMixin<NumberTimer> {
  AnimationController controller;
  Animation<double> scaleAnimation;
  int count = 5;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    scaleAnimation = new Tween(begin: 0.0, end: 1.0).animate(
        new CurvedAnimation(
            parent: controller,
            curve: Curves.ease,
            reverseCurve: Curves.bounceInOut));

    runAnimation();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scaleAnimation,
      builder: (context, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Transform.scale(
              scale: controller.value,
              child: Text(
                "$count",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.2,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              width: 100.0,
              height: 65.0,
              decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(100.0)),
              transform: Matrix4.rotationX(pi * 0.4),
            )
          ],
        );
      },
      child: Container(width: 0.0, height: 0.0),
    );
  }

  void runAnimation() {
    controller
        .animateTo(1.0,
            duration: Duration(seconds: 1), curve: Curves.elasticOut)
        .then((val) {
      if (count > 1) {
        controller.value = 0.0;
        setState(() {
          count--;
        });
        runAnimation();
      } else {
        widget.onCompleted();
      }
    });
  }
}
