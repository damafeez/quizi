import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz/data/fixtures/categories.dart';
import 'package:quiz/resources/colors.dart';
import 'package:quiz/resources/sizes.dart';
import 'package:quiz/widgets/splash_bottom_action.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int activeIndex = 0;
  Color dominantColor = primary;

  Timer _timer;

  @override
  void initState() {
      dominantColor = splashScreenCategories[activeIndex].color;
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      setState(() {
        activeIndex = activeIndex >= splashScreenCategories.length - 1 ? 0 : activeIndex + 1;
        dominantColor = splashScreenCategories[activeIndex].color;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.white70, fontFamily: 'Comfortaa'),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: splashScreenCategories[activeIndex].image,
                ),
              ),
              height: double.infinity,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  dominantColor.withOpacity(0.95),
                  primary.withOpacity(0.4),
                ],
              )),
            ),
            Column(
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
                      color: Colors.white.withOpacity(0.8),
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
                            text: '${splashScreenCategories[activeIndex].title}\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppFont.lg,
                            ),
                          ),
                          TextSpan(
                              text: splashScreenCategories[activeIndex].description,
                              style: TextStyle(fontSize: AppFont.sm)),
                        ],
                      ),
                    ),
                  ),
                ),
                SplashBottomAction(
                  length: splashScreenCategories.length,
                  activeIndex: activeIndex,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

