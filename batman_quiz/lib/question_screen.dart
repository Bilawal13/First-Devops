import 'package:batman_quiz/AnswerButton.dart';
import 'package:batman_quiz/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.chosenAnswers, {super.key});

  final void Function(String text) chosenAnswers;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentIndex = 0;
  @override
  Widget build(context) {
    final currentQuestion = questions[currentIndex];

    void chooseAnswer(String answer) {
      setState(() {
        widget.chosenAnswers(answer);
        currentIndex++;
      });
    }

    return Center(
      child: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return Answerbutton(answer, () {
                chooseAnswer(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
