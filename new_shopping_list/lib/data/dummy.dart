import 'package:new_shopping_list/data/categories.dart';
import 'package:new_shopping_list/models/category.dart';
import 'package:new_shopping_list/models/grocery_list.dart';

final dummy_data = [
  GroceryList('a', 'chocolate', 12, categories[Categories.sweets]!),
  GroceryList('b', 'spice', 12, categories[Categories.spices]!),
];
