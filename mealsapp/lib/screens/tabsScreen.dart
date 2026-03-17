import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categoriesScreen.dart';
import 'package:mealsapp/screens/filters.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mealsapp/providers/meal_provider.dart';
import 'package:mealsapp/providers/favoriteMeals_provider.dart';
import 'package:mealsapp/providers/filters_provider.dart';

const kInitialFilters = {
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
  Filter.glutenFree: false,
};

class Tabsscreen extends ConsumerStatefulWidget {
  //in place of stateful
  const Tabsscreen({super.key});

  @override
  ConsumerState<Tabsscreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<Tabsscreen> {
  var currentIndex = 0;
  // var _selectedFilters = kInitialFilters;

  // final List<Meal> _favoriteMeals = [];
  // void _showSnackBar(String text) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  // }

  // void _isFavoriteMeal(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);

  //   if (isExisting) {
  //     setState(() {
  //       _favoriteMeals.remove(meal);
  //       _showSnackBar("Meal Has Been Removed From Favourites!");
  //     });
  //   } else {
  //     setState(() {
  //       _favoriteMeals.add(meal);
  //       _showSnackBar("Meal Has Been Added To Favourites!");
  //     });
  //   }
  // }

  void switchScreen(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'Filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => FiltersScreen()),
      );
      // Navigator.of( alternate
      //     context,
      //   ).pushReplacement(MaterialPageRoute(builder: (ctx) => const FiltersScreen()));

      // setState(() {
      //   _selectedFilters = result ?? kInitialFilters;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    // final meals = ref.watch(meals_provider);
    // final activeFilters = ref.watch(filtersProvider);
    // final availableCategories =
    // meals.where((meal) {
    //   if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.vegan]! && !meal.isVegan) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
    //     return false;
    //   }
    //   return true;
    // }).toList();

    Widget activePage = Categoriesscreen(
      //onToggleFav: _isFavoriteMeal,
      availableMeals: availableMeals,
    );
    String activeTitle = "Categories";

    if (currentIndex == 1) {
      final favMeals = ref.watch(favoriteMealsProvider);
      activePage = Meals(meals: favMeals);
      activeTitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: switchScreen,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.start), label: 'Favorites'),
        ],
      ),
    );
  }
}
