import 'package:dribbble_challenge/challenge3/models/question.dart';
import 'package:dribbble_challenge/challenge3/screens/quiz_screen.dart';
import 'package:dribbble_challenge/challenge3/utils/default_gradient.dart';
import 'package:dribbble_challenge/challenge3/utils/networking.dart' as network;
import 'package:dribbble_challenge/challenge3/widgets/bouncing_widget.dart';
import 'package:dribbble_challenge/challenge3/widgets/number_timer.dart';
import 'package:flutter/material.dart';

class ChallengeThreeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChallengeThreeScreen();
}

class _ChallengeThreeScreen extends State<ChallengeThreeScreen> {
  bool loading = true;
  int current = 0;
  List<Question> questions = [];

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(gradient: DefaultGradient.defaultGradient),
      child: loading && false
          ? NumberTimer(
              onCompleted: () {
                this.loading = false;
                current++;
              },
            )
          : current < questions.length || true
              ? QuizScreen(
                  question: questions[current],
                  onCompleted: () {
                    setState(() {
                      this.loading = true;
                    });
                  },
                )
              : BouncingWidget(
                  duration: Duration(seconds: 2),
                  child: Text(
                    "End",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.15,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
    ));
  }

  void refresh() {
    network.getQuestions().then((questions) {
      print(questions.length);
      if (mounted) {
        setState(() {
          this.questions.clear();
          this.questions = questions;
        });
      }
    });
  }
}
