import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  const StartPage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Opacity(
          //   opacity: 0.6,
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(151, 255, 255, 255),
          ),
          //),
          SizedBox(height: 50),
          Text(
            'Learn Flutter The Fun Way!',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.start_outlined, color: Colors.white),
            label: Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
