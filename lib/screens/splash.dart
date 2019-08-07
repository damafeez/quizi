import 'dart:async';

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:quiz/resources/colors.dart';
import 'package:quiz/resources/sizes.dart';
import 'package:quiz/widgets/splash_bottom_action.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int activeIndex = 0;
  Duration _animationDuration = Duration(milliseconds: 300);

  final List<ViewModel> screens = [
    ViewModel(
      image: AssetImage('assets/images/celebrity.jpeg'),
      title: 'Celebrities',
      description: 'Quiz yourself on your favorites',
    ),
    ViewModel(
      image: AssetImage('assets/images/science.png'),
      title: 'Science and Nature',
      description: 'A peek into the nature of things',
    ),
    ViewModel(
      image: AssetImage('assets/images/general_knowledge.jpeg'),
      title: 'General Knowledge',
      description: 'What if one apple kissed another?',
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
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: screens[activeIndex].image,
                ),
              ),
              height: double.infinity,
            ),
            AnimatedContainer(
              duration: _animationDuration,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      screens[activeIndex].color.withOpacity(0.95),
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
                            text: '${screens[activeIndex].title}\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppFont.lg,
                            ),
                          ),
                          TextSpan(
                              text: screens[activeIndex].description,
                              style: TextStyle(fontSize: AppFont.sm)),
                        ],
                      ),
                    ),
                  ),
                ),
                SplashBottomAction(
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

class ViewModel {
  final AssetImage image;
  final String title;
  final String description;

  PaletteGenerator _paletteGenerator;
  ViewModel({this.image, this.title, this.description}) {
    PaletteGenerator.fromImageProvider(this.image)
        .then((generator) => _paletteGenerator = generator);
  }

  Color get color {
    return _paletteGenerator?.darkVibrantColor?.color ?? primary;
  }
}
