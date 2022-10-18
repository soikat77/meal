import 'package:flutter/material.dart';

import 'category_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal'),
      ),
      body: const CategoryPage(),
    );
  }
}
