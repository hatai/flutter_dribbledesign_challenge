import 'package:dribbble_challenge/challenge3/models/answer.dart';
import 'package:flutter/cupertino.dart';

class AnswerWidget extends StatefulWidget {
  final AnswerType type;
  final String option;
  final double progress;

  const AnswerWidget({Key key, this.option, this.type, @required this.progress})
      : super(key: key);

  @override
  State<AnswerWidget> createState() => _AnswerWidget();
}

class _AnswerWidget extends State<AnswerWidget> {
  double width = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 100)).then((val) {
      if (mounted) {
        setState(() {
          width = MediaQuery.of(context).size.width * 3 / 4;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack();
  }
}
