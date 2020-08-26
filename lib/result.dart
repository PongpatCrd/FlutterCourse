import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resethandler;

  Result({this.resultScore, this.resethandler});

  String get resultPhraser {
    String resultText = "You did it!";
    if (resultScore <= 8) {
      resultText = "Yor get lower than eight point!";
    } else if (resultScore <= 12) {
      resultText = "Yor get lower than twelve point!";
    } else {
      resultText = "You are bad!!!!!!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhraser,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          onPressed: resethandler,
          child: Text('Restart Quize!'),
          textColor: Colors.deepOrange,
        )
      ],
    ));
  }
}
