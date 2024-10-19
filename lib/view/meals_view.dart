import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';

class MealsView extends StatelessWidget {
  const MealsView({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meals.isEmpty
          ? const Center(
              child: Text("No meals avaliable."),
            )
          : ListView.builder(
            itemCount: meals.length,
              itemBuilder: (context, index) => Text(meals[index].title),
            ),
    );
  }
}
