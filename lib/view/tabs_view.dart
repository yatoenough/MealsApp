import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/view/categories_view.dart';
import 'package:meals/view/meals_view.dart';

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int _selectedViewIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    if (_favouriteMeals.contains(meal)) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      _showInfoMessage('Removed from favorites');
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      _showInfoMessage('Marked as a favorite!');
    }
  }

  void _selectView(int index) {
    setState(() {
      _selectedViewIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget acticeView = CategoriesView(
      onToggleFavorite: _toggleMealFavouriteStatus,
    );
    var acticeViewTitle = 'Categories';

    if (_selectedViewIndex == 1) {
      acticeView = MealsView(
        meals: _favouriteMeals,
        onToggleFavorite: _toggleMealFavouriteStatus,
      );
      acticeViewTitle = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(acticeViewTitle),
      ),
      body: acticeView,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectView,
        currentIndex: _selectedViewIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ],
      ),
    );
  }
}
