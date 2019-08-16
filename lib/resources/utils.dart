

import 'dart:math';

int randomIntegerFromRange(int min, int max) {
  Random _random = Random();
  return min + _random.nextInt(max - min);
}