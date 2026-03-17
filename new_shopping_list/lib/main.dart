import 'package:flutter/material.dart';
import 'package:new_shopping_list/widgets/Grocery_items.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlueAccent,
          brightness: Brightness.dark,
          onSurface: Colors.blueGrey,
        ),
      ),
      home: GroceryItems(),
    );
  }
}
