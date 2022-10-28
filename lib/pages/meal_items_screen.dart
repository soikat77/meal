import 'package:flutter/material.dart';
import 'package:meal/models/dummy_data.dart';
import 'package:meal/widgets/meal_item.dart';

import '../models/meal.dart';

class MealScreen extends StatefulWidget {
  static const routName = '/category-meal';

  const MealScreen({super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  // String categoryId;
  late String categoryTitle;
  late List<Meal> displayedMeals;
  bool loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routArgs['title']!;
      final categoryId = routArgs['id'];
      displayedMeals = dummyMeals.where(
        (meal) {
          return meal.categories.contains(categoryId);
        },
      ).toList();
      loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: displayedMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              removeItem: _removeMeal,
            );
          },
        ),
      ),
    );
  }
}
