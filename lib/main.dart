import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What`s your favorite color ?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "red", "score": 6},
        {"text": "Green", "score": 3},
        {"text": "White", 'score': 1},
      ]
    },
    {
      "questionText": "What's your favorite animal ?",
      "answers": [
        {"text": "Rabbit", "score": 5},
        {"text": "Snake", "score": 4},
        {"text": "Elephant", "score": 3},
        {"text": "Lion", "score": 2},
      ]
    },
    {
      "questionText": "Who's your favorite instructor ?",
      "answers": [
        {"text": "Max", "score": 3},
        {"text": "Akila", "score": 4},
        {"text": "John", "score": 5},
        {"text": "Smith", "score": 6},
      ]
    },
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(),
      ),
    );
  }
}
