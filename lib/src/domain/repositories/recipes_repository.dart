// Models
import 'package:recipes/src/domain/models/category.dart';
import 'package:recipes/src/domain/models/detail_meal.dart';
import 'package:recipes/src/domain/models/meal.dart';

abstract class RecipesRespository {
  Future<Meals> getMeals();
  Future<Categories> getCategories();
  Future<Meals> getMealsByCategory(String name);
  Future<DetailMeal> getMealById(String id);
  Future<DetailMeal> getMealsByName(String name);
}
