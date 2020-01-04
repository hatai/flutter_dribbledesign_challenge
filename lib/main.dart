import 'package:dribbble_challenge/challenge0/screens/payment_screen.dart';
import 'package:dribbble_challenge/challenge1/screens/challenge_one_screen.dart';
import 'package:dribbble_challenge/challenge2/screens/challenge_two_screen.dart';
import 'package:dribbble_challenge/challenge3/screens/challenge_three_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.redAccent,
        brightness: Brightness.light,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/challenge0': (context) => PaymentScreen(),
        '/challenge1': (context) => ChallengeOneScreen(),
        '/challenge2': (context) => ChallengeTwoScreen(),
        '/challenge3': (context) => ChallengeThreeScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Flutter Dribble Challenge'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text('Challenge $index'),
              onPressed: () {
                Navigator.of(context).pushNamed('/challenge$index');
              },
            ),
          );
        },
        itemCount: 4,
        shrinkWrap: true,
      ),
    );
  }
}
