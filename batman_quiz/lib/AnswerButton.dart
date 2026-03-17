import 'package:flutter/material.dart';

class Answerbutton extends StatelessWidget {
  const Answerbutton(this.text, this.answer, {super.key});

  final String text;
  final void Function() answer;

  @override
  Widget build(context) {
    return ElevatedButton.icon(
      onPressed: answer,
      icon: Icon(Icons.arrow_circle_right_rounded),
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        iconColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      label: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
