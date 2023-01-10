import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prototype_practice/shape.dart';

class Rectangle extends Shape {
  late double height;
  late double width;

  Rectangle({
    required Color color,
    required this.height,
    required this.width,
  }) : super(color);

  Rectangle.initial([super.color = Colors.black]) {
    width = 100;
    height = 100;
  }

  Rectangle.clone(Rectangle source) : super.clone(source) {
    height = source.height;
    width = source.width;
  }

  @override
  Shape clone() {
    return Rectangle.clone(this);
  }

  @override
  void randomiseProperties() {
    color = Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      1.0,
    );
  }

  @override
  Widget render() {
    return SizedBox(
      height: 120.0,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(microseconds: 500),
          height: height,
          width: width,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          child: const Icon(
            Icons.star,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
