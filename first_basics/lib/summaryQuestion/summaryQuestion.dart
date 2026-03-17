import 'package:first_basics/summaryQuestion/summary_item.dart';
import 'package:flutter/material.dart';

class SummaryQuestion extends StatelessWidget {
  const SummaryQuestion(this.sum, {super.key});

  final List<Map<String, Object>> sum;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children:
              sum.map((data) {
                return SummaryItem(data);
              }).toList(),
        ),
      ),
    );
  }
}
