import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:meal/models/dummy_data.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/pages/filter_screen.dart';

import 'package:meal/pages/meal_details_screen.dart';
import 'package:meal/pages/meal_items_screen.dart';
import 'package:meal/pages/tabs_screen.dart';
import 'package:meal/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void Function()? _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = dummyMeals.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
    return null;
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorie(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: ((ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.llightTheme(lightDynamic),
          darkTheme: AppTheme.darkTheme(darkDynamic),
          // Home/ROOT
          // home: const HomePage(),
          initialRoute: '/',
          routes: {
            // root
            '/': (context) => TabsScreen(favoriteMeals: _favoriteMeals),

            // meal screen
            MealScreen.routName: (context) =>
                MealScreen(availableMeals: _availableMeals),

            // meal details
            MealDetailsScreen.routName: (context) => MealDetailsScreen(
                  toggleFavorite: _toggleFavorite,
                  isMealFavorie: _isMealFavorie,
                ),

            // filter screen
            FilterScreen.routName: (context) => FilterScreen(
                  saveFilters: _setFilters,
                  currentFilters: _filters,
                ),
          },
        );
      }),
    );
  }
}
