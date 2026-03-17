import 'package:batman_quiz/data/questions.dart';
import 'package:batman_quiz/summaryQuestions/summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Results extends StatelessWidget {
  const Results(this.restart, this.answers, {super.key});

  final List<String> answers;
  final void Function() restart;

  List<Map<String, Object>> get SummaryData {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < answers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'chosenAnswer': answers[i],
        'correctAnswer': questions[i].answer[0],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final totalQuestions = questions.length;
    final correctQuestions =
        SummaryData.where((data) {
          return data['chosenAnswer'] == data['correctAnswer'];
        }).length;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You Answered $correctQuestions Out Of $totalQuestions Questions Correctly!',
            style: GoogleFonts.lato(
              color: Colors.yellow,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Summary(SummaryData),
          SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: restart,
            icon: Icon(Icons.restart_alt),
            style: OutlinedButton.styleFrom(
              iconColor: Colors.yellow,
              backgroundColor: Colors.black,
              foregroundColor: Colors.yellow,
            ),
            label: Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
