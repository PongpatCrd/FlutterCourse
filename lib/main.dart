import 'package:flutter/material.dart';

void main() {
  runApp(AwesomeApp());
}

// StatelessWidget => re render when input data change
// StatefulWidget => re render when input data or local state change

class AwesomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AwesomeAppState();
  }
}

class AwesomeAppState extends State<AwesomeApp> {
  var questionIndex = 0;
  void answerQuestion1() {
    setState(() {
      questionIndex = 0;
    });
    print('Answer question 1');
  }

  @override
  Widget build(BuildContext context) {
    var questions = ['Question 1', 'Question 2', 'Question 3', 'Question 4'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('This Is An Awesome App!!'),
        ),
        body: Column(
          children: <Widget>[
            Text(questions[questionIndex]),
            RaisedButton(
              onPressed: answerQuestion1,
              child: Text("Answer Question 1"),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  questionIndex = 1;
                });
                print("Answer question 2");
              },
              child: Text("Answer Question 2"),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  questionIndex = 2;
                });
                print("Answer question 3");
              },
              child: Text("Answer Question 3"),
            ),
          ],
        ),
      ),
    );
  }
}
