import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:http/http.dart' as http;
import 'package:quiz/data/models/category.dart';
import 'package:quiz/data/models/question.dart';
import 'package:quiz/resources/colors.dart';
import 'package:quiz/resources/sizes.dart';
import 'package:quiz/screens/home.dart';
import 'package:quiz/widgets/answer_chip.dart';

class Questions extends StatefulWidget {
  final List<Category> categories;
  final TimerType timerType;

  const Questions(
      {Key key, @required this.categories, @required this.timerType})
      : super(key: key);
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final Color backgroundColor = Color(0xff0093cc);
  final int questionsCount = 15;
  final String baseURL = 'https://opentdb.com/api.php';
  final List<String> alphabets = ['A', 'B', 'C', 'D', 'E', 'F'];
  final List<Question> questions = [];
  int currentQuestionIndex = 0;
  HtmlUnescape unescape;

  Question get question {
    try {
      return questions[currentQuestionIndex];
    } on RangeError {
      return null;
    }
  }

  void selectAnswer(int index) {
    setState(() {
      question.setSelectedIndex(index);
    });
  }

  Function buildNextCallback() {
    if ((widget.timerType == TimerType.interval &&
            question?.selectedIndex == null) ||
        (currentQuestionIndex >= questionsCount - 1)) return null;
    return () {
      setState(() {
        currentQuestionIndex++;
      });
    };
  }

  void fetchQuestions() {
    final int questionCountPerCall =
        (questionsCount / widget.categories.length).floor();
    for (final Category category in widget.categories) {
      http
          .get(
              '$baseURL?amount=$questionCountPerCall&category=${category.id}&difficulty=easy')
          .then((response) {
        List results = json.decode(response.body)['results'];
        for (final Map<String, dynamic> result in results) {
          setState(() {
            questions.add(Question.fromJson(result));
          });
        }
      });
    }
  }

  @override
  void initState() {
    fetchQuestions();
    unescape = HtmlUnescape();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(color: secondaryText, fontFamily: 'Comfortaa'),
        child: Stack(
          children: <Widget>[
            Align(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppSpace.md),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: SafeArea(
                        bottom: false,
                        child: Transform.translate(
                          offset: Offset(-15, 0),
                          child: IconButton(
                            color: secondaryText,
                            icon: Icon(
                              Icons.arrow_back,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSpace.md,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 450),
                      child: question == null
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  unescape.convert(question.question),
                                  style: TextStyle(
                                    fontSize: AppFont.md,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: AppSpace.lg,
                                ),
                                for (int i = 0;
                                    i < question.answers.length;
                                    i++)
                                  AnswerChip(
                                    alphabet: alphabets[i],
                                    answer: '${unescape.convert(question.answers[i])}',
                                    // isCorrect: question.correctIndex == i,
                                    onTap: () => selectAnswer(i),
                                    answerState: (() {
                                      if (question.selectedIndex != null) {
                                        if (question.selectedIndex !=
                                                question.correctIndex &&
                                            question.selectedIndex == i)
                                          return AnswerState.isWrong;
                                        if (question.correctIndex == i)
                                          return AnswerState.isCorrect;
                                      }

                                      return AnswerState.initial;
                                    })(),
                                    isSelected: question.selectedIndex == i,
                                  ),
                              ],
                            ),
                    ),
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              onPressed: currentQuestionIndex > 0
                                  ? () {
                                      setState(() {
                                        currentQuestionIndex--;
                                      });
                                    }
                                  : null,
                              icon: Icon(Icons.chevron_left),
                            ),
                            Container(
                              width: 75,
                              height: 75,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 25,
                                    offset: Offset(0.3, 0.4),
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  '${currentQuestionIndex + 1}/$questionsCount',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: buildNextCallback(),
                              icon: Icon(Icons.chevron_right),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 90,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff5b7fc9).withOpacity(0.5),
                        blurRadius: 15,
                        offset: Offset(0.2, 0.4))
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      backgroundColor.withOpacity(0.85),
                      Color(0xff5b7fc9).withOpacity(0.8),
                    ],
                    stops: [0.45, 1.0],
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSpace.sm),
                      child: Text('14',
                          style: TextStyle(
                              color: Colors.white54, fontSize: AppFont.lg)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
