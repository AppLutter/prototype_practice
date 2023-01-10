import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prototype_practice/shape.dart';

class Circle extends Shape {
  late double radius;

  Circle(super.color, this.radius);

  Circle.initial([super.color = Colors.black]) {
    radius = 50.0;
  }

  Circle.clone(Circle source) : super.clone(source) {
    radius = source.radius;
  }

  @override
  Shape clone() {
    return Circle.clone(this);
  }

  @override
  void randomiseProperties() {
    color = Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      1.0,
    );

    radius = Random().nextInt(50).toDouble();
  }

  @override
  Widget render() {
    return SizedBox(
      height: 120.0,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(microseconds: 500),
          height: 2 * radius,
          width: 2 * radius,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: const Icon(
            Icons.star,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
