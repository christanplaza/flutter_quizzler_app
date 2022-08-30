import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreTracker = [];

  List<String> questions = [
    'The earth has two moons',
    'There is 26 hours in a day.',
    'Ice cream is a dessert.',
    'Tamago means Egg',
    'Water is a liquid'
  ];

  List<bool> answers = [false, false, true, true, true];

  int questionNumber = 0;
  int score = 0;

  // Icon(
  //   Icons.check,
  //   color: Colors.green,
  // ),
  // Icon(
  //   Icons.close,
  //   color: Colors.red,
  // ),

  _showQuizResult(context) {
    Alert(
      context: context,
      title: "You've reached the end of the quiz!",
      desc: "Your total score is $score",
      buttons: [
        DialogButton(
          child: Text(
            "Try Again",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            setState(() {
              questionNumber = 0;
              score = 0;
              scoreTracker = [];
            });
            Navigator.pop(context);
          },
        ),
      ],
      style: AlertStyle(
        isCloseButton: false,
      ),
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool correctAnswer = answers[questionNumber];
                  if (correctAnswer == true) {
                    scoreTracker.add(Icon(Icons.check, color: Colors.green));
                    score++;
                  } else {
                    scoreTracker.add(Icon(Icons.close, color: Colors.red));
                  }

                  if (questionNumber == questions.length - 1) {
                    _showQuizResult(context);
                    print('end of quiz');
                  } else {
                    questionNumber++;
                  }
                });
                // User picked true
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                // User picked false
                setState(() {
                  bool correctAnswer = answers[questionNumber];
                  if (correctAnswer == false) {
                    scoreTracker.add(Icon(Icons.check, color: Colors.green));
                    score++;
                  } else {
                    scoreTracker.add(Icon(Icons.close, color: Colors.red));
                  }

                  if (questionNumber == questions.length - 1) {
                    _showQuizResult(context);
                  } else {
                    questionNumber++;
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreTracker,
        )
      ],
    );
  }
}
