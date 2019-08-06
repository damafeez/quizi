import 'package:flutter/material.dart';
import 'package:quiz/resources/colors.dart';
import 'package:quiz/resources/sizes.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.white70, fontFamily: 'Comfortaa'),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/celebrity.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox.expand(
            child: Column(
              children: <Widget>[
                SafeArea(
                  bottom: false,
                  child: SizedBox(
                    height: AppSpace.xl,
                  ),
                ),
                Image.asset('assets/images/logo.png', width: 80),
                SizedBox(
                  height: AppSpace.lg,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppFont.lg,
                      color: Colors.white70,
                      fontFamily: 'Comfortaa',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Quizi\n',
                      ),
                      TextSpan(
                        text: 'Sharpen your wits!',
                        style: TextStyle(
                          color: Colors.white30,
                          fontSize: AppFont.md,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: AppSpace.sm),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white54,
                          fontFamily: 'Comfortaa',
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Celebrities\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppFont.lg,
                            ),
                          ),
                          TextSpan(
                              text: 'Quiz yourself on your favorites',
                              style: TextStyle(fontSize: AppFont.sm)),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: AppSpace.sm,
                    ),
                    SwipeIndicator(
                      isActive: true,
                    ),
                    SwipeIndicator(),
                    SwipeIndicator(),
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
                )
              ],
            ),
          ),
        ),
      ),
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
    return Container(
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
