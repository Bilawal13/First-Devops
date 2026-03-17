import 'package:first_basics/summaryQuestion/summary_index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.sum, {super.key});

  final Map<String, Object> sum;

  @override
  Widget build(context) {
    final isCorrectAnswer = sum['correct_answer'] == sum['chosen_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SummaryIndex(
            questionIndex: sum['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  sum['question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  sum['chosen_answer'] as String,
                  style: TextStyle(color: Colors.lightBlueAccent),
                ),
                Text(
                  sum['correct_answer'] as String,
                  style: TextStyle(color: Colors.pink),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
