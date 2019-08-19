import 'package:flutter/material.dart';
import 'package:quiz/resources/sizes.dart';

class AnswerChip extends StatelessWidget {
  final AnswerState answerState;
  final bool isSelected;
  final String alphabet;
  final String answer;
  final Function onTap;
  const AnswerChip({
    Key key,
    @required this.alphabet,
    @required this.answer,
    this.answerState = AnswerState.initial,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.only(top: AppSpace.sm - 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isSelected ? 0.12 : 0),
            blurRadius: 15,
            offset: Offset(0.0, 7.0),
            spreadRadius: 2,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            Container(
              width: 48,
              height: 58,
              decoration: BoxDecoration(
                color: answerStateColor[answerState],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  alphabet,
                  style: TextStyle(
                      color: answerState == AnswerState.initial
                          ? null
                          : Colors.white54,
                      fontSize: AppFont.md),
                ),
              ),
            ),
            SizedBox(
              width: AppSpace.md,
            ),
            Expanded(
              child: Text(
                '$answer',
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum AnswerState { initial, isCorrect, isWrong }

final Map<AnswerState, Color> answerStateColor = {
  AnswerState.initial: Color(0xFFeaeaec),
  AnswerState.isWrong: Colors.redAccent,
  AnswerState.isCorrect: Colors.green,
};
