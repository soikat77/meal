import 'package:flutter/material.dart';
import 'package:meal/models/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routName = '/meal-details';
  final bool Function(String) isMealFavorie;
  final Function toggleFavorite;

  const MealDetailsScreen({
    super.key,
    required this.isMealFavorie,
    required this.toggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String?;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              sectionTitle(context, 'Ingredients'),
              buildContainer(
                context,
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
              sectionTitle(context, 'Steps'),
              buildContainer(
                context,
                ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          selectedMeal.steps[index],
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavorite(mealId);
        },
        child: Icon(
          isMealFavorie(mealId!) ? Icons.favorite : Icons.favorite_outline,
        ),
      ),
    );
  }

  Widget sectionTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      child: child,
    );
  }
}
