import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      //generic widget type list
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        //spread operator ..., take a list, pull values in list out, add to surrounding list as individual values.
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          //changed pointer to function (no args) to anonymous function (with no args) that uses answerQuestion, so can now use arguments
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
