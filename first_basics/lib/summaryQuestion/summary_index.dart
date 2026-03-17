import 'package:flutter/material.dart';

class SummaryIndex extends StatelessWidget {
  const SummaryIndex({
    super.key,
    required this.questionIndex,
    required this.isCorrectAnswer,
  });

  final bool isCorrectAnswer;
  final int questionIndex;

  @override
  Widget build(context) {
    final questionNumber = questionIndex + 1;
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer ? Colors.lightBlueAccent : Colors.pink,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
