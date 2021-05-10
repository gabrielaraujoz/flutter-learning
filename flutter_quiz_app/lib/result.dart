import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 12) {
      resultText = 'You are awesome!';
    } else if (resultScore >= 20) {
      resultText = 'Oooh you\'re nasty!';
    } else {
      resultText = 'Congrats, you did it! But you are ... strange?!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 16),
            ),
            textColor: Colors.blueAccent,
            onPressed: resetHandler,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
