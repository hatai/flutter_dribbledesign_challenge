import 'package:flutter/material.dart';

class BlankScreen extends StatefulWidget {
  final String title;

  const BlankScreen(this.title, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BlankScreen();
}

class _BlankScreen extends State<BlankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:
              Text(widget.title, style: Theme.of(context).textTheme.headline)),
    );
  }
}
