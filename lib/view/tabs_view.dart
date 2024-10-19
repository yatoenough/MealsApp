import 'package:flutter/material.dart';
import 'package:meals/view/categories_view.dart';
import 'package:meals/view/meals_view.dart';

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int _selectedViewIndex = 0;

  void _selectView(int index) {
    setState(() {
      _selectedViewIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget acticeView = const CategoriesView();
    var acticeViewTitle = 'Categories';

    if (_selectedViewIndex == 1) {
      acticeView = const MealsView(meals: []);
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
