// To parse this JSON data, do
//
//     final detailMeal = detailMealFromJson(jsonString);

import 'dart:convert';

DetailMeal detailMealFromJson(String str) =>
    DetailMeal.fromJson(json.decode(str));

String detailMealToJson(DetailMeal data) => json.encode(data.toJson());

class DetailMeal {
  DetailMeal({
    required this.meals,
  });

  List<DetailMealElement> meals;

  factory DetailMeal.fromJson(Map<String, dynamic> json) => DetailMeal(
        meals: List<DetailMealElement>.from(
            json["meals"].map((x) => DetailMealElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}

class DetailMealElement {
  DetailMealElement({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
    required this.strYoutube,
    required this.strArea,
    required this.strInstructions,
    required this.strCategory,
  });

  String strMeal;
  String strMealThumb;
  String idMeal;
  String strYoutube;
  String strArea;
  String strCategory;
  String strInstructions;

  factory DetailMealElement.fromJson(Map<String, dynamic> json) =>
      DetailMealElement(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
        strYoutube: json["strYoutube"],
        strArea: json["strArea"],
        strCategory: json["strCategory"],
        strInstructions: json["strInstructions"],
      );

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
        "strYoutube": strYoutube,
        "strArea": strArea,
        "strCategory": strCategory,
        "strInstructions": strInstructions,
      };
}
