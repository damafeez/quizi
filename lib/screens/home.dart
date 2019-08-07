import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz/resources/colors.dart';
import 'package:quiz/resources/sizes.dart';
import 'package:quiz/screens/splash.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AssetImage defaultBackground = AssetImage('assets/images/science.png');
  TimerType _timerType = TimerType.interval;

  @override
  void initState() {
    super.initState();
  }

  void _selectTimerType(TimerType type) {
    setState(() {
      _timerType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(color: primaryText, fontFamily: 'Comfortaa'),
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: defaultBackground,
                  ),
                ),
                height: double.infinity,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Text(
                          'What would you like?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white30,
                            fontSize: AppFont.md,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSpace.xs, vertical: AppSpace.xs),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              for (int i = 0; i < 10; i++)
                                CategoryChip(category: 'category'),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              for (int i = 0; i < 10; i++)
                                CategoryChip(category: 'category'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(AppSpace.xs - 2),
                      padding: EdgeInsets.all(AppSpace.md),
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 15,
                              offset: Offset(0.2, 0.4))
                        ],
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                          bottom: Radius.circular(35),
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Selected Categories',
                              style: TextStyle(fontSize: AppFont.md),
                            ),
                            SizedBox(
                              height: AppSpace.xs,
                            ),
                            Wrap(
                              spacing: AppSpace.xs,
                              children: <Widget>[
                                for (int i = 0; i < 4; i++)
                                  Chip(
                                    label: Text('Education'),
                                    elevation: 10.0,
                                    shadowColor: Colors.black45,
                                    onDeleted: () {},
                                    deleteIconColor:
                                        Colors.red.withOpacity(0.7),
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: AppSpace.md,
                            ),
                            Text(
                              'Timer Type',
                              style: TextStyle(fontSize: AppFont.md),
                            ),
                            SizedBox(
                              height: AppSpace.xs,
                            ),
                            Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () =>
                                      _selectTimerType(TimerType.interval),
                                  child: Text(
                                    'Interval',
                                    style: TextStyle(
                                        color: _timerType == TimerType.interval
                                            ? null
                                            : secondaryText),
                                  ),
                                ),
                                Radio(
                                  value: TimerType.interval,
                                  groupValue: _timerType,
                                  onChanged: _selectTimerType,
                                  activeColor: primary,
                                ),
                                SizedBox(
                                  width: AppSpace.md,
                                ),
                                InkWell(
                                  onTap: () =>
                                      _selectTimerType(TimerType.express),
                                  child: Text(
                                    'Express',
                                    style: TextStyle(
                                        color: _timerType == TimerType.express
                                            ? null
                                            : secondaryText),
                                  ),
                                ),
                                Radio(
                                  value: TimerType.express,
                                  groupValue: _timerType,
                                  onChanged: _selectTimerType,
                                  activeColor: primary,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.check),
        backgroundColor: primary,
        disabledElevation: 0,
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String category;

  const CategoryChip({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Splash()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppSpace.sm, horizontal: AppSpace.md),
        margin: EdgeInsets.only(right: AppSpace.xs, top: AppSpace.xs),
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Text(
          category,
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}

enum TimerType { interval, express }
