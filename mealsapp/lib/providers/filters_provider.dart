import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mealsapp/providers/meal_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersProvider extends StateNotifier<Map<Filter, bool>> {
  FiltersProvider()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegan: false,
        Filter.vegetarian: false,
      });

  void chosenFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProvider, Map<Filter, bool>>(
      (ref) => FiltersProvider(),
    );

final filteredMealsProvider = Provider((ref) { //this provider depends on other providers 
  final meals = ref.watch(meals_provider); //watch method here executes again and again evvery time state is changed
  final activeFilters = ref.watch(filtersProvider); // same here 

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
