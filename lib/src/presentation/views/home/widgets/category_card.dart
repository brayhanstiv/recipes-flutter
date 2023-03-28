// Packages
import 'package:flutter/material.dart';
import 'package:recipes/src/domain/models/category.dart';

// Pages
import '../../category/category_page.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        '/category',
        arguments: CategoryArguments(name: category.strCategory),
      ),
      child: SizedBox(
        width: size.width / 2.2,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(
                  category.strCategoryThumb,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                category.strCategory,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
