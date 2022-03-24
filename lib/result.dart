import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 3) {
      resultText = 'Very good taste';
    } else if (resultScore <= 7) {
      resultText = 'Pretty good';
    } else if (resultScore <= 12) {
      resultText = 'Terrible, just terrible';
    } else {
      resultText = 'Inhumanly bad (suggested by my IDE)';
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
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Restart Quiz'),
            onPressed: resetHandler,
            style: TextButton.styleFrom(
                backgroundColor: Colors.indigoAccent, primary: Colors.white),
          ),
        ],
      ),
    );
  }
}
