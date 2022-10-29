import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    // favoriteMeals.isEmpty
    //     ? const Center(
    //         child: Text('You Have no favorites meal yet -- start adding some'),
    //       )
    //     : const Center(
    //         child: Text('You Have no favorites meal yet -- start adding some'),
    //       );

    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You Have no favorites meal yet -- start adding some'),
      );
    } else {
      return Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text('Your Favorite meal is here'),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: favoriteMeals.length,
                itemBuilder: (context, index) {
                  return MealItem(
                    id: favoriteMeals[index].id,
                    title: favoriteMeals[index].title,
                    imageUrl: favoriteMeals[index].imageUrl,
                    duration: favoriteMeals[index].duration,
                    complexity: favoriteMeals[index].complexity,
                    affordability: favoriteMeals[index].affordability,
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}
