// Packages
import 'package:flutter/material.dart';

// Widgets
import 'package:recipes/src/presentation/views/home/widgets/category_grid.dart';
import 'package:recipes/src/presentation/views/home/widgets/recipes_grid.dart';
import 'package:recipes/src/presentation/views/home/widgets/search_meal_delegate.dart';
import 'package:recipes/src/presentation/widgets/text/main_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          onTap: () {
            showSearch(
              context: context,
              delegate: SearchMealDelegate(),
            );
          },
          title: const Text(
            'Search',
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: const Icon(Icons.search),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
              child: MainTitle(text: 'Recipes'),
            ),
            RecipesGrid(),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
              child: MainTitle(text: 'Categories'),
            ),
            CategoryGrid(),
          ],
        ),
      ),
    );
  }
}
