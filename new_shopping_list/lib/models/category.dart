import 'package:flutter/material.dart';

enum Categories { sweets, spices, dairy, others }

class Category {
  const Category(this.title, this.color);

  final String title;
  final Color color;
}
