import 'package:bookly/models/books_model.dart';
import 'package:riverpod/legacy.dart';

class WishlistProvider extends StateNotifier<List<BooksModel>> {
  WishlistProvider() : super([]);

  bool toggleListStatus(BooksModel book) {
    final isBookListed = state.contains(book);

    if (isBookListed) {
      state = state.where((m) => m.id != book.id).toList();
      return false;
    } else {
      state = [...state, book];
      return true;
    }
  }
}

final wishListProvider =
    StateNotifierProvider<WishlistProvider, List<BooksModel>>((ref) {
      return WishlistProvider();
    });
