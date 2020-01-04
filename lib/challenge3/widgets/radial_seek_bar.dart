import 'package:flutter/material.dart';

class RadialSeekBar extends StatefulWidget {
  final double trackWidth;
  final Color trackColor;
  final double progressWidth;
  final Color progressColor;
  final double progressPercent;
  final Widget child;

  const RadialSeekBar(
      {Key key,
      this.trackWidth = 10.0,
      this.trackColor = Colors.grey,
      this.progressWidth = 10.0,
      this.progressColor = Colors.black,
      this.progressPercent = 0.2,
      @required this.child})
      : super(key: key);

  @override
  State<RadialSeekBar> createState() => _RadialSeekBar();
}

class _RadialSeekBar extends State<RadialSeekBar> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint();
  }
}
