import 'package:flutter/material.dart';
import 'package:meals/screens/Categories.dart';
import 'package:meals/screens/MealScreen.dart';

class TabScreenState extends StatefulWidget {
  const TabScreenState({super.key});

  @override
  State<TabScreenState> createState() {
    return _TabScreenStateState();
  }
}

class _TabScreenStateState extends State<TabScreenState> {
  int _selectPageIndex = 0;
  String activePageTitle = 'Categories';

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
      activePageTitle = 'Your Favorites';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CathegoriesScreen();
    if (_selectPageIndex == 1) {
      activePage = const MealScreen(
        meals: [],
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
