import 'package:flutter/material.dart';
import 'package:quiz/resources/sizes.dart';

class SplashContainer extends StatelessWidget {
  final String backgroundImage;
  final String title;
  final String subtitle;

  const SplashContainer({
    Key key,
    @required this.backgroundImage,
    this.title = '',
    this.subtitle = '',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.white70, fontFamily: 'Comfortaa'),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage),
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
                            text: '$title\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppFont.lg,
                            ),
                          ),
                          TextSpan(
                              text: subtitle,
                              style: TextStyle(fontSize: AppFont.sm)),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: AppSpace.sm, horizontal: AppSpace.md),
                  child: SafeArea(
                    top: false,
                    child: Text(''),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
