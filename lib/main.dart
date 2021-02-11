import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 10},
        {'text': 'White', 'score': 11}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal??',
      'answers': [
        {'text': 'Rabbit', 'score': 6},
        {'text': 'Snake', 'score': 3},
        {'text': 'Elephant', 'score': 4},
        {'text': 'Lion', 'score': 7}
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor??',
      'answers': [
        {'text': 'Thiesko', 'score': 15},
        {'text': 'Roger', 'score': 1}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length)
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fluter App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
