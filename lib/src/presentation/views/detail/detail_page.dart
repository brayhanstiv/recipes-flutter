// Packages
import 'package:flutter/material.dart';

// Clean Architecture
import 'package:recipes/src/data/respositories_impl/recipes_repository_impl.dart';
import 'package:recipes/src/data/services/remote/recipes_services.dart';
import 'package:recipes/src/domain/models/detail_meal.dart';
import 'package:recipes/src/domain/repositories/recipes_repository.dart';

// Models
import 'package:recipes/src/domain/models/meal.dart';
import 'package:recipes/src/presentation/widgets/badges/main_badge.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipesRespository recipesRespository =
        RecipesRespositoryImpl(RecipesService());
    DetailArguments args =
        ModalRoute.of(context)!.settings.arguments as DetailArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.meal.strMeal),
      ),
      body: FutureBuilder(
        future: recipesRespository.getMealById(args.meal.idMeal),
        builder: (builder, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            DetailMealElement meal = snapshot.data!.meals[0];
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(meal.strMealThumb),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meal.strMeal,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            MainBadge(
                              text: meal.strCategory,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 5),
                            MainBadge(
                              text: meal.strArea,
                              color: Colors.green,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          meal.strInstructions,
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
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
      ),
    );
  }
}

class DetailArguments {
  Meal meal;

  DetailArguments({
    required this.meal,
  });
}
