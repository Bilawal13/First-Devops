import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.func});

  final String text;
  final void Function() func;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlue,
      ),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
