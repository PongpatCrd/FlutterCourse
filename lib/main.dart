import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(AwesomeApp());
}

// StatelessWidget => re render when input data change
// StatefulWidget => re render when input data or local state change

class AwesomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AwesomeAppState();
  }
}

class _AwesomeAppState extends State<AwesomeApp> {
  var questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answerText': ['Black', 'Red', 'white', 'green']
    },
    {
      'questionText': 'What\s your favorite animal?',
      'answerText': ['Dog', 'Cat', 'Rabbit', 'Squirrel']
    },
    {
      'questionText': 'What\s the name of this day?',
      'answerText': [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Satuday',
        'Sunday'
      ]
    },
    {
      'questionText': 'You do this day the best?',
      'answerText': ['Yep', 'Nop']
    },
  ];

  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      if (_questionIndex + 1 >= questions.length) {
        _questionIndex = 0;
      }
      print(sprintf('Answer question %s', [_questionIndex]));
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('This Is An Awesome App!!'),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]['questionText']),
            ...(questions[_questionIndex]['answerText'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
