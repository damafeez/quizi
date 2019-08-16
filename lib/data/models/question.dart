import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz/resources/utils.dart';

class Question {
  final String question;
  final List wrongAnswers;
  final String rightAnswer;
  final String category;
  int _correctIndex;
  List<String> _answers;

  Question({
    @required this.question,
    @required this.wrongAnswers,
    @required this.rightAnswer,
    this.category = 'Unknown',
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      wrongAnswers: json['incorrect_answers'],
      rightAnswer: json['correct_answer'],
      category: json['category'],
    );
  }

  void _setAnswers() {
    _correctIndex = randomIntegerFromRange(0, wrongAnswers.length);
    _answers = wrongAnswers.map((answer) => answer.toString()).toList()
      ..shuffle(Random())
      ..insert(_correctIndex, rightAnswer);
  }

  get answers {
    if (_answers == null) _setAnswers();
    return _answers;
  }

  int get correctIndex {
    if (_answers == null) _setAnswers();
    return _correctIndex;
  }
}