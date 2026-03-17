import 'package:flutter_riverpod/legacy.dart';
import 'package:mealsapp/model/mealsModel.dart';

class FavoritemealsProvider extends StateNotifier<List<Meal>> {
  FavoritemealsProvider() : super([]);

  bool toggleMealFavouriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritemealsProvider, List<Meal>>((ref) {
      return FavoritemealsProvider();
    });
