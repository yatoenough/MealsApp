import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/category.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/view/meals_view.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
    required this.avaliableMeals,
  });

  final List<Meal> avaliableMeals;

  void _selectCategory(BuildContext context, Category category) {
    List<Meal> filteredMeals = avaliableMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsView(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
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
            onCategorySelected: () => _selectCategory(context, category),
          )
      ],
    );
  }
}
