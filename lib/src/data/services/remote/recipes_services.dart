// Packages
import 'dart:convert';

import 'package:http/http.dart' as http;

// Models
import 'package:recipes/src/domain/models/category.dart';
import 'package:recipes/src/domain/models/detail_meal.dart';
import 'package:recipes/src/domain/models/meal.dart';

class RecipesService {
  Future<Meals> getMeals() async {
    Uri uri = Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian');

    http.Response response = await http.get(uri);
    Map<String, dynamic> data = json.decode(response.body);
    Meals meals = Meals.fromJson(data);
    return meals;
  }

  Future<Categories> getCategories() async {
    Uri uri =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php');

    http.Response response = await http.get(uri);
    Map<String, dynamic> data = json.decode(response.body);
    Categories categories = Categories.fromJson(data);
    return categories;
  }

  Future<Meals> getMealsByCategory(String name) async {
    Uri uri =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$name');

    http.Response response = await http.get(uri);
    Map<String, dynamic> data = json.decode(response.body);
    Meals meals = Meals.fromJson(data);
    return meals;
  }

  Future<DetailMeal> getMealById(String id) async {
    Uri uri =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');

    http.Response response = await http.get(uri);
    Map<String, dynamic> data = json.decode(response.body);
    DetailMeal meal = DetailMeal.fromJson(data);
    return meal;
  }

  Future<DetailMeal> getMealsByName(String name) async {
    Uri uri =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$name');

    http.Response response = await http.get(uri);
    Map<String, dynamic> data = json.decode(response.body);
    DetailMeal meal = DetailMeal.fromJson(data);
    return meal;
  }
}
