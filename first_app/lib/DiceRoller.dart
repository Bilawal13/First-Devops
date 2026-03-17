import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRoller();
  }
}

final randomizer = Random();

class _DiceRoller extends State<DiceRoller> {
  // var activeDiceImage = 'assets/dice-1.png';
  var currentDiceRoll = 2;

  void rollDice() {
    // var dice = Random().nextInt(6) + 1;
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
      // activeDiceImage = 'assets/dice-$currentDiceRoll.png';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/dice-$currentDiceRoll.png', width: 200),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            //   padding: EdgeInsets.all(),
            foregroundColor: Colors.amber,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: Text('Roll Dice'),
        ),
      ],
    );
  }
}
