import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability});

  void selectMeal() {
    // select the meal item and show details of it
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//         padding: const EdgeInsets.all(18),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [color.withOpacity(0.7), color],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Text(
//           title,
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//       ),