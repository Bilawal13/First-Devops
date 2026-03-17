import 'package:bookly/data/data.dart';

import 'package:bookly/widgets/category_card.dart';
import 'package:flutter/material.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  void selectCategory(BuildContext context, String category) {
    var filteredBooks = [];
    filteredBooks = dummyBooks.where((book) {
      return book.categories.contains(category);
    }).toList();

    Navigator.of(context).pop(filteredBooks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 20,
          runSpacing: 20,
          children: availableCategories
              .map(
                (category) => CategoryCard(
                  categoryName: category.title,
                  color1: category.color,

                  onTap: () => selectCategory(context, category.id),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
