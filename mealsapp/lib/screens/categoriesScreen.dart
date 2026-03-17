import 'package:flutter/material.dart';
import 'package:mealsapp/data/data.dart';
import 'package:mealsapp/model/mealsModel.dart';
import 'package:mealsapp/model/model.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/category_grid_item.dart';

class Categoriesscreen extends StatefulWidget {
  const Categoriesscreen({
    // required this.onToggleFav,
    required this.availableMeals,
    super.key,
  });

  final List<Meal> availableMeals;

  @override
  State<Categoriesscreen> createState() => _CategoriesscreenState();
}

class _CategoriesscreenState extends State<Categoriesscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, // means this entire class with the new calss merged
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // final Function(Meal meal) onToggleFav;
  void _selectCategory(BuildContext context, Model category) {
    final filteredMeals =
        widget.availableMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => Meals(
              title: category.title,
              meals: filteredMeals,
              // onToggleFav: onToggleFav,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              selectCat: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
      builder:
          (context, child) => SlideTransition(
            position: Tween(begin: Offset(0, 0.3), end: Offset(0, 0)).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            ),
            child: child,
          ),

      //Padding(
      //   padding: EdgeInsets.only(
      //     top: 100 - _animationController.value * 100,
      //   ),
      // ),
    );
  }
}
