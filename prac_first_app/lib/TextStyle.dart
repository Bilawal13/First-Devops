import 'package:flutter/material.dart';

class Text_Style extends StatelessWidget {
  const Text_Style(this.text, {super.key});
  final String text;
  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.blueGrey,
        backgroundColor: Colors.black12,
        fontSize: 20,
      ),
    );
  }
}
