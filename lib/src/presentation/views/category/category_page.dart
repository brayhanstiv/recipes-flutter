// Packages
import 'package:flutter/material.dart';

// Clean Architecture
import 'package:recipes/src/data/respositories_impl/recipes_repository_impl.dart';
import 'package:recipes/src/data/services/remote/recipes_services.dart';
import 'package:recipes/src/domain/repositories/recipes_repository.dart';

// Models
import 'package:recipes/src/domain/models/meal.dart';

// Widgets
import 'package:recipes/src/presentation/views/category/widgets/meals_grid.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipesRespository recipesRespository =
        RecipesRespositoryImpl(RecipesService());
    CategoryArguments args =
        ModalRoute.of(context)!.settings.arguments as CategoryArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('${args.name}\'s meals'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: recipesRespository.getMealsByCategory(args.name),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Meal> meals = snapshot.data!.meals;
            return MealsGrid(meals: meals);
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
      ),
    );
  }
}

class CategoryArguments {
  String name;

  CategoryArguments({
    required this.name,
  });
}
