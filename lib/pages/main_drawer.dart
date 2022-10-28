import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meal/pages/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Have your own',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 28,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 18),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Filter',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(FilterScreen.routName);
            },
          ),
        ],
      ),
    );
  }
}
