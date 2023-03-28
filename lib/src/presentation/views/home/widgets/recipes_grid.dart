// Packages
import 'package:flutter/material.dart';

// Models
import 'package:recipes/src/domain/models/meal.dart';

// Clean Architecture
import 'package:recipes/src/data/respositories_impl/recipes_repository_impl.dart';
import 'package:recipes/src/data/services/remote/recipes_services.dart';
import 'package:recipes/src/domain/repositories/recipes_repository.dart';
import 'package:recipes/src/presentation/widgets/cards/meal_card.dart';

class RecipesGrid extends StatelessWidget {
  const RecipesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipesRespository recipesRespository =
        RecipesRespositoryImpl(RecipesService());
    return FutureBuilder(
      future: recipesRespository.getMeals(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<Meal> meals = snapshot.data!.meals;
          return SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ...List.generate(
                  meals.length <= 10 ? meals.length : 10,
                  (index) {
                    Meal meal = meals[index];
                    return MealCard(meal: meal);
                  },
                )
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const Text(
          'Ha ocurrido un error, por favor inténtalo de nuevo más tarde',
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.3,
            color: Colors.black54,
            fontSize: 20,
          ),
        );
      },
    );
  }
}
