import 'package:flutter/material.dart';

class SummaryIndex extends StatelessWidget {
  const SummaryIndex({super.key, required this.correct, required this.index});

  final bool correct;
  final int index;

  @override
  Widget build(context) {
    final int finalIndex = index + 1;
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: correct ? Colors.yellow : Colors.red,
        borderRadius: BorderRadius.circular(1000),
      ),
      alignment: Alignment.center,
      child: Text(
        finalIndex.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
