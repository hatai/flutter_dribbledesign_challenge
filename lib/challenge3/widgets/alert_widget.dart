import 'package:dribbble_challenge/challenge3/widgets/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';

class AlertWidget extends StatefulWidget {
  final BoxDecoration boxDecoration;
  final String label;
  final IconData iconData;

  const AlertWidget({Key key, @required this.label, @required this.boxDecoration, @required this.iconData}): super(key: key);

  State<AlertWidget> createState() => _AlertWidget();
}

class _AlertWidget extends State<AlertWidget> {
  @override
  Widget build(BuildContext context) {
    return BouncingWidget();
  }
}