import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_shopping_list/data/categories.dart';
//import 'package:new_shopping_list/data/categories.dart';
//import 'package:new_shopping_list/data/dummy.dart';
//import 'package:new_shopping_list/models/category.dart';
import 'package:new_shopping_list/models/grocery_list.dart';
import 'package:new_shopping_list/widgets/new_item.dart';
//import 'package:new_shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryItems extends StatefulWidget {
  const GroceryItems({super.key});

  @override
  State<GroceryItems> createState() => _GroceryItemsState();
}

class _GroceryItemsState extends State<GroceryItems> {
  var _loading = true;
  List<GroceryList> _groceryItems = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() async {
    final url = Uri.https(
      'shopping-list-3dcc2-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );

    final response = await http.get(url);

    print(response.body);

    if (response.body == 'null') {
      setState(() {
        _loading = false;
      });
    }

    final Map<String, dynamic> resData = json.decode(response.body);
    List<GroceryList> loadedItems = [];

    for (final item in resData.entries) {
      final cat = categories.entries.firstWhere(
        (catItem) => catItem.value.title == item.value['category'],
      );

      loadedItems.add(
        GroceryList(
          item.key,
          item.value['name'],
          item.value['quantity'],
          cat.value,
        ),
      );
    }

    setState(() {
      _groceryItems = loadedItems;
      _loading = false;
    });
  }

  void _addItem() async {
    final newItem = await Navigator.of(
      context,
    ).push<GroceryList>(MaterialPageRoute(builder: (ctx) => NewItem()));

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryList item) {
    setState(() {
      _groceryItems.remove(item);
    });
    final url = Uri.https(
      'shopping-list-3dcc2-default-rtdb.firebaseio.com',
      'shopping-list/${item.id}.json',
    );

    http.delete(url);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        itemBuilder:
            (ctx, index) => Dismissible(
              onDismissed: (direction) {
                _removeItem(_groceryItems[index]);
              },
              key: ValueKey(_groceryItems[index].id),
              child: ListTile(
                title: Text(_groceryItems[index].name),
                leading: Container(
                  height: 16,
                  width: 16,
                  color: _groceryItems[index].category.color,
                ),
                trailing: Text(_groceryItems[index].quantity.toString()),
              ),
            ),

        itemCount: _groceryItems.length,
      ),
    );

    if (_groceryItems.isEmpty) {
      content = Center(child: Text('No Items Added Yet'));
    }

    if (_loading == true) {
      content = Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),

      body: content,
    );
  }
}
