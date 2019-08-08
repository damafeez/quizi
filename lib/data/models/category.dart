
import 'package:flutter/material.dart';

class Category {
  final AssetImage image;
  final String title;
  final String description;
  final Color color;
  bool isSelected = false;

  Category({this.color, this.image, this.title, this.description});
}