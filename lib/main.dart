import 'package:flutter/material.dart';


import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState((){
      _questionIndex=0;
      _totalScore=0;
    });
  }

  final _questions = [
    {
      'questionText': 'Who\'s your favorite Dota 2 Character?',
      'answers': [
        {'text':'Juggernaut', 'score':1},
        {'text':'Antimage', 'score':2},
        {'text':'Ursa', 'score':4},
        {'text':'Weaver', 'score':3},
      ],
    },

    {
      'questionText': 'What\'s your favorite music genre?',
      'answers': [
         {'text':'Rock', 'score':3},
         {'text':'Indie', 'score':1},
         {'text':'Pop', 'score':6},
         {'text':'Rap', 'score':10},
      ],
    },

    {
      'questionText': 'Who\'s your favorite philosopher?',
      'answers': [
         {'text':'Friedrich Nietzsche', 'score':2},
         {'text':'Carl Jung', 'score':4},
         {'text':'Aristotle', 'score':1},
         {'text':'Arthur Schopenhauer', 'score':3},
      ],
    },
  ];



  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          backgroundColor: Colors.indigoAccent,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
