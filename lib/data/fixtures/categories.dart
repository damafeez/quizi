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
    id: 17,
    color: Color(0xff5b7fc9),
  ),
  Category(
    title: 'History',
    id: 23,
  ),
  Category(
    title: 'General Knowledge',
    id: 9,
    color: Color(0xffE8774E),
  ),
  Category(
    title: 'Mathematics',
    id: 19,
  ),
  Category(
    title: 'Politics',
    id: 24,
    color: Color(0xffE8774E),
  ),
  Category(
    title: 'Sports',
    id: 21,
  ),
  Category(
    title: 'Cartoon and Animations',
    id: 32,
    color: Color(0xff941918),
  ),
  Category(
    id: 28,
    title: 'Vehicles',
  ),
  Category(
    title: 'Music',
    id: 12,
    color: Color(0xffdb5159),
  ),
  Category(
    title: 'Computers',
    id: 18,
    color: Color(0xffdb5159),
  ),
  Category(
    title: 'Celebrities',
    id: 26,
  ),
  Category(
    title: 'Video Games',
    id: 15,
  ),
  Category(
    title: 'Comics',
    id: 29,
    color: Color(0xff00d1b3),
  ),
  Category(
    title: 'Animals',
    id: 27,
    color: Color(0xff0bc6c0),
  ),
  Category(
    title: 'Art',
    id: 25,
  ),
  Category(
    title: 'Gography',
    id: 22,
    color: Color(0xff0093cc),
  ),
  Category(
    title: 'Mythology',
    id: 20,
  ),
];
