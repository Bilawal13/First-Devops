import 'package:batman_quiz/summaryQuestions/summary_index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.sum, {super.key});

  final Map<String, Object> sum;

  @override
  Widget build(context) {
    final isCorrect = sum['correctAnswer'] == sum['chosenAnswer'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SummaryIndex(correct: isCorrect, index: sum['question_index'] as int),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sum['question'] as String,
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 6),
                Text(
                  sum['correctAnswer'] as String,
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  sum['chosenAnswer'] as String,
                  style: TextStyle(
                    color: isCorrect ? Colors.yellow : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
