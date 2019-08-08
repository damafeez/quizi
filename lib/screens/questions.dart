import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz/data/models/category.dart';
import 'package:quiz/resources/colors.dart';
import 'package:quiz/resources/sizes.dart';
import 'package:quiz/screens/home.dart';

class Questions extends StatefulWidget {
  final List<Category> selectedCategories;
  final TimerType timerType;

  const Questions(
      {Key key, @required this.selectedCategories, @required this.timerType})
      : super(key: key);
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  Color backgroundColor = Color(0xff0093cc);

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
                              Icons.arrow_back_ios,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSpace.md,
                    ),
                    Text(
                      'What is the best name for a cat who has no name before he met his human friend?',
                      style: TextStyle(
                          fontSize: AppFont.md, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: AppSpace.lg,
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 48,
                            height: 58,
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'A',
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: AppFont.md),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: AppSpace.md,
                          ),
                          Text(
                            'Pixi, or Pinokyo',
                          ),
                        ],
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
