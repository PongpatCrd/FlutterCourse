import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

import './question.dart';
import './answer.dart';
import './quize.dart';
import './result.dart';

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
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answerText': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'White', 'score': 1},
        {'text': 'green', 'score': 3}
      ]
    },
    {
      'questionText': 'What\s your favorite animal?',
      'answerText': [
        {'text': 'Dog', 'score': 2},
        {'text': 'Cat', 'score': 2},
        {'text': 'Fish', 'score': 4},
        {'text': 'Monky', 'score': 5}
      ]
    },
    {
      'questionText': 'What\s your favorite day?',
      'answerText': [
        {'text': 'Sunday', 'score': 1},
        {'text': 'Monday', 'score': 10},
        {'text': 'Tuesday', 'score': 9},
        {'text': 'Wenesday', 'score': 8},
        {'text': 'Thuresday', 'score': 7},
        {'text': 'Firday', 'score': 1},
        {'text': 'Satuday', 'score': 1}
      ]
    },
    {
      'questionText': 'Did you do this day the best?',
      'answerText': [
        {'text': 'Yep', 'score': 1},
        {'text': 'Nop', 'score': 7}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuize() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex += 1;
      print(sprintf('Answer question %s', [_questionIndex]));
    });

    if (_questionIndex < _questions.length) {
      print('We had more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('This Is An Awesome App!!'),
          ),
          body: _questionIndex < _questions.length
              ? Quize(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(
                  resultScore: _totalScore,
                  resethandler: _resetQuize,
                )),
    );
  }
}
