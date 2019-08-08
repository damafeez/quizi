import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz/data/fixtures/categories.dart';
import 'package:quiz/data/models/category.dart';
import 'package:quiz/resources/colors.dart';
import 'package:quiz/resources/sizes.dart';
import 'package:quiz/screens/questions.dart';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int categoriesHalfIndex = (categories.length / 2).floor();
  final int categoriesLimit = 5;
  Color backgroundColor = Color(0xff0093cc);
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

  List<Category> get selectedCategories {
    return categories.where((category) => category.isSelected).toList();
  }

  bool get noCategoriesSelected {
    return selectedCategories.length <= 0;
  }
  List<CategoryChip> _buildCategoriesRow({int start = 0, int end}) {
    List<CategoryChip> categoryChips = [];
    for (int i = start; i < end; i++)
      categoryChips.add(
        CategoryChip(
          key: Key(categories[i].title),
          category: categories[i],
          onTap: () {
            if (selectedCategories.length >= categoriesLimit && !categories[i].isSelected) {
              Toast.show('You can\'t select more than $categoriesLimit categories', context, duration: 3);
              return;
            }
            setState(() {
              categories[i].isSelected = !categories[i].isSelected;
              if (categories[i].color != null && categories[i].isSelected)
                backgroundColor = categories[i].color;
            });
          },
        ),
      );
    return categoryChips;
  }

  void setCategorySelection(bool isSelected, int index) {
    categories[index]?.isSelected = isSelected;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(color: secondaryText, fontFamily: 'Comfortaa'),
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 50.0,
                left: 20.0,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  color: Colors.grey,
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      backgroundColor.withOpacity(0.85),
                      Color(0xff5b7fc9).withOpacity(0.7),
                    ],
                    stops: [0.45, 1.0],
                  ),
                ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: _buildCategoriesRow(
                              end: categoriesHalfIndex,
                            ),
                          ),
                          Row(
                            children: _buildCategoriesRow(
                              start: categoriesHalfIndex,
                              end: categories.length,
                            ),
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
                              noCategoriesSelected
                                  ? 'No Categories selected'
                                  : 'Selected Categories (${selectedCategories.length})',
                              style: TextStyle(
                                fontSize: AppFont.md,
                                color: noCategoriesSelected ? secondary : null,
                              ),
                            ),
                            SizedBox(
                              height: AppSpace.xs - 5,
                            ),
                            Wrap(
                              spacing: AppSpace.xs,
                              children: selectedCategories
                                  .map((category) => Chip(
                                        key: Key(category.title),
                                        label: Text(category.title),
                                        elevation: 2.0,
                                        shadowColor: Colors.black45,
                                        onDeleted: () {
                                          category.isSelected = false;
                                          setState(() {});
                                        },
                                        deleteIconColor:
                                            Colors.red.withOpacity(0.7),
                                      ))
                                  .toList(),
                            ),
                            SizedBox(
                              height: AppSpace.lg + 5,
                            ),
                            Text(
                              'Timer Type',
                              style: TextStyle(fontSize: AppFont.md),
                            ),
                            SizedBox(height: AppSpace.xs - 5),
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
        onPressed: noCategoriesSelected
            ? null
            : () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Questions(
                              selectedCategories: selectedCategories,
                              timerType: _timerType,
                            )));
              },
        child: Icon(Icons.check),
        backgroundColor: noCategoriesSelected ? Colors.grey : backgroundColor,
        disabledElevation: 0,
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final Category category;
  final Function onTap;
  const CategoryChip({Key key, this.category, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.symmetric(
            vertical: AppSpace.sm, horizontal: AppSpace.md),
        margin: EdgeInsets.only(right: AppSpace.xs, top: AppSpace.xs),
        decoration: BoxDecoration(
          color: category.isSelected
              ? (secondaryText).withOpacity(0.3)
              : Colors.white30,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Text(
          category.title,
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}

enum TimerType { interval, express }
