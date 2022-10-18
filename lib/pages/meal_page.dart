import 'package:flutter/material.dart';

class MealPage extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const MealPage({
    super.key,
    required this.categoryId,
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('Page : $categoryTitle, id : $categoryId'),
      ),
    );
  }
}