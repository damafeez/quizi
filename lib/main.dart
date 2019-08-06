import 'package:flutter/material.dart';
import 'package:quiz/resources/colors.dart';
import 'package:quiz/splash.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      theme: _buildThemeData(),
      home: Splash(),
    );
  }
}

ThemeData _buildThemeData() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: primary,
    scaffoldBackgroundColor: background,
    accentColor: primary,
    iconTheme: base.iconTheme.copyWith(
      color: primary,
    ),
  );
}
