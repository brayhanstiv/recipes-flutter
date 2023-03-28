import 'package:recipes/src/data/services/remote/recipes_services.dart';
import 'package:recipes/src/domain/models/category.dart';
import 'package:recipes/src/domain/models/detail_meal.dart';
import 'package:recipes/src/domain/models/meal.dart';
import 'package:recipes/src/domain/repositories/recipes_repository.dart';

class RecipesRespositoryImpl implements RecipesRespository {
  final RecipesService recipesService;

  RecipesRespositoryImpl(this.recipesService);

  @override
  Future<Categories> getCategories() {
    return recipesService.getCategories();
  }

  @override
  Future<Meals> getMealsByCategory(String name) {
    return recipesService.getMealsByCategory(name);
  }

  @override
  Future<DetailMeal> getMealById(String id) {
    return recipesService.getMealById(id);
  }

  @override
  Future<Meals> getMeals() {
    return recipesService.getMeals();
  }

  @override
  Future<DetailMeal> getMealsByName(String name) {
    return recipesService.getMealsByName(name);
  }
}
