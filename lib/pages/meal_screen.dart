import 'package:flutter/material.dart';
import 'package:meal/models/dummy_data.dart';
import 'package:meal/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  static const routName = '/category-meal';

  const MealScreen({super.key});
  // final String categoryId;
  // final String categoryTitle;

  // const MealScreen({
  //   super.key,
  //   required this.categoryId,
  //   required this.categoryTitle,
  // });

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routArgs['title'];
    final categoryId = routArgs['id'];
    final categoryMeals = dummyMeals.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            );
          },
        ),
      ),
    );
  }
}
