import 'package:first_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:first_basics/startPage.dart';
import 'package:first_basics/questions_screen.dart';
import 'package:first_basics/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  List<String> chosenAnswers = [];
  Widget? activeScreen;
  //var activeScreen = 'start-screen'; // - way to get rid of initState if u want

  @override
  void initState() {
    super.initState();
    activeScreen = StartPage(switchScreen);
  }

  void restart() {
    setState(() {
      activeScreen = StartPage(switchScreen);
    });
  }

  void chooseAnswers(String text) {
    chosenAnswers.add(text);
    if (chosenAnswers.length == questions.length) {
      setState(() {
        activeScreen = Result(answers: chosenAnswers, restart: restart);
        chosenAnswers = [];
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(chooseAnswers: chooseAnswers);
      //activeScreen = 'questions';
    });
  }

  @override
  Widget build(context) {
    // Widget screenWidget = StartPage(switchScreen);

    // if (activeScreen == 'questions') {
    //   screenWidget = const QuestionsScreen();
    // }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
          // activeScreen == 'start-screen' ? StartQuiz() : QuestionsScreen();
          //  screenWidget,
        ),
      ),
    );
  }
}
