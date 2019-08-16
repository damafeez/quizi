

import 'package:flutter/material.dart';
import 'package:quiz/data/models/category.dart';
import 'package:quiz/resources/colors.dart';
import 'package:quiz/resources/sizes.dart';

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