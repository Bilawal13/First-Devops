import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _diceRoller();
  }
}

class _diceRoller extends State<DiceRoller> {
  var activeDice = 'lib/assets/images/dice-1.png';

  void RollDice() {
    setState(() {
      var rand = Random().nextInt(6) + 1;
      activeDice = 'lib/assets/images/dice-$rand.png';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(activeDice, width: 200),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: RollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.amberAccent,
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: Text("Roll Dice"),
        ),
      ],
    );
  }
}
