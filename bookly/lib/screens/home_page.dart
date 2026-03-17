import 'package:bookly/data/data.dart';
import 'package:bookly/screens/filters.dart';
import 'package:bookly/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List booksToShow = dummyBooks;
  List updatedBooks = [];

  void filterScreen() async {
    final filteredBooks = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const Filters()));

    print(filteredBooks);
    if (filteredBooks == null) {
      updatedBooks = [];
    } else {
      setState(() {
        updatedBooks = filteredBooks;
      });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).colorScheme.onTertiary,
              child: Text(
                updatedBooks.isEmpty ? 'Discover Latest Books' : 'Books',

                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                onPressed: () => filterScreen(),
                icon: updatedBooks.isEmpty
                    ? Icon(Icons.arrow_forward_ios)
                    : Icon(Icons.arrow_back_ios_new_outlined),
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: updatedBooks.isEmpty
                ? booksToShow.length
                : updatedBooks.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return CategoryGridItem(
                index: updatedBooks.isEmpty
                    ? booksToShow[index]
                    : updatedBooks[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
