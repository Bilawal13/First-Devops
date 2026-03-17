import 'package:bookly/providers/wishlist_provider.dart';
import 'package:bookly/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Wishlist extends ConsumerWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FavBooks = ref.watch(wishListProvider);

    Widget activePage = GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: FavBooks.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => CategoryGridItem(index: FavBooks[index]),
    );

    if (FavBooks.isEmpty) {
      activePage = Center(
        child: Text(
          'Nothing here...',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 30,
          ),
        ),
      );
    }
    return activePage;
  }
}
