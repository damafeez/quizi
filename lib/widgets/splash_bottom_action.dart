import 'package:flutter/material.dart';
import 'package:quiz/resources/colors.dart';
import 'package:quiz/resources/sizes.dart';
import 'package:quiz/screens/home.dart';

class SplashBottomAction extends StatelessWidget {
  final int activeIndex;
  final int length;
  const SplashBottomAction({Key key, @required this.length, this.activeIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: AppSpace.sm,
        ),
        for(int i = 0; i < length; i++) SwipeIndicator(isActive: activeIndex == i),
        Expanded(
          child: Container(),
        ),
        InkWell(
          // TODO: add skipped state to shared preference
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          child: Container(
            color: primary,
            padding: EdgeInsets.symmetric(
                vertical: AppSpace.sm, horizontal: AppSpace.md),
            child: SafeArea(
              top: false,
              child: Text('Skip'),
            ),
          ),
        )
      ],
    );
  }
}

class SwipeIndicator extends StatelessWidget {
  final isActive;

  const SwipeIndicator({
    Key key,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      width: 7,
      height: 7,
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: isActive ? primary : Colors.white70,
        shape: BoxShape.circle,
      ),
    );
  }
}
