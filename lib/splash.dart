import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz/widgets/splash_bottom_action.dart';
import 'package:quiz/widgets/splash_container.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int activeIndex = 0;

  final List<Widget> screens = [
    SplashContainer(
      key: Key('first'),
      backgroundImage: 'assets/images/celebrity.jpeg',
      title: 'Celebrities',
      subtitle: 'Quiz yourself on your favorites',
    ),
    SplashContainer(
      key: Key('second'),
      backgroundImage: 'assets/images/science.png',
      title: 'Science and Nature',
      subtitle: 'A peek into the nature of things',
    ),
    SplashContainer(
      key: Key('third'),
      backgroundImage: 'assets/images/general_knowledge.jpeg',
      title: 'General Knowledge',
      subtitle: 'What if one apple kissed another?',
    ),
  ];
  Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      setState(() {
        activeIndex = activeIndex >= screens.length - 1 ? 0 : activeIndex + 1;
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
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              // key: Key('$activeIndex'),
              child: screens[activeIndex],
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: SplashBottomAction(activeIndex: activeIndex,),
            ),
          ],
        ),
      ),
    );
  }
}
