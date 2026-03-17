import 'package:flutter/material.dart';
import 'package:mealsapp/model/mealsModel.dart';
import 'package:mealsapp/screens/selected_meals.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;
  // final Function(Meal meal) onToggleFav;

  void selectedMeal(BuildContext context, Meal meal) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => SelectedMeals(meals: meal ,)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder:
          (context, index) => MealItem(
            meal: meals[index],
            onSelectedMeal: (meal) {
              selectedMeal(context, meal);
            },
          ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh.... nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Try choosing another category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    } else {
      return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
    }
  }
}
