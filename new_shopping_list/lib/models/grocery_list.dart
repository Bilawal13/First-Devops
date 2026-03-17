import 'package:new_shopping_list/models/category.dart';

class GroceryList {
  const GroceryList(this.id, this.name, this.quantity, this.category);

  final String id;
  final String name;
  final int quantity;
  final Category category;
}
