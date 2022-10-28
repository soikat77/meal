import 'package:flutter/material.dart';
import 'package:meal/pages/category_screen.dart';
import 'package:meal/pages/favorite_screen.dart';
import 'package:meal/pages/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': const CategoryPage(),
      'title': 'Meals Category',
    },
    {
      'page': const FavoriteScreen(),
      'title': 'Your Favorite Meal',
    },
  ];

  // select and show the selected page from tab
  int _selectedPageIndex = 0;
  void _selectTab(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Meals'),
    //       bottom: const TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category_outlined),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star_border_outlined),
    //             text: 'Favorites',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: const TabBarView(
    //       children: [
    //         CategoryPage(),
    //         FavoriteScreen(),
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).toggleableActiveColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
