import 'package:flutter/material.dart';
import 'package:meal/pages/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routName = '/filters';
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filterrrr'),
      ),
    );
  }
}
