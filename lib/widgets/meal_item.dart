import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/pages/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Challenging:
        return 'Challenging';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Cheap:
        return 'Cheap';
      case Affordability.Normal:
        return 'Normal';
      case Affordability.Expensive:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailsScreen.routName,
      arguments: id,
    )
        .then(
      (result) {
        if (result != null) {
          // removeItem(result);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      borderRadius: BorderRadius.circular(15),
      // hoverColor: Colors.blue,
      splashColor: Theme.of(context).primaryColor,
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    // width: 220,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        // bottomRight: Radius.circular(3),
                        topRight: Radius.circular(5),
                      ),
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 5.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule_sharp, size: 18),
                      const SizedBox(width: 8),
                      Text('$duration min'),
                    ],
                  ),
                  const SizedBox(width: 18),
                  Row(
                    children: [
                      const Icon(Icons.work_history_outlined, size: 18),
                      const SizedBox(width: 8),
                      Text(complexityText),
                    ],
                  ),
                  const SizedBox(width: 18),
                  Row(
                    children: [
                      const Icon(Icons.paid_outlined, size: 18),
                      const SizedBox(width: 8),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
