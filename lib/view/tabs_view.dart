import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/filter_enum.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/view/categories_view.dart';
import 'package:meals/view/filters_view.dart';
import 'package:meals/view/meals_view.dart';
import 'package:meals/widgets/main_drawer.dart';

var kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsView extends ConsumerStatefulWidget {
  const TabsView({super.key});

  @override
  ConsumerState<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends ConsumerState<TabsView> {
  int _selectedViewIndex = 0;

  void _selectView(int index) {
    setState(() {
      _selectedViewIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (context) => const FiltersView(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final avaliableMeals = ref.watch(filteredMealsProvider);

    Widget acticeView = CategoriesView(
      avaliableMeals: avaliableMeals,
    );
    var acticeViewTitle = 'Categories';

    if (_selectedViewIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      acticeView = MealsView(meals: favoriteMeals);
      acticeViewTitle = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(acticeViewTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
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
