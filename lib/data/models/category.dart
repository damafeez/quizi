
import 'package:flutter/material.dart';

class Category {
  final AssetImage image;
  final String title;
  final String description;
  final Color color;
  final int id;
  bool isSelected = false;

  Category({@required this.title, this.id, this.color, this.image, this.description});
}