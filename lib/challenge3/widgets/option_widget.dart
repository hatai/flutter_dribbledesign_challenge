import 'package:dribbble_challenge/challenge3/widgets/bouncing_widget.dart';
import 'package:flutter/material.dart';

class OptionWidget extends StatefulWidget {
  final Color background, color;
  final Function onClicked;
  final double progress;
  final bool showProgress;
  final String label;

  const OptionWidget(
      {Key key,
      @required this.label,
      this.background = Colors.white,
      this.color = Colors.black,
      this.onClicked,
      this.progress = 1.0,
      this.showProgress = false})
      : super(key: key);

  @override
  State<OptionWidget> createState() => _OptionWidget();
}

class _OptionWidget extends State<OptionWidget> {
  @override
  Widget build(BuildContext context) {
    return BouncingWidget();
  }
}
