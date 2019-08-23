import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/resources/colors.dart';
import 'package:quiz/resources/sizes.dart';
import 'package:quiz/screens/home.dart';

class Score extends StatelessWidget {
  final int score;
  final int total;

  const Score({Key key, this.score = 0, this.total = 0}) : super(key: key);
  String get rating {
    double percentage = score / total;
    if (percentage < 0.5)
      return 'Olodo';
    else if (percentage < 0.7)
      return 'Ok Ok';
    else {
      print(percentage);
      return 'Efiko 📚';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: AppFont.lg,
                  color: secondaryText,
                  height: 1.3,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '$score of $total\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppFont.md,
                    ),
                  ),
                  TextSpan(text: '$rating'),
                ],
              ),
            ),
            SizedBox(height: AppSpace.md,),
            CupertinoButton(
              child: Text('New Quiz', style: TextStyle(color: Color(0xff0093cc)),),
              onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));},
            )
          ],
        ),
      ),
    );
  }
}
