import 'package:dribbble_challenge/challenge3/models/question.dart';
import 'package:dribbble_challenge/challenge3/widgets/bouncing_widget.dart';
import 'package:dribbble_challenge/challenge3/widgets/question_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final Question question;
  final Function onCompleted;

  const QuizScreen(
      {Key key, @required this.question, @required this.onCompleted})
      : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreen();
}

class _QuizScreen extends State<QuizScreen> {
  bool answerable = true;
  bool answered = false;
  bool correct = false;
  bool showAnswer = false;
  String answer = '';
  Question question;

  @override
  void initState() {
    super.initState();
    question = widget.question;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: BouncingWidget(
          duration: Duration(seconds: 1),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildTimer(),
                QuestionWidget(
                  answer: showAnswer ? answer : null,
                  onClicked: (answer) {
                    this.answer = answer;
                    if (this.answer == question.correctAnswer) {
                      correct = true;
                    }
                  },
                  answerable: answerable,
                  question: question,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTimer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(),
    );
  }
}
