import 'package:flutter/material.dart';
import 'package:first_app/GradientContainer.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(body: GradientContainer(Colors.pink, Colors.pinkAccent)),
    ),
  );
}
