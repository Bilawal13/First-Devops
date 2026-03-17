import 'package:flutter/material.dart';
import 'package:prac_first_app/GradientContainer.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(body: GradientContainer(Colors.black, Colors.blueGrey)),
    ),
  );
}
