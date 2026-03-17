import 'package:batman_quiz/StartPage.dart';
import 'package:batman_quiz/data/questions.dart';
import 'package:batman_quiz/question_screen.dart';
import 'package:batman_quiz/results.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  Widget? activeScreen;
  List<String> answers = [];

  @override
  void initState() {
    super.initState();
    activeScreen = StartPage(switchScreens);
  }

  void switchScreens() {
    setState(() {
      activeScreen = QuestionScreen(chosenAnswers);
    });
  }

  void chosenAnswers(String answer) {
    answers.add(answer);
    setState(() {
      if (answers.length == questions.length) {
        activeScreen = Results(restart, answers);
      }
    });
  }

  void restart() {
    setState(() {
      activeScreen = StartPage(switchScreens);
      answers = [];
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
