// Packages
import 'package:flutter/material.dart';

// Clean Architecture
import 'package:recipes/src/data/respositories_impl/recipes_repository_impl.dart';
import 'package:recipes/src/data/services/remote/recipes_services.dart';
import 'package:recipes/src/domain/repositories/recipes_repository.dart';

// Models
import 'package:recipes/src/domain/models/category.dart';
import 'package:recipes/src/presentation/views/home/widgets/category_card.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RecipesRespository recipesRespository =
        RecipesRespositoryImpl(RecipesService());
    return FutureBuilder(
      future: recipesRespository.getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<Category> categories = snapshot.data!.categories;
          return SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ...List.generate(
                  categories.length,
                  (index) {
                    Category category = categories[index];
                    return CategoryCard(category: category);
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
