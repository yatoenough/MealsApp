import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/filter_enum.dart';
import 'package:meals/providers/filters_provider.dart';

final mealsProvider = Provider(
  (ref) {
    return dummyMeals;
  },
);

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where(
    (meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    },
  ).toList();
});
