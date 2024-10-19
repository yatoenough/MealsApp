import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/view/meal_details_view.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsView extends StatelessWidget {
  const MealsView(
      {super.key,
      this.title,
      required this.meals,});

  final String? title;
  final List<Meal> meals;

  void _selectedMeal(context, meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealDetailsView(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var content = meals.isEmpty
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Uh oh... No meals avaliable!",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Try selecting a different category or different filters!",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                )
              ],
            ),
          )
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) => MealItem(
              meal: meals[index],
              onSelectedMeal: () => _selectedMeal(context, meals[index]),
            ),
          );

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
