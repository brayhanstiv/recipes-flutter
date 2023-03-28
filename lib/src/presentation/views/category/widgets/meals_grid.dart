// Packages
import 'package:flutter/material.dart';
import 'package:recipes/src/domain/models/category.dart';

// Models
import 'package:recipes/src/domain/models/meal.dart';

// Widgets
import 'package:recipes/src/presentation/widgets/cards/meal_card.dart';

class MealsGrid extends StatelessWidget {
  final List<Meal> meals;

  const MealsGrid({
    super.key,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          Meal meal = meals[index];
          return MealCard(meal: meal);
        },
      ),
    );
  }
}
