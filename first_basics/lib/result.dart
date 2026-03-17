import 'package:flutter/material.dart';
import 'package:first_basics/data/questions.dart';
import 'package:first_basics/summaryQuestion/summaryQuestion.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.answers, required this.restart});

  final void Function() restart;
  final List<String> answers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < answers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'chosen_answer': answers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final totalCorrect =
        summaryData.where((data) {
          return data['chosen_answer'] == data['correct_answer'];
        }).length;

    return Center(
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Answered $totalCorrect out of $totalQuestions Questions Correctly!',
              style: GoogleFonts.lato(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            SummaryQuestion(getSummaryData()),
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: restart,
              icon: Icon(Icons.restart_alt),
              label: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
