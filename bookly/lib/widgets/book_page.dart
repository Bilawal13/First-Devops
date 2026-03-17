import 'package:bookly/models/books_model.dart';
import 'package:bookly/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookPage extends ConsumerWidget {
  const BookPage({required this.data, super.key});

  final BooksModel data;

  void toggleFav(BooksModel book) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFavs = ref.watch(wishListProvider);

    final isFav = activeFavs.contains(data);

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        actions: [
          IconButton(
            onPressed: () {
              final AddedtoList = ref
                  .read(wishListProvider.notifier)
                  .toggleListStatus(data);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AddedtoList
                        ? 'Book added to wishlist'
                        : 'Book removed from wishlist',
                  ),
                ),
              );
            },
            icon: isFav ? Icon(Icons.star) : Icon(Icons.star_border),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(
              data.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Price : ${data.price} \$",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 30,
                  ),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  label: Text(
                    'Purchase',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 15,
                    ),
                  ),
                  icon: Icon(Icons.shopify_sharp),
                  style: ElevatedButton.styleFrom(
                    iconColor: Theme.of(context).colorScheme.secondary,
                    iconSize: 30,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
