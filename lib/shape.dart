import 'package:flutter/widgets.dart';

abstract class Shape {
  late Color color;

  Shape(this.color);

  Shape.clone(Shape source) {
    color = source.color;
  }

  Shape clone();

  void randomiseProperties();

  Widget render();
}
