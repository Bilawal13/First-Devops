import 'package:flutter/material.dart';
import 'package:first_basics/data/questions.dart';
import 'package:first_basics/AnswerButton.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.chooseAnswers});

  final void Function(String text) chooseAnswers;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentIndex = 0;

  void answerQuestion(String answers) {
    widget.chooseAnswers(answers);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentIndex];
    return Center(
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 92, 28, 104),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ...currentQuestion.shuffleList().map((answer) {
              return AnswerButton(
                text: answer,
                func: () {
                  answerQuestion(answer);
                },
              );
            }),
            // AnswerButton(text: currentQuestion.answers[0], func: () {}),
            // AnswerButton(text: currentQuestion.answers[1], func: () {}),
            // AnswerButton(text: currentQuestion.answers[2], func: () {}),
            // AnswerButton(text: currentQuestion.answers[3], func: () {}),
          ],
        ),
      ),
    );
  }
}
