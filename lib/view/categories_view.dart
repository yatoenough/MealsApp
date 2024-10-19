import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/view/meals_view.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MealsView(title: 'Title', meals: []),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick your category"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onCategorySelected: () => _selectCategory(context),
            )
        ],
      ),
    );
  }
}
