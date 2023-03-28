// Packages
import 'package:flutter/material.dart';

// Clean Architecture
import 'package:recipes/src/data/respositories_impl/recipes_repository_impl.dart';
import 'package:recipes/src/data/services/remote/recipes_services.dart';
import 'package:recipes/src/domain/models/detail_meal.dart';
import 'package:recipes/src/domain/models/meal.dart';
import 'package:recipes/src/domain/repositories/recipes_repository.dart';
import 'package:recipes/src/presentation/views/index.dart';

class SearchMealDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final RecipesRespository recipesRespository =
        RecipesRespositoryImpl(RecipesService());
    return SearchFuture(recipesRespository: recipesRespository, query: query);
    ;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final RecipesRespository recipesRespository =
        RecipesRespositoryImpl(RecipesService());
    return SearchFuture(recipesRespository: recipesRespository, query: query);
  }
}

class SearchFuture extends StatelessWidget {
  const SearchFuture({
    super.key,
    required this.recipesRespository,
    required this.query,
  });

  final RecipesRespository recipesRespository;
  final String query;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: recipesRespository.getMealsByName(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<DetailMealElement>? meals = snapshot.data?.meals;
          return meals != null
              ? ListView.builder(
                  itemCount: meals.length,
                  itemBuilder: (BuildContext context, int index) {
                    DetailMealElement meal = meals[index];
                    return ListTile(
                      onTap: () {
                        Meal newNeal = Meal(
                          strMeal: meal.strMeal,
                          strMealThumb: meal.strMealThumb,
                          idMeal: meal.idMeal,
                        );

                        Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments: DetailArguments(meal: newNeal),
                        );
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(meal.strMealThumb),
                      ),
                      title: Text(meal.strMeal),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    'No existe resultados para esta busqueda',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.3,
                      color: Colors.black54,
                      fontSize: 15,
                    ),
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
