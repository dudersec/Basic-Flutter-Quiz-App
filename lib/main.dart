import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//void main() {
//  runApp(MyApp());
//}

//used for function with 1 expression
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 2},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 2},
        {'text': 'White', 'score': 9},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rhino', 'score': 7},
        {'text': 'Lion', 'score': 9},
        {'text': 'Cat', 'score': 1},
        {'text': 'Dog', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Pizza', 'score': 2},
        {'text': 'Hamburger', 'score': 5},
        {'text': 'Hot Dog', 'score': 9},
        {'text': 'Mutton', 'score': 1},
      ],
    },
  ];

  var _questionIndex =
      0; //class variable (property) that will not reset on build
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });

  }

  void _answerQuestion(int score) {
    _totalScore += score;

    //needed to notify widget that internal has changed and needs to re-render
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  //decorator - make code cleaner, deliberate override of existing function in lib
  @override
  Widget build(BuildContext context) {
    //returns your code to a full app
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        //new list - group of data
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
