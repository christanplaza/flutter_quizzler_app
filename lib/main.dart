import 'package:flutter/material.dart';

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

  // Icon(
  //   Icons.check,
  //   color: Colors.green,
  // ),
  // Icon(
  //   Icons.close,
  //   color: Colors.red,
  // ),

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
                bool correctAnswer = answers[questionNumber];

                if (correctAnswer == true) {
                  print('Correct');
                } else {
                  print('wrong');
                }
                setState(() {
                  questionNumber++;
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
                bool correctAnswer = answers[questionNumber];

                if (correctAnswer == false) {
                  print('Correct');
                } else {
                  print('wrong');
                }

                // User picked false
                setState(() {
                  questionNumber++;
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
