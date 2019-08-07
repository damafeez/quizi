import 'package:flutter/material.dart';
import 'package:quiz/resources/colors.dart';
import 'package:quiz/resources/sizes.dart';

class SplashBottomAction extends StatelessWidget {
  final int activeIndex;

  const SplashBottomAction({Key key, this.activeIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: AppSpace.sm,
        ),
        SwipeIndicator(isActive: activeIndex == 0),
        SwipeIndicator(isActive: activeIndex == 1),
        SwipeIndicator(isActive: activeIndex == 2),
        Expanded(
          child: Container(),
        ),
        InkWell(
          onTap: () {},
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
