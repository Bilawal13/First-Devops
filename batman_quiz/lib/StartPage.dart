import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  const StartPage(this.fnc, {super.key});

  final void Function() fnc;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'THE BATMAN QUIZ',
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Image.asset('assets/images/bats.png', width: 300),
          SizedBox(height: 80),
          ElevatedButton.icon(
            onPressed: fnc,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            icon: Icon(Icons.start, color: Colors.yellow),
            label: Text('Start Quiz', style: TextStyle(color: Colors.yellow)),
          ),
          SizedBox(height: 50),
          Image.asset('assets/images/batman_logo.png', width: 300),
        ],
      ),
    );
  }
}
