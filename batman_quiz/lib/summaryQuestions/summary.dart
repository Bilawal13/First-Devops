import 'package:batman_quiz/data/questions.dart';
import 'package:batman_quiz/summaryQuestions/summary_item.dart';
import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  Summary(this.sum, {super.key});

  final List<Map<String, Object>> sum;
  final currentQuestion = questions[0];
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children:
              sum.map((answer) {
                return SummaryItem(answer);
              }).toList(),
        ),
      ),
    );
  }
}
