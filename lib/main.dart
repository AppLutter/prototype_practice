import 'package:flutter/material.dart';
import 'package:prototype_practice/circle.dart';
import 'package:prototype_practice/rectangle.dart';
import 'package:prototype_practice/shape.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrototypeExample(),
    );
  }
}

class PrototypeExample extends StatefulWidget {
  const PrototypeExample({Key? key}) : super(key: key);

  @override
  State<PrototypeExample> createState() => _PrototypeExampleState();
}

class _PrototypeExampleState extends State<PrototypeExample> {
  final Shape _circle = Circle.initial();
  final Shape _rectangle = Rectangle.initial();

  Shape? _circleClone;
  Shape? _rectangleClone;

  void _randomCircleProperties() {
    setState(() {
      _circle.randomiseProperties();
    });
  }

  void _cloneCircle() {
    setState(() {
      _circleClone = _circle.clone();
    });
  }

  void _randomRectangleProperties() {
    setState(() {
      _rectangle.randomiseProperties();
    });
  }

  void _cloneRectangle() {
    setState(() {
      _rectangleClone = _rectangle.clone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ShapeColumn(
                shape: _circle,
                shapeClone: _cloneCircle,
                onRandomisePropertiesPressed: _randomCircleProperties,
              ),
              ShapeColumn(
                shape: _rectangle,
                shapeClone: _cloneRectangle,
                onRandomisePropertiesPressed: _randomRectangleProperties,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShapeColumn extends StatelessWidget {
  const ShapeColumn({
    Key? key,
    required this.shape,
    required this.shapeClone,
    required this.onRandomisePropertiesPressed,
  }) : super(key: key);
  final Shape shape;
  final Function() shapeClone;
  final Function() onRandomisePropertiesPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        shape.render(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextButton(
            onPressed: shapeClone,
            child: Text(shapeClone.toString()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextButton(
            onPressed: onRandomisePropertiesPressed,
            child: Text(onRandomisePropertiesPressed.toString()),
          ),
        ),
      ],
    );
  }
}
