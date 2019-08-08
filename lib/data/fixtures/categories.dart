import 'package:flutter/material.dart';
import 'package:quiz/data/models/category.dart';

final List<Category> splashScreenCategories = [
  Category(
    image: AssetImage('assets/images/random.jpeg'),
    color: Color(0xffe09500),
    title: 'Random',
    description: 'Quiz yourself on Art, music,\nor something random',
  ),
  Category(
    image: AssetImage('assets/images/science.jpeg'),
    color: Color(0xffE8774E),
    title: 'Science and Nature',
    description: 'How do green plants feed,\ntalk, or dance?',
  ),
  Category(
    image: AssetImage('assets/images/general_knowledge.jpeg'),
    title: 'General Knowledge',
    color: Color(0xff941918),
    description: 'Why is an apple called,\nwell, "an apple"?',
  ),
];

final List<Category> categories = [
  Category(
    title: 'Science and Nature',
    color: Color(0xff5b7fc9),
  ),
  Category(
    title: 'History',
  ),
  Category(
    title: 'General Knowledge',
    color: Color(0xffE8774E),
  ),
  Category(
    title: 'Mathematics',
  ),
  Category(
    title: 'Sports',
  ),
  Category(
    title: 'Cartoon and Animations',
    color: Color(0xff941918),
  ),
  Category(
    title: 'Vehicles',
  ),
  Category(
    title: 'Computers',
    color: Color(0xffdb5159),
  ),
  Category(
    title: 'Celebrities',
  ),
  Category(
    title: 'Video Games',
  ),
  Category(
    title: 'Comics',
    color: Color(0xff00d1b3),
  ),
  Category(
    title: 'Animals',
    color: Color(0xff0bc6c0),
  ),
  Category(
    title: 'Art',
  ),
  Category(
    title: 'Gography',
    color: Color(0xff0093cc),
  ),
  Category(
    title: 'Mythology',
  ),
];